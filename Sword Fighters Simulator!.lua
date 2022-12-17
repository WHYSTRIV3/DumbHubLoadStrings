
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V1Library.lua", true))()
local ui = Library:CreateWindow()

local Main = ui:new("Main")
local D = ui:new("Dungeon")
local Egg = ui:new("Eggs")
local tp = ui:new("Teleport")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"EGGMASTER", "ASCEND ", "Sharpen", "GETRICH ", "Dungeons ", "FeelingLucky ", "CELESTIAL", "Spraden", "Kolapo ", "STRONGEST "}
local RebirthTable = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16","17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75"}
local Teleports = {
    ["Spawn"] = CFrame.new(327, 24, -7) * CFrame.new(0,150,0),
    ["Skull Cove"] = CFrame.new(2233.26294, 149.863983, -611.65863) * CFrame.new(0,0,0),
    ["Demon Hill"] = CFrame.new(3947, 24, -383) * CFrame.new(0,150,0),
    ["Polar Tundra"] = CFrame.new( 5970.04833984375, 149.5572509765625, -529.3502807617188) * CFrame.new(0,0,0),
    ["UnderWorld"] = CFrame.new(13587.9443359375, 153.88711547851562, 86.26057434082031) * CFrame.new(0,0,0),
    ["Heaven"] = CFrame.new(8952.5048828125, 608.3098754882812, -501.4830017089844) * CFrame.new(0,0,0),
    ["Shiny Machine"] = CFrame.new(2176.33252, 151.134247, -627.441406) * CFrame.new(0,5,0),
    ["Enchant Table"] = CFrame.new(3865.47705, 151.705002, -408.174011) * CFrame.new(0,5,0),
    ["Celestials Machine"] = CFrame.new(8898.22461, 608.001709, -536.126831) * CFrame.new(0,5,0),
    ["Gift 1"] = CFrame.new(405.807983, 147.967346, -115.360138) * CFrame.new(0,5,0),
    ["Gift 2"] = CFrame.new(411.807983, 147.967346, -165.360138) * CFrame.new(0,5,0),
    ["Gift 3"] = CFrame.new(3929.94336, 148.881058, -498.32608) * CFrame.new(0,5,0),
    ["Gift 4"] = CFrame.new(9005.6875, 609.147034, -589.477051) * CFrame.new(0,5,0)
   
}

--Variables
local SelectedEggs;
local SelectedRebirth;
local SelectedSpawns;
local KANdistance = 400000000000000000000000000000;
local Teleport = true
local TweenWait = false
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions


function getEggs()
    local Eggs = {}
    for _,v in pairs(WS.Resources.EggStands:GetChildren()) do 
        table.insert(Eggs, v.Name)
    end
    return Eggs
end

function getTeleportNames()
    local TeleportsTab = {}

    for i,v in pairs(Teleports) do
        table.insert(TeleportsTab, i)
    end
    return TeleportsTab
end

function getWeapons()
    local Weapons = {}
    for _,v in pairs(Player.PlayerGui.WeaponInv.Background.ImageFrame.Window.WeaponHolder.WeaponScrolling:GetChildren()) do
        if v:IsA("Frame") then 
        table.insert(Weapons, v.Name)
        end
    end
    return Weapons
end




--Main
Main:CreateToggle("Auto Swing", true, function()
    RS.Packages.Knit.Services.ClickService.RF.Click:InvokeServer()
end)


Main:CreateToggle("Auto Kill Near", true, function()
    local nearest
    local NearestOne = KANdistance
    for _,v in pairs(WS.Live.NPCs.Client:GetDescendants()) do
        if v:IsA("Model") and v.Parent:IsA("Folder") then
            if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
                nearest = v
                NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
            end
        end
    end
    RS.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(nearest.Name)
end)



--[[
Main:CreateToggle("Auto Twween", true, function()
    for _,v in pairs(WS.Live.NPCs.Client:GetDescendants()) do
        if v:IsA("Model") and v.Parent:IsA("Folder") then
            local CFrameEnd = v:FindFirstChild("HumanoidRootPart").CFrame
            local Time = 1
            local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
            tween:Play()
            tween.Completed:Wait()
        end
     end
     RS.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(v.Name)
end)

--]]








Main:CreateToggle("Auto TP Farm", true, function()
    local nearest
    local NearestOne = 300
    for _,v in pairs(WS.Live.NPCs.Client:GetDescendants()) do
	if v:IsA("Model") and v.Parent:IsA("Folder") then
        if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
			end
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,0,0)
    end
	RS.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(nearest.Name)
end)





Main:CreateToggle("Auto Collect", true, function()
    for _,v in pairs(WS.Live.Pickups:GetChildren()) do
		local Time = 1
		local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(Time), {CFrame = Player.Character.HumanoidRootPart.CFrame})
		tween:Play()
		tween.Completed:Wait()
    end
end)



Main:CreateToggle("Auto Ascend", true, function()
    RS.Packages.Knit.Services.AscendService.RF.Ascend:InvokeServer()
end)



Main:CreateToggle("Auto Claim Chest", true, function()
game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.ClaimChest:InvokeServer("Chest 1")
end)


    
-- Dunegon

local AWAIT = false

D:CreateLabel("DungeonTimer", "something")

spawn(function()
    while task.wait() do
        D:EditLabel("DungeonTimer", "Dungeon Timer: "..WS.Resources.DungeonLobby.Timers["Dungeon 1"].Timer.TextLabel.Text)
    end
end)




D:CreateToggle("Auto Teleport Dungeon Lobby", true, function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(-1853.88831, -3.02373838, -130.304733, 0.0260146819, 7.00931313e-10, 0.999661565, -6.25612106e-12, 1, -7.01005809e-10, -0.999661565, 1.19824393e-11, 0.0260146819)
end)




D:CreateToggle("Auto Progress  Dungeon", true, function()
    if AWAIT == false then
        AWAIT = true

        if Player:GetAttribute("Dungeon") ~= nil then
            local Dungeon1 = Player:GetAttribute("Dungeon")
            RS.Packages.Knit.Services.DungeonService.RF.JoinDungeon:InvokeServer(Dungeon1)
            RS.Packages.Knit.Services.DungeonService.RF.ContinueDungeon:InvokeServer(Dungeon1)
        end
        if Player:GetAttribute("Dungeon") == nil then
            RS.Packages.Knit.Services.DungeonService.RF.LeaveDungeon:InvokeServer()
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(-1897.0542, -3.02373743, -134.818573, 0.0174497534, 3.7263181e-08, 0.99984777, -2.15320184e-09, 1, -3.72312776e-08, -0.99984777, -1.50319746e-09, 0.0174497534)
        end
        wait(1)
        AWAIT = false
    end
end)



D:CreateToggle("Auto Dungeon", true, function()
    local nearest
    local NearestOne = 300
    for _,v in pairs(WS.Live.NPCs.Client:GetDescendants()) do
	if v:IsA("Model") and v.Parent:IsA("Folder") then
        if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
			end
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,0,0)
    end
	RS.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(nearest.Name)

    RS.Packages.Knit.Services.DungeonService.RF.JoinDungeon:InvokeServer("ec5c93e0-19d7-4c0a-a731-904ae5d3b2a3")
    RS.Packages.Knit.Services.DungeonService.RF.ContinueDungeon:InvokeServer("ec5c93e0-19d7-4c0a-a731-904ae5d3b2a3")
    
end)











-- Teleport

tp:CreateDropdown("Select Teleport", getTeleportNames(), function(tp1)
    SelectedTeleport = tp1
    print(SelectedTeleport)
end)

tp:CreateButton("Teleport", function()
    if SelectedTeleport then
        Player.Character.HumanoidRootPart.CFrame = Teleports[SelectedTeleport]
    end
end)

tp:CreateButton("TP to Raid Ticket", function()
	Player.Character.HumanoidRootPart.CFrame = WS.Resources.TicketObbies["Free Ticket 1"].CFrame
end)

tp:CreateButton("TP to Raid Ticket2", function()
	Player.Character.HumanoidRootPart.CFrame = RS.SharedAssets.Chests["Free Ticket 2"].Part.CFrame
end)

tp:CreateButton("TP to Raid Ticket3", function()
	Player.Character.HumanoidRootPart.CFrame = RS.SharedAssets.Chests["Free Ticket 3"].Part.CFrame
end)





-- Eggs
Egg:CreateLabel("", "Need To TP To All Worlds Before Auto Egg")

Egg:CreateDropdown("Select Egg", getEggs(), function(Eggs)
    SelectedEggs = Eggs
    print(SelectedEggs)
end)



Egg:CreateToggle("Auto Egg", true, function()
if SelectedEggs then
Player.Character.HumanoidRootPart.CFrame = WS.Resources.Eggs[SelectedEggs].CFrame
        local ohTable1 = {
	        ["eggName"] = SelectedEggs,
	        ["baseAmount"] = 1,
	        ["auto"] = false,
	        ["amount"] = 1
}

        RS.Packages.Knit.Services.EggService.RF.BuyEgg:InvokeServer(ohTable1)
    end
end)


Egg:CreateToggle("Auto 3x Egg(Need Pass)", true, function()
if SelectedEggs then
    Player.Character.HumanoidRootPart.CFrame = WS.Resources.Eggs[SelectedEggs].CFrame
        local ohTable1 = {
            ["eggName"] = SelectedEggs,
            ["baseAmount"] = 1,
            ["auto"] = false,
            ["amount"] = 3
}
    
        RS.Packages.Knit.Services.EggService.RF.BuyEgg:InvokeServer(ohTable1)
    end
end)

Egg:CreateToggle("Auto 4x Egg(Need To Beat Dungeon)", true, function()
    if SelectedEggs then
        Player.Character.HumanoidRootPart.CFrame = WS.Resources.Eggs[SelectedEggs].CFrame
            local ohTable1 = {
                ["eggName"] = SelectedEggs,
                ["baseAmount"] = 1, 
                ["auto"] = false,
                ["amount"] = 4
    }
        
            RS.Packages.Knit.Services.EggService.RF.BuyEgg:InvokeServer(ohTable1)
    end
end)

Egg:CreateToggle("Auto Equip Best Pet", true, function()
    RS.Packages.Knit.Services.PetInvService.RF.EquipBest:InvokeServer()
end)

Egg:CreateToggle("Auto Equip Best Sword", true, function()
    RS.Packages.Knit.Services.WeaponInvService.RF.EquipBest:InvokeServer()
end)

Egg:CreateToggle("Auto Forge Weapons", true, function()
    for _,v in pairs(Player.PlayerGui.WeaponInv.Background.ImageFrame.Window.WeaponHolder.WeaponScrolling:GetChildren()) do
        RS.Packages.Knit.Services.ForgeService.RF.Forge:InvokeServer(v.Name)
        end 
    end)
    
 --[[  
Egg:CreateToggle("Auto Celestial", true, function()
for _,v in pairs(Player.PlayerGui.PetInv.Background.ImageFrame.Window.PetHolder.PetScrolling:GetChildren()) do
    if not v.Name == "Sorter" then
    local ohTable1 = {
        [1] = v.Name,
        [2] = v.Name,
        [3] = v.Name,
        [4] = v.Name,
        [5] = v.Name,
        [6] = v.Name,
        [7] = v.Name,
        [8] = v.Name,
        [9] = v.Name,
        [10] = v.Name
    }
    
        RS.Packages.Knit.Services.CraftingService.RF.Craft:InvokeServer(ohTable1)
        end
    end
end)


Egg:CreateToggle("Auto Shiny", true, function()
for _,v in pairs(Player.PlayerGui.Crafting.Background.ImageFrame.Window.PetHolder.PetScrolling:GetChildren()) do
    if not v:GetAttribute("Sorter") then
            local ohTable1 = {
                [1] = v.Name,
                [2] = v.Name,
                [3] = v.Name,
                [4] = v.Name,
                [5] = v.Name,
                [6] = v.Name,
                [7] = v.Name,
                [8] = v.Name,
                [9] = v.Name,
                [10] = v.Name
            }

            RS.Packages.Knit.Services.CraftingService.RF.Craft:InvokeServer(ohTable1)
        end
    end
end)

--]]
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
        RS.Packages.Knit.Services.CodeService.RF.RedeemCode:InvokeServer(v)
    end
end)


Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/ups8GeuYAD")
end)

local TeleportService = game:GetService("TeleportService")
