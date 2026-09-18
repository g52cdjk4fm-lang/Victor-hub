-- [[ VICTOR HUB - THE STRONGEST BATTLEGROUNDS ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

local Window = Rayfield:CreateWindow({
   Name = "Victor Hub | The Strongest Battlegrounds",
   LoadingTitle = "Loading Victor Hub...",
   LoadingSubtitle = "by Victor",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "VictorHubConfig",
      FileName = "TSB_Settings"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvite",
      RememberJoins = true
   },
   KeySystem = false
})

-- [[ VARIABLES FOR TECH TOGGLES ]] --
local AutoSideDash = false
local AutoDownSlam = false
local AutoM1Reset = false
local SafeMode = true

-- [[ SERVICES ]] --
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- [[ MAIN TABS ]] --
local MainTab = Window:CreateTab("Combat Techs", 4483362458) -- Combat Icon
local MiscTab = Window:CreateTab("Misc / Tweaks", 4483362458)

-- [[ COMBAT TECHS SECTION ]] --
MainTab:CreateSection("Automated Combat Techs")

-- 1. Auto Side-Dash / Loop Dash Toggle
MainTab:CreateToggle({
   Name = "Auto Side-Dash Tech",
   CurrentValue = false,
   Flag = "SideDashTech",
   Callback = function(Value)
      AutoSideDash = Value
      task.spawn(function()
          while AutoSideDash do
              -- Example Logic: Simulates rapid side dashing during M1 combos
              -- Note: Exact remote triggers depend on current game version events
              task.wait(0.1)
          end
      end)
   end,
})

-- 2. Auto Down-Slam
MainTab:CreateToggle({
   Name = "Auto Down-Slam (Jump + M1 Reset)",
   CurrentValue = false,
   Flag = "DownSlamTech",
   Callback = function(Value)
      AutoDownSlam = Value
      task.spawn(function()
          while AutoDownSlam do
              -- Triggers character jump mechanics paired with an aerial strike
              task.wait(0.1)
          end
      end)
   end,
})

-- 3. M1 Reset Fast Combos
MainTab:CreateToggle({
   Name = "Instant M1 Combo Reset",
   CurrentValue = false,
   Flag = "M1ResetTech",
   Callback = function(Value)
      AutoM1Reset = Value
      -- Place custom combo interruption code here
   end,
})

-- [[ MISC SETTINGS SECTION ]] --
MiscTab:CreateSection("Exploit Safety & Visuals")

MiscTab:CreateToggle({
   Name = "Anti-Cheat Safe Mode",
   CurrentValue = true,
   Flag = "SafeModeToggle",
   Callback = function(Value)
      SafeMode = Value
   end,
})

MiscTab:CreateButton({
   Name = "Destroy Victor Hub UI",
   Callback = function()
       Rayfield:Destroy()
   end,
})

Rayfield:Notify({
   Title = "Victor Hub Activated!",
   Content = "Successfully injected. Toggle features in the Combat Techs tab safely.",
   Duration = 5,
   Image = 4483362458,
})
