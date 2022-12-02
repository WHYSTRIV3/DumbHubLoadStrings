local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("Anime Clicker Fight")

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
local SelectedRibirth;
local EggTable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}
--Variables
local Teleport = false


-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions



--Main




Main:CreateToggle("Auto Farm Naruto", true, function()
    local nearest
    local NearestOne = 307
    for _,v in pairs(game:GetService("Workspace")["场景"]["1"].EnemyFolder:GetChildren()) do
        if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,2,4)
    end
end)

Main:CreateToggle("Auto Farm Demon Slayer", true, function()
    local nearest
    local NearestOne = 307
    for _,v in pairs(game:GetService("Workspace")["场景"]["2"].EnemyFolder:GetChildren()) do
        if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,2,4)
    end
end)

Main:CreateToggle("Auto Farm One piece", true, function()
    local nearest
    local NearestOne = 307
    for _,v in pairs(game:GetService("Workspace")["场景"]["3"].EnemyFolder:GetChildren()) do
        if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,2,4)
    end
end)

Main:CreateToggle("Auto Farm Dragon Ball", true, function()
    local nearest
    local NearestOne = 307
    for _,v in pairs(game:GetService("Workspace")["场景"]["4"].EnemyFolder:GetChildren()) do
        if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,2,4)
    end
end)

Main:CreateToggle("Auto Farm AOT", true, function()
    local nearest
    local NearestOne = 307
    for _,v in pairs(game:GetService("Workspace")["场景"]["5"].EnemyFolder:GetChildren()) do
        if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,2,4)
    end
end)

Main:CreateToggle("Auto Farm One Punch Man", true, function()
    local nearest
    local NearestOne = 307
    for _,v in pairs(game:GetService("Workspace")["场景"]["6"].EnemyFolder:GetChildren()) do
        if (v.Root.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.Root.Position - Player.Character.HumanoidRootPart.Position).Magnitude
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.Root.CFrame * CFrame.new(0,2,4)
    end
end)




Main:CreateButton("Teleport", function()
    Teleport = not Teleport
end)









-- Teleport





-- Eggs

Egg:CreateDropdown("Select Egg", EggTable, function(Egg)
    SelectedEgg = Egg
    print(SelectedEgg)
end)

Egg:CreateToggle("Auto Scroll", true, function()
     RS.Tool.DrawUp.Msg.DrawHero:InvokeServer(SelectedEgg, 1)
end)

Egg:CreateToggle("Auto Triple Scroll", true, function()
    RS.Tool.DrawUp.Msg.DrawHero:InvokeServer(SelectedEgg, 3)
end)


Egg:CreateToggle("Auto AOT RBX Scroll", true, function()
    RS.Tool.DrawUp.Msg.DrawHero:InvokeServer(1005, 1)
end)

Egg:CreateToggle("Auto 1Punch RBX Scroll", true, function()
    RS.Tool.DrawUp.Msg.DrawHero:InvokeServer(1006, 1)
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
