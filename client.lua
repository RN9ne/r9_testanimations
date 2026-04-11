-- ================================
-- R9 TEST ANIMATIONS
-- HTML NUI-based Animation Testing Panel
-- ================================

local menuOpen = false
local currentCategory = nil
local currentNPC = nil
local currentAnimationThread = nil
local enabledCategories = {}

-- ================================
-- UTILITY FUNCTIONS
-- ================================

local function GetEnabledCategories()
    local enabled = {}
    
    for categoryKey, category in pairs(ConfigAnimations) do
        if ConfigEnabledPacks[categoryKey] then
            -- Check if this category has any paired animations
            local hasPairedAnims = false
            local pairedAnims = {}
            local soloAnims = {}
            
            for _, anim in ipairs(category.animations) do
                if anim.paired then
                    hasPairedAnims = true
                    table.insert(pairedAnims, anim)
                else
                    table.insert(soloAnims, anim)
                end
            end
            
            table.insert(enabled, {
                key = categoryKey,
                label = category.label,
                allAnimations = category.animations,
                soloAnimations = soloAnims,
                pairedAnimations = pairedAnims,
                hasPairedAnims = hasPairedAnims
            })
        end
    end
    
    return enabled
end

local function SendUICallback(event, data)
    local payload = { type = event }
    if data then
        for key, value in pairs(data) do
            payload[key] = value
        end
    end
    SendNUIMessage(payload)
end

local function StopCurrentAnimation()
    local playerPed = PlayerPedId()
    ClearPedTasksImmediately(playerPed)
    SetPedCanRagdoll(playerPed, true)
    
    if currentNPC and DoesEntityExist(currentNPC) then
        ClearPedTasksImmediately(currentNPC)
        SetPedCanRagdoll(currentNPC, true)
    end

    if currentAnimationThread then
        SetTimeout(currentAnimationThread, function() end)
    end
end

local function CreateNPC()
    if currentNPC and DoesEntityExist(currentNPC) then
        ClearPedTasksImmediately(currentNPC)
        DeleteEntity(currentNPC)
    end

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local forward = GetEntityForwardVector(playerPed)
    local spawnCoords = playerCoords + forward * PairedAnimConfig.SpawnDistance

    local foundGround, groundZ = GetGroundZFor_3dCoord(spawnCoords.x, spawnCoords.y, spawnCoords.z + 10.0, 0)
    local finalCoords = vector3(spawnCoords.x, spawnCoords.y, foundGround and groundZ or spawnCoords.z)

    RequestModel(GetHashKey(PairedAnimConfig.PedModel))
    while not HasModelLoaded(GetHashKey(PairedAnimConfig.PedModel)) do Wait(10) end

    currentNPC = CreatePed(4, GetHashKey(PairedAnimConfig.PedModel), finalCoords.x, finalCoords.y, finalCoords.z, GetEntityHeading(playerPed), false, true)
    SetEntityInvincible(currentNPC, true)
    SetBlockingOfNonTemporaryEvents(currentNPC, true)
    SetPedCanRagdoll(currentNPC, false)
end

local function DeleteNPC()
    if currentNPC and DoesEntityExist(currentNPC) then
        ClearPedTasksImmediately(currentNPC)
        DeleteEntity(currentNPC)
        currentNPC = nil
    end
end

local function PlayAnimation(animData, isPaired)
    StopCurrentAnimation()

    local playerPed = PlayerPedId()
    local dictName = animData.dict
    local animName = animData.anim
    local flags = animData.flags or PairedAnimConfig.DefaultAnimationFlags

    RequestAnimDict(dictName)
    while not HasAnimDictLoaded(dictName) do Wait(10) end

    if isPaired and animData.paired then
        CreateNPC()
        
        if not currentNPC or not DoesEntityExist(currentNPC) then
            return
        end
        
        local playerCoords = GetEntityCoords(playerPed)
        local forward = GetEntityForwardVector(playerPed)
        
        local rawPos = playerCoords + forward * (animData.paired.distance or 0.8)
        local foundGround, groundZ = GetGroundZFor_3dCoord(rawPos.x, rawPos.y, rawPos.z + 10.0, 0)
        local npcZ = foundGround and groundZ or rawPos.z
        local npcPos = vector3(rawPos.x, rawPos.y, npcZ)

        local playerHeading = GetEntityHeading(playerPed)
        local npcHeading = (playerHeading + (animData.paired.npcHeadingOffset or 180.0)) % 360.0

        SetEntityCoords(currentNPC, npcPos.x, npcPos.y, npcPos.z)
        SetEntityHeading(currentNPC, npcHeading)

        SetEntityNoCollisionEntity(playerPed, currentNPC, true)
        SetEntityNoCollisionEntity(currentNPC, playerPed, true)

        SetPedCanRagdoll(playerPed, false)
        SetPedCanRagdoll(currentNPC, false)

        RequestAnimDict(dictName)
        while not HasAnimDictLoaded(dictName) do Wait(10) end

        TaskPlayAnim(playerPed, dictName, animName, 8.0, -8.0, -1, flags, 0, false, false, false)
        TaskPlayAnim(currentNPC, dictName, animData.paired.npcAnim, 8.0, -8.0, -1, flags, 0, false, false, false)
        
        print("^3Player play animation^7 " .. dictName .. " " .. animName)
        print("^3NPC play animation^7 " .. dictName .. " " .. animData.paired.npcAnim)

        -- Monitor animation and cleanup when finished
        if currentAnimationThread then
            SetTimeout(currentAnimationThread, function() end)
        end

        currentAnimationThread = CreateThread(function()
            Wait(500)
            local maxWait = PairedAnimConfig.AutoCleanupTime
            local elapsed = 500
            local checkInterval = 500
            
            while elapsed < maxWait do
                if not (currentNPC and DoesEntityExist(currentNPC)) then
                    break
                end
                
                local isPlaying = IsEntityPlayingAnim(playerPed, dictName, animName, 0)
                
                if not isPlaying then
                    local currentTime = GetEntityAnimCurrentTime(playerPed, dictName, animName)
                    local totalTime = GetEntityAnimTotalTime(playerPed, dictName, animName)
                    
                    if not (currentTime and totalTime) or currentTime >= totalTime then
                        break
                    end
                end
                
                Wait(checkInterval)
                elapsed = elapsed + checkInterval
            end
            
            if currentNPC and DoesEntityExist(currentNPC) then
                DeleteNPC()
            end
        end)
    else
        SetPedCanRagdoll(playerPed, false)
        TaskPlayAnim(playerPed, dictName, animName, 8.0, -8.0, -1, flags, 0, false, false, false)
        print("^3Player play animation^7 " .. dictName .. " " .. animName)
    end
end

-- ================================
-- NUI CALLBACKS
-- ================================

RegisterNUICallback('selectCategory', function(data, cb)
    local categoryIndex = data.categoryIndex + 1
    if enabledCategories[categoryIndex] then
        currentCategory = enabledCategories[categoryIndex]
        SendUICallback('setMenuMode', {
            mode = 'animations',
            category = currentCategory
        })
    end
    cb('ok')
end)

RegisterNUICallback('playAnimation', function(data, cb)
    if not currentCategory then
        cb('ok')
        return
    end

    local isPaired = data.isPaired or false
    local animIndex = data.animationIndex + 1
    
    local animations = isPaired and currentCategory.pairedAnimations or currentCategory.soloAnimations
    
    if animations[animIndex] then
        PlayAnimation(animations[animIndex], isPaired)
    end
    cb('ok')
end)

RegisterNUICallback('stopAnimation', function(data, cb)
    StopCurrentAnimation()
    if currentNPC and DoesEntityExist(currentNPC) then
        DeleteNPC()
    end
    cb('ok')
end)

RegisterNUICallback('closeMenu', function(data, cb)
    menuOpen = false
    SetNuiFocus(false, false)
    StopCurrentAnimation()
    if currentNPC and DoesEntityExist(currentNPC) then
        DeleteNPC()
    end
    cb('ok')
end)

-- ================================
-- INPUT HANDLING
-- ================================

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if menuOpen then
            -- Disable normal game input when menu is open
            DisableControlAction(0, 38, true)   -- E key
            DisableControlAction(0, 47, true)   -- G key
            DisableControlAction(0, 200, true)  -- ESC
            DisableControlAction(0, 199, true)  -- BACKSPACE (for menu navigation)
            DisableControlAction(0, 27, true)   -- Arrow Right
            DisableControlAction(0, 173, true)  -- Arrow Left
            DisableControlAction(0, 175, true)  -- Arrow Up
            DisableControlAction(0, 174, true)  -- Arrow Down
            DisableControlAction(0, 191, true)  -- ENTER/RETURN
            DisableControlAction(0, 24, true)   -- Attack 1
            DisableControlAction(0, 25, true)   -- Aim
            DisableControlAction(0, 47, true)   -- Weapon Wheel
        end
    end
end)

-- ================================
-- MENU COMMANDS
-- ================================

RegisterCommand("testanims", function()
    if not menuOpen then
        enabledCategories = GetEnabledCategories()
        if #enabledCategories == 0 then
            TriggerEvent('chat:addMessage', {
                color = {255, 0, 0},
                args = {'ERROR', 'No animation packs enabled in config!'}
            })
            return
        end
        menuOpen = true
        SetNuiFocus(true, false)
        SendUICallback('openMenu', {
            categories = enabledCategories
        })
    else
        menuOpen = false
        SetNuiFocus(false, false)
        StopCurrentAnimation()
        if currentNPC and DoesEntityExist(currentNPC) then
            DeleteNPC()
        end
        SendNUIMessage({type = 'closeMenu'})
    end
end)

-- ================================
-- RESOURCE START
-- ================================

Citizen.CreateThread(function()
    Wait(1000)
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        args = {'[TEST ANIMS]', 'Type /testanims to open the animation panel'}
    })
end)
