local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V1Library.lua", true))()
local ui = Library:CreateWindow()

local Main = ui:new("Main")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"Release", "Alien", "500Likes", "3kLikes", "BeastPet349", "BeastPet491", "BeastPet550"}
local RebirthTable = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16","17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75"}
--Variables
local SelectedEggs;
local SelectedRebirth;
local SelectedPortals;
local TeleportWait = false
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions









--Main



Main:CreateLabel("", "Auto Rebirth in spawn or you'll get kicked")
Main:CreateLabel("", "Theres a delay cant make it faster")


Main:CreateToggle("Auto Rebirth", true, function()
    RS.Event.Rebirth:FireServer(true)
end)


Main:CreateToggle("Auto Rainbow +1 Wins", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(-0.68847847, 7344.77197, 8012.53857, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        task.wait(2)
		TeleportWait = false
	end
end)


Main:CreateToggle("Auto Rainbow +2 Wins", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(-230.916122, 8657.9541, 7870.875, 0, 0, -1, -1, 0, 0, 0, 1, 0)
        task.wait(2)
		TeleportWait = false
	end
end)

Main:CreateToggle("Auto Candy", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(163.606567, 10789.4248, 8015.5249, 0, 0, -1, -1, 0, 0, 0, 1, 0)
        task.wait(2)
		TeleportWait = false
	end
end)

Main:CreateToggle("Auto Lava Wins", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(313.617004, 13923.0703, 8031.875, 0, 0, -1, -1, 0, 0, 0, 1, 0)
        task.wait(2)
		TeleportWait = false
	end
end)


Main:CreateToggle("Auto Moon Wins", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(462.061859, 18409.0781, 8056.68994, 0, 0, -1, -1, 0, 0, 0, 1, 0)
        task.wait(2)
		TeleportWait = false
	end
end)


Main:CreateToggle("Auto Beach Wins", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(612.430664, 24590.8418, 8058.37061, -8.10623169e-05, 8.10623169e-05, -1, -1, 8.10623169e-05, 8.10623169e-05, 8.10623169e-05, 1, 8.10623169e-05)
        task.wait(2)
		TeleportWait = false
	end
end)


Main:CreateToggle("Auto Christmas Wins", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(760.565247, 42507.7266, 8088.05469, -8.10623169e-05, 8.10623169e-05, -1, -1, 8.10623169e-05, 8.10623169e-05, 8.10623169e-05, 1, 8.10623169e-05)
        task.wait(2)
		TeleportWait = false
	end
end)


Main:CreateToggle("Auto Void Wins", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(913.178406, 66134.5547, 8184.97559, 0, 0, -1, -1, 0, 0, 0, 1, 0)
        task.wait(2)
		TeleportWait = false
	end
end)

Main:CreateToggle("Auto Gold Wins", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(1063.37708, 92749.9141, 8266.41992, -8.10623169e-05, 8.10623169e-05, -1, -1, 8.10623169e-05, 8.10623169e-05, 8.10623169e-05, 1, 8.10623169e-05)
        task.wait(2)
		TeleportWait = false
	end
end)


Main:CreateToggle("Auto Horror Wins", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(1211.52075, 123459.961, 8269.77051, 0, 0, -1, -1, 0, 0, 0, 1, 0)
        task.wait(2)
		TeleportWait = false
	end
end)
-- Teleport














-- Eggs


















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
