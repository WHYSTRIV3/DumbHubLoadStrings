local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("Rebirth Champions")

local Main = ui:new("Main")
local Egg = ui:new("Eggs")
local Potions = ui:new("Potions")
local Teleport = ui:new("Teleport")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
--Variables
local selectedEggs;
local SelectedTeleportTo;

local Codes = {"Release", "Alien", "500Likes", "3kLikes", "BeastPet349", "BeastPet491", "BeastPet550"}
local modulescrpt;
local SelectedCraftAll = "CraftAll"
local RebirthTable = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16","17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75"}
local SelectedRibirth;












-- Anti Afk
Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)



--functions

function getEggs()
    local Eggs = {}

    for _,v in pairs(WS.Scripts.Eggs:GetChildren()) do
        table.insert(Eggs, v.Name)
    end
    return Eggs
end

function getTeleportTo()
    local TeleportTo = {}

    for _,v in pairs(WS.Scripts.TeleportTo:GetChildren()) do
            table.insert(TeleportTo, v.Name)    
    end
    return TeleportTo
end






--Main

Main:CreateToggle("Auto Tap", true, function()
    RS.Events.Click3:FireServer()
end)

Main:CreateDropdown("Auto Rebirth Select", RebirthTable,  function(Reb)
    SelectedRebirth = Reb
    print(SelectedRebirth)
end)



Main:CreateToggle("Auto Rebirth", true, function()
    RS.Events.Rebirth:FireServer(tonumber(SelectedRebirth))
end)


Main:CreateToggle("Auto Daily Spin", true, function()
    RS.Functions.Spin:FireServer()
end)


Main:CreateButton("Unlock All GamePasses", function() 
    for _,v in pairs(Player.Passes:GetChildren()) do 
        if v.Value == false then
            if v.Name == "AutoChestCollect" then 
            else
                v.Value = true
            end   
        end
    end
end)




-- Eggs
Egg:CreateDropdown("Select Egg",getEggs(), function(Eggs)
    SelectedEggs = Eggs
end)

Egg:CreateToggle("Auto Egg", true, function()
    if SelectedEggs then
        RS.Functions.Unbox:InvokeServer(SelectedEggs,'Single')
    end
end)

Egg:CreateToggle("Auto Triple Egg", true, function()
    if SelectedEggs then
        RS.Functions.Unbox:InvokeServer(SelectedEggs,'Triple')
    end
end)

Egg:CreateToggle("Auto Craft All", true, function()
    local Selected = {}
    RS.Functions.Request:InvokeServer(SelectedCraftAll,Selected)
end)





-- Teleport

Teleport:CreateDropdown("Worlds", getTeleportTo(), function(TeleportTo)
    SelectedTeleportTo = TeleportTo;
    print(SelectedTeleportTo)
end)

Teleport:CreateButton("Teleport", function()
    if SelectedTeleportTo then
        local TeleportCFrame = WS.Scripts.TeleportTo[SelectedTeleportTo].CFrame
        Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
    end
end)







--Potions

Potions:CreateToggle("Auto Buy x2Clicks", true, function()
    local ohString1 = "x2Clicks"
    local ohNumber2 = 100
    game:GetService("ReplicatedStorage").Events.Potion:FireServer(ohString1, ohNumber2)
end)

Potions:CreateToggle("Auto Buy x2Gems", true, function()
    local ohString1 = "x2Gems"
    local ohNumber2 = 100
    game:GetService("ReplicatedStorage").Events.Potion:FireServer(ohString1, ohNumber2)
end)


Potions:CreateToggle("Auto Buy x2Luck", true, function()
    local ohString1 = "x2Luck"
    local ohNumber2 = 100
    game:GetService("ReplicatedStorage").Events.Potion:FireServer(ohString1, ohNumber2)
end)


Potions:CreateToggle("Auto Buy x2Rebirths", true, function()
    local ohString1 = "x2Rebirths"
    local ohNumber2 = 100
    game:GetService("ReplicatedStorage").Events.Potion:FireServer(ohString1, ohNumber2)
end)


Potions:CreateToggle("Auto Buy x2PetXP", true, function()
    local ohString1 = "x2PetXP"
    local ohNumber2 = 100
    game:GetService("ReplicatedStorage").Events.Potion:FireServer(ohString1, ohNumber2)
end)


Potions:CreateToggle("Auto Buy x2Clicks", true, function()
    local ohString1 = "x2HatchSpeed"
    local ohNumber2 = 100
    game:GetService("ReplicatedStorage").Events.Potion:FireServer(ohString1, ohNumber2)
end)





-- Misc


Misc:CreateButton("Redeem Codes", function()
    for _,v in pairs(Codes) do
        RS.EnterCode:FireServer(v)
    end
end)


Misc:CreateButton("Show/Hide FPS Counter", function()
	game:GetService("CoreGui")["UI V2"].FPStext.Visible = not game:GetService("CoreGui")["UI V2"].FPStext.Visible
	Ticking = not Ticking
end)


Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/8zzP4fXNFz")
end)

local TeleportService = game:GetService("TeleportService")

Misc:CreateButton("Uninject", function()
    game:GetService("CoreGui")["UI V2"]:Destroy()
end)

Misc:CreateButton("Uninject and Rejoin", function()
    game:GetService("CoreGui")["UI V2"]:Destroy()
    TeleportService:Teleport(game.PlaceId)
end)
