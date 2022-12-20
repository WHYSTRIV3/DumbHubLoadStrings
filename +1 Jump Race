
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
local Eggs = {"Starter Egg", "Striped Egg", "Royal Egg", "Space Egg", "Shadow Egg", "Atlantis Egg", "Coral Egg"}

--Variables

local TeleportWait = false
local SelectedEggs;




-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions











--Main




Main:CreateToggle("Auto Earth Farm", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 9.00199986, 0)
		task.wait(1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 99950, 39.5) * CFrame.new(0,0,0)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(-0.0017469991, -2.98616481, -116.405823)
        task.wait(2)
		TeleportWait = false
	end
end)

Main:CreateToggle("Auto Space Farm", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(50009.2305, 12.2873545, -0.000259399414)
		task.wait(1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(50009.2305, 99950, 39.4997559) * CFrame.new(0,0,0)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(50007.793, -3.32047081, -100.39827)
        task.wait(2)
		TeleportWait = false
	end
end)

Main:CreateToggle("Auto UnderWater Farm", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(25009.2305, 13.9296875, -0.000259399414)
		task.wait(1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25009.2305, 99950, 39.4997559) * CFrame.new(0,0,0)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(25009.1836, -7, -131.939758)
        task.wait(2)
		TeleportWait = false
	end
end)


Main:CreateToggle("Auto Collect Chest", true, function()
    for i, v in pairs(game:GetService("Workspace").Chests.LevelChest:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)








-- Teleport


tp:CreateButton("Teleport To Earth", function()
	Player.Character.HumanoidRootPart.CFrame = CFrame.new(2.1418582e-06, 0, -132)
end)

tp:CreateButton("Teleport To Space", function()
	Player.Character.HumanoidRootPart.CFrame = CFrame.new(50009.1836, 0, -131.939758)
end)

tp:CreateButton("Teleport To UnderWater", function()
	Player.Character.HumanoidRootPart.CFrame = CFrame.new(25009.1836, 0, -131.939758)
end)




-- Eggs

Egg:CreateDropdown("Select Egg", Eggs, function(Eggs)
	SelectedEggs = Eggs
	print(SelectedEggs)
end)

Egg:CreateToggle("Auto Egg", true, function()
	if SelectedEggs then
		RS.Events.HatchPet:FireServer(SelectedEggs, 1)
	end
end)

Egg:CreateToggle("Auto x3 Egg(GamePass Needed)", true, function()
	if SelectedEggs then
		RS.Events.HatchPet:FireServer(SelectedEggs, 3)
	end
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

