local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("")

local Main = ui:new("Main")
local Egg = ui:new("Eggs")
local Teleport = ui:new("Teleport")
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
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions

function getEggs()
	local Eggs = {}
	for _,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
		table.insert(Eggs, v.Name)
	end
	return Eggs
end







--Main


Main:CreateToggle("Auto Join", true, function()
game:GetService("ReplicatedStorage").Remotes.joinEvent:FireServer("Join")
end)



Main:CreateToggle("Auto Mine", true, function()
game:GetService("ReplicatedStorage").Remotes.mineEvent:FireServer("Mine")
end)




Main:CreateToggle("Auto Rebirth", true, function()
game:GetService("ReplicatedStorage").Remotes.rebirthEvent:FireServer("Rebirth")
end)





Main:CreateToggle("Auto Upgrade Block Power", true, function()
game:GetService("ReplicatedStorage").Remotes.upgradeEvent:FireServer("Dig")
end)


Main:CreateToggle("Auto Upgrade Pickaxe Cooldown", true, function()
game:GetService("ReplicatedStorage").Remotes.upgradeEvent:FireServer("Cooldown")
end)

-- Teleport

Teleport:CreateButton("Teleport To Easy Obby", function()
Player.Character.HumanoidRootPart.CFrame = CFrame.new(30.0742302, 9.50357246, -573.830261, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,5,0)
end)

Teleport:CreateButton("Teleport To Hard Obby", function()
	Player.Character.HumanoidRootPart.CFrame = CFrame.new(-4.97992802, 40.465992, 498.67395, 0, 0, 1, 0, 1, -0, -1, 0, 0) * CFrame.new(0,5,0)
end)
	







-- Eggs

Egg:CreateDropdown("Select Egg", getEggs(), function(Eggs)
	SelectedEggs = Eggs
	print(SelectedEggs)
end)

Egg:CreateToggle("Auto Egg", true, function()
	if SelectedEggs then
		RS.Remotes.requestEgg:FireServer("Open", workspace.Eggs[SelectedEggs])
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

local TextLabel = Instance.new("TextLabel")

TextLabel.Parent = game:GetService("CoreGui")["UI V2"]
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0745672435, 0, 0.0299251862, 0)
TextLabel.Size = UDim2.new(0, 1216, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "FPS: Loading"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 47.000
TextLabel.TextWrapped = true
TextLabel.Name = "FPStext"
TextLabel.Visible = false

FPSAverage = {}
local Ticking = false
local LastTick = tick()

local RunService = game:GetService("RunService")
RunService:BindToRenderStep("UpdateInfo", 1000, function()
	if Ticking == true then
		local fps = math.floor(.5 + (1 / (tick() - LastTick)))
		local sum = 0
		local ave = 0
		table.insert(FPSAverage, fps)
		for i = 1, #FPSAverage do
			sum = sum + FPSAverage[i]
		end
		game:GetService("CoreGui")["UI V2"].FPStext.Text = "FPS: " .. tostring(fps) .. " Average: " .. string.format("%.0f", (sum / #FPSAverage))
		if (tick() - LastTick) >= 15 then
			FPSAverage = { }
			LastTick = tick()
		end
		LastTick = tick()
	end
end)


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
    setclipboard("https://discord.gg/ups8GeuYAD")
end)

local TeleportService = game:GetService("TeleportService")

Misc:CreateButton("Uninject", function()
    game:GetService("CoreGui")["UI V2"]:Destroy()
end)

Misc:CreateButton("Uninject and Rejoin", function()
    game:GetService("CoreGui")["UI V2"]:Destroy()
    TeleportService:Teleport(game.PlaceId)
end)
