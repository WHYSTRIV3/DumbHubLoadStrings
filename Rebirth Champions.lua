
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V1Library.lua", true))()
local ui = Library:CreateWindow()

local Event = ui:new("Event")
local Main = ui:new("Main")
local Egg = ui:new("Eggs")
local tp = ui:new("Teleport")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"Release", "Alien", "500Likes", "3kLikes", "BeastPet349", "BeastPet491", "BeastPet550"}
local RebirthTable = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16","17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75"}
local Potions = {"x2Clicks", "x2Gems", "x2Luck", "x2Rebirths", "x2PetXP", "x2HatchSpeed"}
local Pass = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}
local CUPgrades = {"ClickMultiplier", "HatchSpeed", "BankSlots", "PetEquip", "GiftMultiplier", "LuckMultiplier"}

--Variables
local SelectedRibirth;
local SelectedCraftAll = "CraftAll"
local modulescrpt;
local selectedEggs;
local SelectedPortals;



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

function getPortals()
    local Portals = {}

    for _,v in pairs(WS.Scripts.Portals:GetChildren()) do
            table.insert(Portals, v.Name)    
    end
    return Portals
end



-- Event

Event:CreateToggle("Auto Collect Presents", true, function()
    for i, v in pairs(WS.Scripts.PresentsCollect.Storage:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)

Event:CreateToggle("Auto Collect Christmas Pass", true, function()
    for _,v in pairs(Pass) do
        RS.Functions.ChristmasPass:InvokeServer("normal", v)
    end
end)


Event:CreateToggle("Auto Christmas Upgrades", true, function()
    for _,v in pairs(CUPgrades) do
        RS.Functions.Upgrade:InvokeServer(v, "christmas")
    end
end)

Event:CreateToggle("Get Rid Of Notifacations", true, function()
    for _,v in pairs(game:GetService("StarterGui").MainUI.Error:GetChildren()) do 
        if v.Name == "Err" then 
              v:Destroy()
        end
    end
end)




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
    RS.Functions.Spin:InvokeServer()
end)


Main:CreateToggle("Auto Collect Chest", true, function()
    for i, v in pairs(WS.Scripts.Chests:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)


Main:CreateToggle("Auto Potions", true, function()
    for _,v in pairs(Potions) do
        RS.Events.Potion:FireServer(v, 100)
    end
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
















-- Teleport

tp:CreateDropdown("Worlds", getPortals(), function(Portals)
    SelectedPortals = Portals;
    print(SelectedPortals)
end)

tp:CreateButton("Teleport", function()
    if SelectedPortals then
        local TeleportCFrame = WS.Scripts.Portals[SelectedPortals].Touch.CFrame
        Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
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





--Potions








-- Misc


Misc:CreateButton("FPS Boost", function()
	local decalsyeeted = true
	local g = game
	T.WaterWaveSize = 0
	T.WaterWaveSpeed = 0
	T.WaterReflectance = 0
	T.WaterTransparency = 0
	LI.GlobalShadows = false
	LI.FogEnd = 9e9
	LI.Brightness = 0
	settings().Rendering.QualityLevel = "Level01"
	for _, v in pairs(g:GetDescendants()) do
		if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
			v.Enabled = false
		elseif v:IsA("MeshPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
			v.TextureID = 10385902758728957
		end
	end
	for _, e in pairs(LI:GetChildren()) do
		if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
			e.Enabled = false
		end
	end
end)

Misc:CreateButton("Redeem Codes", function()
    for _,v in pairs(Codes) do
        RS.EnterCode:FireServer(v)
    end
end)


Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/ups8GeuYAD")
end)
