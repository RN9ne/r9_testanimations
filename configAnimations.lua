-- ================================
-- ANIMATION CATEGORIES CONFIG
-- ================================
-- Define animation categories, clips, and animation flags
-- Each animation can optionally have 'paired' data for NPC interactions

ConfigAnimations = {
    werewolf = {
        label = "Werewolf",
        animations = {
            -- Paired Animations
            {
                name = "Versus Attack 1",
                dict = "r9@werewolf@one",
                anim = "a_versus_atk",
                flags = 0,
                paired = {
                    npcAnim = "a_versus_vic",
                    distance = 0.8,
                    npcHeadingOffset = 180.0
                }
            },
            {
                name = "Versus Attack 2",
                dict = "r9@werewolf@one",
                anim = "b_versus_atk",
                flags = 0,
                paired = {
                    npcAnim = "b_versus_vic",
                    distance = 3.0,
                    npcHeadingOffset = 180.0
                }
            },
            -- Solo Attacks
            {
                name = "Attack One",
                dict = "r9@werewolf@one",
                anim = "a_attack_one",
                flags = 0
            },
            {
                name = "Attack Two",
                dict = "r9@werewolf@one",
                anim = "a_attack_two",
                flags = 0
            },
            {
                name = "Attack Three",
                dict = "r9@werewolf@one",
                anim = "a_attack_three",
                flags = 0
            },
            {
                name = "Attack Four",
                dict = "r9@werewolf@one",
                anim = "a_attack_four",
                flags = 0
            },
            {
                name = "B Attack One",
                dict = "r9@werewolf@one",
                anim = "b_attack_one",
                flags = 0
            },
            {
                name = "B Attack Two",
                dict = "r9@werewolf@one",
                anim = "b_attack_two",
                flags = 0
            },
            {
                name = "B Attack Three",
                dict = "r9@werewolf@one",
                anim = "b_attack_three",
                flags = 0
            },
            {
                name = "B Attack Four",
                dict = "r9@werewolf@one",
                anim = "b_attack_four",
                flags = 0
            },
            {
                name = "B Attack Five",
                dict = "r9@werewolf@one",
                anim = "b_attack_five",
                flags = 0
            },
            {
                name = "B Attack Six",
                dict = "r9@werewolf@one",
                anim = "b_attack_six",
                flags = 0
            },
            -- Misc Actions
            {
                name = "Buff",
                dict = "r9@werewolf@one",
                anim = "a_buff",
                flags = 1
            },
            {
                name = "Digging",
                dict = "r9@werewolf@one",
                anim = "a_digging",
                flags = 1
            },
            {
                name = "Eat",
                dict = "r9@werewolf@one",
                anim = "a_eat",
                flags = 1
            },
            {
                name = "Idle",
                dict = "r9@werewolf@one",
                anim = "a_idle",
                flags = 1
            },
            {
                name = "Roar",
                dict = "r9@werewolf@one",
                anim = "a_roar",
                flags = 0
            },
            {
                name = "Stun",
                dict = "r9@werewolf@one",
                anim = "a_stun",
                flags = 0
            },
            {
                name = "B Idle",
                dict = "r9@werewolf@one",
                anim = "b_idle",
                flags = 1
            },
            {
                name = "B Howl",
                dict = "r9@werewolf@one",
                anim = "b_howl",
                flags = 0
            },
            {
                name = "B Transform",
                dict = "r9@werewolf@one",
                anim = "b_transform",
                flags = 0
            },
            {
                name = "Dodge Left",
                dict = "r9@werewolf@one",
                anim = "b_dodge_left",
                flags = 0
            },
            {
                name = "Dodge Right",
                dict = "r9@werewolf@one",
                anim = "b_dodge_right",
                flags = 0
            },
            -- Locomotion
            {
                name = "Run",
                dict = "r9@werewolf@one",
                anim = "a_run",
                flags = 1
            },
            {
                name = "Sprint",
                dict = "r9@werewolf@one",
                anim = "a_sprint",
                flags = 1
            },
            {
                name = "Sprint NR",
                dict = "r9@werewolf@one",
                anim = "a_sprint_nr",
                flags = 1
            },
            {
                name = "Run NR",
                dict = "r9@werewolf@one",
                anim = "a_run_nr",
                flags = 1
            },
            {
                name = "B Walk",
                dict = "r9@werewolf@one",
                anim = "b_walk",
                flags = 1
            },
            {
                name = "B Walk NR",
                dict = "r9@werewolf@one",
                anim = "b_walk_nr",
                flags = 1
            },
            {
                name = "B Sprint",
                dict = "r9@werewolf@one",
                anim = "b_sprint",
                flags = 1
            },
            {
                name = "B Sprint NR",
                dict = "r9@werewolf@one",
                anim = "b_sprint_nr",
                flags = 1
            },
        }
    },

    ghoul = {
        label = "Ghoul",
        animations = {
            {
                name = "Master Animation",
                dict = "r9@ghoul",
                anim = "master",
                flags = 0,
                paired = {
                    npcAnim = "slave",
                    distance = 0.0,
                    npcHeadingOffset = 0.0
                }
            },
            {
                name = "Master Animation 2",
                dict = "r9@ghoul",
                anim = "master",
                flags = 0,
                paired = {
                    npcAnim = "slave2",
                    distance = 0.6,
                    npcHeadingOffset = 180.0
                }
            },
        }
    },

    vampire = {
        label = "Vampire",
        animations = {
            {
                name = "Feeding Master",
                dict = "r9@feed@new",
                anim = "master",
                flags = 0,
                paired = {
                    npcAnim = "slave",
                    distance = 0.8,
                    npcHeadingOffset = 180.0
                }
            },
            {
                name = "Feeding Master Start",
                dict = "r9@feed@new",
                anim = "master_start",
                flags = 0
            },
            {
                name = "Feeding Master Loop",
                dict = "r9@feed@new",
                anim = "master_loop",
                flags = 1
            },
            {
                name = "Feeding Master End",
                dict = "r9@feed@new",
                anim = "master_end",
                flags = 0
            },
            {
                name = "Feeding Full",
                dict = "r9@feed@down",
                anim = "feeding_full",
                flags = 1
            },
            {
                name = "Feeding Start",
                dict = "r9@feed@down",
                anim = "feeding_start",
                flags = 0
            },
            {
                name = "Feeding Loop",
                dict = "r9@feed@down",
                anim = "feeding_loop",
                flags = 1
            },
            {
                name = "Feeding End",
                dict = "r9@feed@down",
                anim = "feeding_end",
                flags = 0
            },
        }
    },

    sword = {
        label = "Sword",
        animations = {
            -- Attack Root One
            {
                name = "Kick",
                dict = "r9@sword@atk@root@one",
                anim = "kick",
                flags = 0
            },
            {
                name = "Move Medium",
                dict = "r9@sword@atk@root@one",
                anim = "move_med",
                flags = 0
            },
            {
                name = "Move Med Down L",
                dict = "r9@sword@atk@root@one",
                anim = "move_med_down_l",
                flags = 0
            },
            {
                name = "Move Med Down LL",
                dict = "r9@sword@atk@root@one",
                anim = "move_med_down_ll",
                flags = 0
            },
            {
                name = "Move Slow LUp",
                dict = "r9@sword@atk@root@one",
                anim = "move_slow_lup",
                flags = 0
            },
            {
                name = "Move Slow RDown",
                dict = "r9@sword@atk@root@one",
                anim = "move_slow_rdown",
                flags = 0
            },
            {
                name = "Move Slow Whirl",
                dict = "r9@sword@atk@root@one",
                anim = "move_slow_whirl",
                flags = 0
            },
            {
                name = "Move Strong LDown",
                dict = "r9@sword@atk@root@one",
                anim = "move_strong_ldown",
                flags = 0
            },
            -- Attack Root Two
            {
                name = "Place Fast Flow",
                dict = "r9@sword@atk@root@two",
                anim = "place_fast_flow",
                flags = 0
            },
            {
                name = "Place Fast LUp",
                dict = "r9@sword@atk@root@two",
                anim = "place_fast_lup",
                flags = 0
            },
            {
                name = "Place Fast RDown L",
                dict = "r9@sword@atk@root@two",
                anim = "place_fast_rdown_l",
                flags = 0
            },
            {
                name = "Place Fast RDown LL",
                dict = "r9@sword@atk@root@two",
                anim = "place_fast_rdown_ll",
                flags = 0
            },
            {
                name = "Place Slow LDown",
                dict = "r9@sword@atk@root@two",
                anim = "place_slow_ldown",
                flags = 0
            },
            -- Dodge
            {
                name = "Dodge Backward",
                dict = "r9@sword@dodge@root@one",
                anim = "dodge_bkw",
                flags = 0
            },
            {
                name = "Dodge Left",
                dict = "r9@sword@dodge@root@one",
                anim = "dodge_l",
                flags = 0
            },
            {
                name = "Dodge Right",
                dict = "r9@sword@dodge@root@one",
                anim = "dodge_r",
                flags = 0
            },
            -- Hit Reaction
            {
                name = "Hit Head Front",
                dict = "r9@sword@hitreact@root@one",
                anim = "hit_head_front",
                flags = 0
            },
            {
                name = "Hit Torso Right",
                dict = "r9@sword@hitreact@root@one",
                anim = "hit_torso_right",
                flags = 0
            },
            {
                name = "Hit Torso Left",
                dict = "r9@sword@hitreact@root@one",
                anim = "hit_torso_left",
                flags = 0
            },
            {
                name = "Hit Torso Front",
                dict = "r9@sword@hitreact@root@one",
                anim = "hit_torso_front",
                flags = 0
            },
            -- Locomotion Root
            {
                name = "Walk Forward (Root)",
                dict = "r9@sword@locomotion@root@one",
                anim = "w_forward",
                flags = 16
            },
            {
                name = "Walk Left (Root)",
                dict = "r9@sword@locomotion@root@one",
                anim = "w_left",
                flags = 16
            },
            {
                name = "Walk Backward (Root)",
                dict = "r9@sword@locomotion@root@one",
                anim = "w_bwd",
                flags = 16
            },
            {
                name = "Walk Right (Root)",
                dict = "r9@sword@locomotion@root@one",
                anim = "w_right",
                flags = 16
            },
            {
                name = "Idle (Root)",
                dict = "r9@sword@locomotion@root@one",
                anim = "w_idle",
                flags = 1
            },
            {
                name = "Holster On (Root)",
                dict = "r9@sword@locomotion@root@one",
                anim = "holster_on",
                flags = 0
            },
            {
                name = "Holster Off (Root)",
                dict = "r9@sword@locomotion@root@one",
                anim = "holster_off",
                flags = 0
            },
            -- Locomotion No Root
            {
                name = "Walk Forward (NoRoot)",
                dict = "r9@sword@locomotion@noroot@one",
                anim = "w_forward",
                flags = 16
            },
            {
                name = "Walk Left (NoRoot)",
                dict = "r9@sword@locomotion@noroot@one",
                anim = "w_left",
                flags = 16
            },
            {
                name = "Walk Backward (NoRoot)",
                dict = "r9@sword@locomotion@noroot@one",
                anim = "w_bwd",
                flags = 16
            },
            {
                name = "Walk Right (NoRoot)",
                dict = "r9@sword@locomotion@noroot@one",
                anim = "w_right",
                flags = 16
            },
            {
                name = "Idle (NoRoot)",
                dict = "r9@sword@locomotion@noroot@one",
                anim = "w_idle",
                flags = 1
            },
            {
                name = "Holster On (NoRoot)",
                dict = "r9@sword@locomotion@noroot@one",
                anim = "holster_on",
                flags = 0
            },
            {
                name = "Holster Off (NoRoot)",
                dict = "r9@sword@locomotion@noroot@one",
                anim = "holster_off",
                flags = 0
            },
            -- Other
            {
                name = "Swordplay",
                dict = "r9@sword@other@root@one",
                anim = "swordplay",
                flags = 1
            },
        }
    },

    ability = {
        label = "Ability",
        animations = {
            {
                name = "Blood Pack",
                dict = "r9@bh@partone",
                anim = "bloodpack",
                flags = 0
            },
            {
                name = "Body Armor",
                dict = "r9@bh@partone",
                anim = "bodyarmor",
                flags = 0
            },
            {
                name = "Claws",
                dict = "r9@bh@partone",
                anim = "claws",
                flags = 0
            },
            {
                name = "Domination All",
                dict = "r9@bh@partone",
                anim = "domination_all",
                flags = 0
            },
            {
                name = "Domination Loop",
                dict = "r9@bh@partone",
                anim = "domination_loop",
                flags = 1
            },
            {
                name = "Potence",
                dict = "r9@bh@partone",
                anim = "potence",
                flags = 0
            },
            {
                name = "Ritual",
                dict = "r9@bh@partone",
                anim = "ritual",
                flags = 1
            },
            {
                name = "Spear",
                dict = "r9@bh@partone",
                anim = "spear",
                flags = 0
            },
            {
                name = "Stimpack",
                dict = "r9@bh@partone",
                anim = "stimpack",
                flags = 0
            },
            {
                name = "Stutterstep 1",
                dict = "r9@bh@partone",
                anim = "stutterstep1",
                flags = 0
            },
            {
                name = "Stutterstep 2",
                dict = "r9@bh@partone",
                anim = "stutterstep2",
                flags = 0
            },
            {
                name = "Stutterstep 3",
                dict = "r9@bh@partone",
                anim = "stutterstep3",
                flags = 0
            },
            {
                name = "Syrenge",
                dict = "r9@bh@partone",
                anim = "syrenge",
                flags = 0
            },
            {
                name = "Telekinesis All",
                dict = "r9@bh@partone",
                anim = "telekinesis_all",
                flags = 1
            },
            {
                name = "Telekinesis Loop",
                dict = "r9@bh@partone",
                anim = "telekinesis_loop",
                flags = 1
            },
            {
                name = "Berserk",
                dict = "r9@berskerker",
                anim = "berserk",
                flags = 0
            },
            {
                name = "Magic",
                dict = "r9@berskerker",
                anim = "magic",
                flags = 0
            },
        }
    },

    fly = {
        label = "Fly",
        animations = {
            {
                name = "Forward",
                dict = "fly@r9@one",
                anim = "forward",
                flags = 1
            },
            {
                name = "Backward",
                dict = "fly@r9@one",
                anim = "backward",
                flags = 1
            },
            {
                name = "Right",
                dict = "fly@r9@one",
                anim = "right",
                flags = 1
            },
            {
                name = "Left",
                dict = "fly@r9@one",
                anim = "left",
                flags = 1
            },
            {
                name = "Idle",
                dict = "fly@r9@one",
                anim = "idle",
                flags = 1
            },
            {
                name = "Upwards",
                dict = "fly@r9@one",
                anim = "upwards",
                flags = 1
            },
            {
                name = "Down",
                dict = "fly@r9@one",
                anim = "down",
                flags = 1
            },
            {
                name = "Shift",
                dict = "fly@r9@one",
                anim = "shift",
                flags = 1
            },
            {
                name = "Grounded",
                dict = "fly@r9@one",
                anim = "grounding",
                flags = 0
            },
        }
    },

    laptop = {
        label = "Laptop",
        animations = {
            {
                name = "Hold One",
                dict = "r9@laptop@v2",
                anim = "hold_one",
                flags = 33
            },
            {
                name = "Sit Ground One",
                dict = "r9@laptop@v2",
                anim = "sit_ground_one",
                flags = 1
            },
            {
                name = "Sit Ground Two",
                dict = "r9@laptop@v2",
                anim = "sit_ground_two",
                flags = 1
            },
            {
                name = "Sit Three",
                dict = "r9@laptop@v2",
                anim = "sit_three",
                flags = 1
            },
            {
                name = "Sit Four",
                dict = "r9@laptop@v2",
                anim = "sit_four",
                flags = 1
            },
            {
                name = "Hold Tablet One",
                dict = "r9@laptop@v2",
                anim = "hold_tablet_one",
                flags = 48
            },
            {
                name = "Hold Tablet Two",
                dict = "r9@laptop@v2",
                anim = "hold_tablet_two",
                flags = 48
            },
            {
                name = "Stand One",
                dict = "r9@laptop@v2",
                anim = "stand_one",
                flags = 48
            },
            {
                name = "Hold Two",
                dict = "r9@laptop@v2",
                anim = "hold_two",
                flags = 33
            },
        }
    },

    potencejump = {
        label = "Potence Jump",
        animations = {
            {
                name = "Jump One",
                dict = "parkour@customnine",
                anim = "parkour_jmp_n_one",
                flags = 1
            },
            {
                name = "Jump Two",
                dict = "parkour@customnine",
                anim = "parkour_jmp_n_two",
                flags = 1
            },
            {
                name = "Jump Three",
                dict = "parkour@customnine",
                anim = "parkour_jmp_n_three",
                flags = 1
            },
        }
    },

    wallclimb = {
        label = "Wall Climb",
        animations = {
            {
                name = "Climb Front",
                dict = "wallclimb@r9@1",
                anim = "front",
                flags = 1
            },
            {
                name = "Climb Left",
                dict = "wallclimb@r9@1",
                anim = "left",
                flags = 1
            },
            {
                name = "Climb Right",
                dict = "wallclimb@r9@1",
                anim = "right",
                flags = 1
            },
            {
                name = "Climb Down",
                dict = "wallclimb@r9@2",
                anim = "down",
                flags = 1
            },
            {
                name = "Climb Idle",
                dict = "wallclimb@r9@2",
                anim = "idle",
                flags = 1
            },
        }
    },

    forcechocke = {
        label = "Force chocke",
        animations = {
            -- Paired Animations
            {
                name = "FullClip",
                dict = "r9@force@chocke",
                anim = "atk_full",
                flags = 0,
                paired = {
                    npcAnim = "vic_full",
                    distance = 2.5,
                    npcHeadingOffset = 180.0
                }
            },
            {
                name = "Loop",
                dict = "r9@force@chocke",
                anim = "atk_loop",
                flags = 1,
                paired = {
                    npcAnim = "vic_loop",
                    distance = 2.5,
                    npcHeadingOffset = 180.0
                }
            },
            {
                name = "ATK Start",
                dict = "r9@force@chocke",
                anim = "atk_start",
                flags = 0
            },
            {
                name = "ATK Loop",
                dict = "r9@force@chocke",
                anim = "atk_loop",
                flags = 1
            },
            {
                name = "ATK End",
                dict = "r9@force@chocke",
                anim = "atk_end",
                flags = 0
            },
            {
                name = "VIC Start",
                dict = "r9@force@chocke",
                anim = "vic_start",
                flags = 0
            },
            {
                name = "VIC Loop",
                dict = "r9@force@chocke",
                anim = "vic_loop",
                flags = 1
            },
            {
                name = "VIC End",
                dict = "r9@force@chocke",
                anim = "vic_end",
                flags = 0
            },
        }
    },

    caster = {
        label = "Cast Animations",
        animations = {
            {
                name = "Two Hand Cast",
                dict = "r9@caster",
                anim = "twohandcast",
                flags = 0
            },
            {
                name = "Two Hand Charge",
                dict = "r9@caster",
                anim = "twohandcharge",
                flags = 0
            },
            {
                name = "Two Hand High Cast",
                dict = "r9@caster",
                anim = "twohandhighcast",
                flags = 0
            },
            {
                name = "Ground Cast",
                dict = "r9@caster",
                anim = "groundcast",
                flags = 0
            },
            {
                name = "Left Cast Two",
                dict = "r9@caster",
                anim = "leftcasttwo",
                flags = 0
            },
            {
                name = "Left Cast One",
                dict = "r9@caster",
                anim = "leftcastone",
                flags = 0
            },
            {
                name = "Overhead Cast",
                dict = "r9@caster",
                anim = "overheadcast",
                flags = 0
            },
            {
                name = "Overhead Right Cast",
                dict = "r9@caster",
                anim = "overheadrightcast",
                flags = 0
            },
            {
                name = "Point Cast",
                dict = "r9@caster",
                anim = "pointcast",
                flags = 0
            },
            {
                name = "Right Cast One",
                dict = "r9@caster",
                anim = "rightcastone",
                flags = 0
            },
            {
                name = "Self Cast",
                dict = "r9@caster",
                anim = "selfcast",
                flags = 0
            },
            {
                name = "Wave Cast",
                dict = "r9@caster",
                anim = "wavecast",
                flags = 0
            },
        }
    },
}
