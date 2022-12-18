
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V1Library.lua", true))()
local ui = Library:CreateWindow()

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
local RebirthTable = {"1", "5", "10"}
local Teleports = {
    ["Enchanted Island"] = CFrame.new(51.2420082, 849.832031, -151.813995, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    ["Astral Island"] = CFrame.new(216.321625, 2095.47778, 256.276184, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    ["Mystical Island"] = CFrame.new(184.796295, 4124.17773, 45.8520508, 0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, 0.499959469),
    ["Space Island"] = CFrame.new(138.522156, 5847.19336, 123.56015, 0.573598742, -0, -0.81913656, 0, 1, -0, 0.81913656, 0, 0.573598742),
    ["Tundra Island"] = CFrame.new(145.131607, 9372.39746, 90.3484344, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Eternal Island"] = CFrame.new(145.131607, 13767.251, 90.3484344, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Sandstorm"] = CFrame.new(145.131607, 17773.5469, 90.3484344, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Thunderstorm"] = CFrame.new(145.131607, 24157.2402, 90.3484344, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Ancient Inferno Island"] = CFrame.new(144.021057, 28364.6953, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Midnight Shadow Island"] = CFrame.new(144.021057, 33315.3867, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Mythical Souls Island"] = CFrame.new(144.021057, 39425.9766, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Winter Wonder Island"] = CFrame.new(144.021057, 46118.9609, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Golden Master Island"] = CFrame.new(144.021057, 52716.168, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Dragon Legend Island"] = CFrame.new(144.021057, 59703.0859, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Cybernetic Legends Island"] = CFrame.new(144.021057, 66777.5781, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Skystorm Ultraus Island"] = CFrame.new(144.021057, 70379.5703, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Chaos Legends Island"] = CFrame.new(144.021057, 74551.2656, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Soul Fusion Island"] = CFrame.new(144.021057, 79855.3984, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Dark Elements Island"] = CFrame.new(144.021057, 83307.3984, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Inner Peace Island"] = CFrame.new(144.021057, 87159.4844, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685),
    ["Blazing Vortex Island"] = CFrame.new(144.021057, 91354.4844, 88.9619141, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685)
   
}
local Chest = {"ultraNinjitsuChest",  "mythicalChest",  "goldenChest",  "enchantedChest",  "magmaChest",  "legendsChest",  "eternalChest",  "thunderChest",  "ancientChest",  "midnightShadowChest",  "legendsChest",  "lightKarmaChest",  "evilKarmaChest",  "wonderChest",  "goldenZenChest",  "skystormMastersChest",  "chaosLegendsChest",  "soulFusionChest", "saharaChest"}
--Variables
local SelectedRebirthTable;
local SelectedCrystals;
local Teleport = true
local SelectedSell;
local SelectedChest;


-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions

function getCrystals()
    local Crystals = {}
    for _,v in pairs(game:GetService("ReplicatedStorage").gameCrystals:GetChildren()) do
        table.insert(Crystals, v.Name)
    end
    return Crystals
end

function getTeleportNames()
    local TeleportsTab = {}

    for i,v in pairs(Teleports) do
        table.insert(TeleportsTab, i)
    end
    return TeleportsTab
end






--Main



Main:CreateToggle("Auto Tap", true, function()
Player.ninjaEvent:FireServer("swingKatana")
end)



Main:CreateToggle("Auto Sell", true, function()
        local giver = WS.sellAreaCircles.sellAreaCircle.circleInner
        giver.CFrame = Player.Character.HumanoidRootPart.CFrame
        task.wait(0.1)
        giver.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(-1000, -1000, 10000000)
end)


Main:CreateToggle("Auto Farm Robot", true, function()
    local nearest
    local NearestOne = 1000000
    for _,v in pairs(WS.bossFolder:GetDescendants()) do
	if v:IsA("Model") and v.Parent:IsA("Folder") then
        if (v.UpperTorso.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.UpperTorso.Position - Player.Character.HumanoidRootPart.Position).Magnitude
			end
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.UpperTorso.CFrame * CFrame.new(0,0,0)
    end
end)





Main:CreateToggle("Auto Buy Sword/Belts/Skills", true, function()
    for _,v in pairs(game:GetService("ReplicatedStorage").Belts:GetChildren()) do
Player.ninjaEvent:FireServer("buyAllBelts", v.Name)
Player.ninjaEvent:FireServer("buyAllSwords", v.Name)
Player.ninjaEvent:FireServer("buyAllSkills", v.Name)
    end
end)


Main:CreateToggle("Auto Buy Ranks", true, function()
    for _,v in pairs(game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()) do
    Player.ninjaEvent:FireServer("buyRank", v.Name)
    end
end)




Main:CreateToggle("Auto Spin Wheel", true, function()
    RS.rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", workspace["Fortune Wheel"])
end)

Main:CreateButton("Unlock all Islands", function()
    for i, v in pairs(game:GetService("Workspace").islandUnlockParts:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)


--[[
Main:CreateToggle("Auto Hoop", true, function()
    for _,v in pairs(game:GetService("Workspace").Hoops:GetDescendants()) do
    local giver = v
    giver.touchPart.CFrame = Player.Character.HumanoidRootPart.CFrame
    task.wait(0.1)
    giver.touchPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(-1000, -1000, 10000000)
        end
    end
end)
--]]





--[[
Main:CreateToggle("Auto Collect", true, function()
    for _,v in pairs(game:GetService("Workspace").spawnedCoins.Valley:GetChildren()) do
		local Time = 1
		local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(Time), {CFrame = Player.Character.HumanoidRootPart.CFrame})
		tween:Play()
		tween.Completed:Wait()
    end
end)
--]]




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

tp:CreateDropdown("Select Chest", Chest, function(Chest)
    SelectedChest = Chest
    print(SelectedChest)
end)

tp:CreateButton("Teleport", function()
    if SelectedChest then
        local TeleportCFrame = WS[SelectedChest].Chest.CFrame
        Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
    end
end)



-- Eggs

Egg:CreateDropdown("Select Crystals",getCrystals(), function(Cry)
    SelectedCrystals = Cry
    print("SelectedCrystals")
end)

Egg:CreateToggle("Auto Egg", true, function()
    if SelectedCrystals then
        RS.rEvents.openCrystalRemote:InvokeServer("openCrystal", SelectedCrystals)
    end
end)



Egg:CreateToggle("Auto Evole Pets", true, function()
    RS.rEvents.autoEvolveRemote:InvokeServer("autoEvolvePets")
end)
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

