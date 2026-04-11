# R9 Test Animations - User Manual

## Overview
**R9 Test Animations** is a minimalist animation testing panel for FiveM. It allows you to preview and test animations from different animation packs with an intuitive interface.

---

## Installation & Setup

### Step 1: Place Animation Files
1. Locate the animation packs you've purchased (`.ycd` files)
2. Place them in the `stream/` folder of this resource
   ```
   r9_testanimations/stream/
   ├── r9@werewolf@one.ycd
   ├── fly@r9@one.ycd
   ├── r9@sword@atk@root@one.ycd
   └── ... (other .ycd files)
   ```

### Step 2: Enable Animation Packs
1. Open `configEnabledPacks.lua` in the resource folder
2. Set the animation pack you want to test to `true`:
   ```lua
   ConfigEnabledPacks = {
       werewolf = true,      -- Enable this pack
       ghoul = true,         -- Enable this pack
       vampire = false,      -- Disable this pack
       sword = true,         -- Enable this pack
       -- ... etc
   }
   ```
3. Save the file

### Step 3: Ensure your server.cfx
ensure r9_testanimations

---

## How to Use

### Opening the Menu
1. In-game, type the command: `/testanims`
2. The animation panel will open in the top-left corner of your screen

### Navigation Controls

| Key | Action |
|-----|--------|
| **↑ ↓** | Navigate through categories or animations |
| **ENTER** | Select category or play animation |
| **BACKSPACE** | Go back to previous menu or exit |

### Menu Structure

1. **First Screen - Categories**
   - Shows all enabled animation packs
   - Use arrow keys to highlight a category
   - Press ENTER to enter that category

2. **Second Screen - Animations**
   - Shows animations from selected category
   - **Solo Animations** - Play on your character only
   - **📌 Paired Animations** - Play with NPC (if available in this pack)
   - Use arrow keys to select an animation
   - Press ENTER to play it

3. **How can I tell which animation I used?**
   - Press F8; you'll see the print there

### Paired Animations
Some animations support NPC interactions (like werewolf vs werewolf fights, vampire feeding, etc.):
- Select **📌 Paired Animations** section
- Select the animation you want
- Press ENTER - an NPC will spawn and perform the animation with you
- The NPC will automatically disappear after the animation finishes

### Stopping an Animation
- Press **BACKSPACE** at any time to:
  - Stop the current animation
  - Go back to the category list
  - Close the menu entirely

---

## Configuration Files

### `configEnabledPacks.lua`
Controls which animation packs are visible in the menu:
```lua
ConfigEnabledPacks = {
    werewolf = true,         -- Werewolf animations
    ghoul = true,            -- Ghoul animations
    vampire = true,          -- Vampire animations (including feeding)
    sword = true,            -- Sword combat animations
    ability = true,          -- Ability animations
    fly = true,              -- Flight animations
    laptop = true,           -- Laptop/tablet animations
    potencejump = false,     -- Parkour/jump animations
    wallclimb = false,       -- Wall climbing animations
}
```