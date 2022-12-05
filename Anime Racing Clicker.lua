local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("Anime Racing Clicker")

local Main = ui:new("Main")
local Egg = ui:new("Eggs")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"Release", "Alien", "500Likes", "3kLikes", "BeastPet349", "BeastPet491", "BeastPet550"}
local Upgrades = {"Rank", "RaceCompleted", "RaceClear", "PlayTime", "EarnedShurikens"}
local Eggs = {"Star1", "Star2", "Star3", "Star4", "Star5", "Star6", "Star7", "Star8", "Star9", "Star10", "Star11", "Star12", "Star13", "Star14", "Star15", "Star16", "Star17", "Star18", "Star19", "Star20", "Star21", "Star22", "Star23", "Star24"}
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

Main:CreateLabel("Auto Wins Works In All Areas")


Main:CreateToggle("Auto Click", true, function()
    game:GetService("ReplicatedStorage").Knit.Services.ClickerService.RF.PlayerClick:InvokeServer()
end)


Main:CreateToggle("Auto Wins", true, function()
	if TeleportWait == false then
        TeleportWait = true
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 2084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 6084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        task.wait(1)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 12084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        task.wait(1)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 22084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        task.wait(1)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 36084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        task.wait(1)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 54084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        task.wait(1)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 76084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        task.wait(1)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 102084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        task.wait(1)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 132084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        task.wait(1)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 168084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 210084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 260084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 320084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 400084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 520084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 20, 780084, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		task.wait(1)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, -8, 781108, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        task.wait(1)
		TeleportWait = false
	end
end)


Main:CreateToggle("Auto Claim Achievements", Upgrades, function()
    for _,v in pairs(Upgrades) do
        RS.Knit.Services.AchivementService.RF.RedeemReward:InvokeServer(v)
    end
end)


Main:CreateToggle("Auto Spin Wheel", true, function()
	RS.Knit.Services.DailySpinService.RF.SpinWheel:InvokeServer()
end)

-- Teleport




-- Eggs

Egg:CreateLabel("Star 1,2 Starts in Naruto and Star 23,24 in last zone")
Egg:CreateLabel("There in order 2 eggs each world")
Egg:CreateLabel("Gamepasses need for x3 and x6")

Egg:CreateDropdown("Select Egg", Eggs, function(Eggs)
	SelectedEggs = Eggs
	print(SelectedEggs)
end)



Egg:CreateToggle("Auto Egg", true, function()
	if SelectedEggs then
		local ohString1 = SelectedEggs
		local ohNumber2 = 1
		local ohTable3 = {}
		RS.Knit.Services.StarEggService.RF.OpenEggs:InvokeServer(ohString1, ohNumber2, ohTable3)
	end
end)


Egg:CreateToggle("Auto x3 Egg", true, function()
    if SelectedEggs then
        local ohString1 = SelectedEggs
        local ohNumber2 = 3
        local ohTable3 = {}

        RS.Knit.Services.StarEggService.RF.OpenEggs:InvokeServer(ohString1, ohNumber2, ohTable3)
    end
end)
Egg:CreateToggle("Auto x6 Egg", true, function()
    if SelectedEggs then
        local ohString1 = SelectedEggs
        local ohNumber2 = 6
        local ohTable3 = {}

        RS.Knit.Services.StarEggService.RF.OpenEggs:InvokeServer(ohString1, ohNumber2, ohTable3)
    end
end)




Egg:CreateToggle("Auto Equip Best", true, function()
	RS.Knit.Services.PetInventoryService.RF.EquipBest:InvokeServer()
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
