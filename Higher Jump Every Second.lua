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
local Teleports = {
    ["Rainbow Tower"] = CFrame.new(-95.5, 1722.6228, 76.9000015, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,3,0),
    ["Candy Tower"] = CFrame.new(-263.700012, 4134.82373, 83.6999969, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,3,0),
    ["Hell Tower"] = CFrame.new(-422.800018, 7106.25244, 99.2999954, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,3,0),
    ["illumina Tower"] = CFrame.new(-597.600037, 9583.28027, 108.299988, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,3,0),
    ["Bombastic Tower"] = CFrame.new(-778.600037, 13734.0801, 121.559959, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,3,0),
    ["Christmas Tower"] = CFrame.new(-960.299988, 17769.6523, 128.555832, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,3,0),
    ["Void Tower"] = CFrame.new(-1145.80005, 21132.9043, 135.505325, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,3,0),
    ["Beach Tower"] = CFrame.new(-1326.10022, 24295.6035, 140.805328, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,3,0),
    ["Gold Tower"] = CFrame.new(-1516.00012, 25608.6035, 140.805328, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,3,0)
   
}
--Variables
local SelectedEggs;
local SelectedRebirth;
local SelectedPortals;
local SelectedTeleport;
local TeleportWait = false
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions



function getTeleportNames()
    local TeleportsTab = {}

    for i,v in pairs(Teleports) do
        table.insert(TeleportsTab, i)
    end
    return TeleportsTab
end






--Main

Main:CreateDropdown("Select Teleport", getTeleportNames(), function(tp)
    SelectedTeleport = tp
    print(SelectedTeleport)
end)

Main:CreateToggle("Teleport", true, function()
	if TeleportWait == false then
		TeleportWait = true
    if SelectedTeleport then
        Player.Character.HumanoidRootPart.CFrame = Teleports[SelectedTeleport]
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(-95.3852539, 0.75, -161.401382, -1, 0, 0, 0, 1, 0, 0, 0, -1)
		task.wait(1)
		TeleportWait = false
		end
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
