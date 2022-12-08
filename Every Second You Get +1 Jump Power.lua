
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
local Teleports = {
    ["Spawn"] = CFrame.new(327, 24, -7),
    ["Skull Cove"] = CFrame.new(2233, 24, -573),
    ["Demon Hill"] = CFrame.new(3947, 24, -383),
    ["Polar Tundra"] = CFrame.new(5951.69385, 25.2443981, -561.820984, 0.191228956, 5.4418825e-09, 0.981545448, -7.41944888e-08, 1, 8.91069529e-09, -0.981545448, -7.45292468e-08, 0.191228956),
    ["UnderWorld"] = CFrame.new(15590.9756, 29.5727577, 54.4207458, 0.998174429, 3.03580023e-08, 0.0603971928, -2.79590466e-08, 1, -4.05647178e-08, -0.0603971928, 3.88020176e-08, 0.998174429),
    ["Heaven"] = CFrame.new(8956.93457, 483.995544, -528.789246, -0.0964777619, -3.60506078e-08, 0.995335162, -9.97669432e-08, 1, 2.65491646e-08, -0.995335162, -9.67401448e-08, -0.0964777619),
    ["Desert"] = CFrame.new(23473.6895, 25.2444344, 259.541687, 0.989584088, -5.98744592e-08, -0.143955931, 7.13396844e-08, 1, 7.44822302e-08, 0.143955931, -8.39761967e-08, 0.989584088),
   
}
--Variables
local SelectedEggs;
local SelectedRebirth;
local SelectedSpawns;
local KANdistance = 400000000000000000000000000000;
local TeleportWait = false

-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions


function getEggs()
    local Eggs = {}
    for _,v in pairs(WS.Eggs:GetChildren()) do 
        table.insert(Eggs, v.Name)
    end
    return Eggs
end




--Main




Main:CreateToggle("Auto Trophies", true, function()
	if TeleportWait == false then
        TeleportWait = true
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1, 1868.94995, 130, 0, 0, -1, -1, 0, 0, 0, 1, 0) * CFrame.new(0,0,0)
		task.wait(1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2049, 6205.05029, 131, 0, 0, -1, -1, 0, 0, 0, 1, 0) * CFrame.new(0,0,0)
        task.wait(1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4049, 8734.84961, 141, 0, 0, -1, -1, 0, 0, 0, 1, 0) * CFrame.new(0,0,0)
		task.wait(1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6049, 13429.8496, 152, 0, 0, -1, -1, 0, 0, 0, 1, 0) * CFrame.new(0,0,0)
		task.wait(1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8049, 19189.8516, 161, 0, 0, -1, -1, 0, 0, 0, 1, 0) * CFrame.new(0,0,0)
		task.wait(1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(10266, 27323.252, 173, 0, 0, -1, -1, 0, 0, 0, 1, 0) * CFrame.new(0,0,0)
		task.wait(1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(12314, 45653.2539, 199, 0, 0, -1, -1, 0, 0, 0, 1, 0) * CFrame.new(0,0,0)
		task.wait(1)
		TeleportWait = false
	end
end)

Main:CreateToggle("Auto Rebirth", true, function()
	RS.RebirthEvent:FireServer()
end)

Main:CreateDropdown("Selected Egg", getEggs(), function(Eggs)
	SelectedEggs = Eggs
	print(SelectedEggs)
end)

Main:CreateToggle("Auto Egg", true, function()
if SelectedEggs then
	RS.RemoteEvents.EggOpened:InvokeServer(SelectedEggs, "Single")
	end
end)

Main:CreateToggle("Auto x3 Egg", true, function()
if SelectedEggs then
	RS.RemoteEvents.EggOpened:InvokeServer(SelectedEggs, "Triple")
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
