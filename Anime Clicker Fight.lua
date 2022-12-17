
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
local Codes = {"SAITAMA", "ONEPUNCH", "UPDATE5", "TITAN", "DRAGON", "5KLIKES", "UPDATE2", "ONEPIECE", "MASK", "RUSHRUSH"}
local SelectedTeleport;
local EggTable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,13, 14, 2101,2102}
local TeleportTable = {0, 1, 2, 3, 4, 5, 6, 7}
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
        Player.Character.HumanoidRootPart.CFrame = nearest.Root.CFrame * CFrame.new(0,2,-4)
    end
end)

Main:CreateToggle("Auto Farm My Hero", true, function()
    local nearest
    local NearestOne = 307
    for _,v in pairs(game:GetService("Workspace")["场景"]["7"].EnemyFolder:GetChildren()) do
        if (v.Root.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.Root.Position - Player.Character.HumanoidRootPart.Position).Magnitude
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.Root.CFrame * CFrame.new(0,2,4)
    end
end)

Main:CreateToggle("Auto Farm Reaper", true, function()
    local nearest
    local NearestOne = 307
    for _,v in pairs(game:GetService("Workspace")["场景"]["8"].EnemyFolder:GetChildren()) do
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

tp:CreateDropdown("Select Teleport", TeleportTable, function(Teleport)
    SelectedTeleport = Teleport
    print(SelectedTeleport)
end)

tp:CreateButton("Teleport", function()
    if SelectedTeleport then
        RS.ServerMsg.Teleport:FireServer(SelectedTeleport)
    end
end)





-- Eggs

Egg:CreateLabel("", "2101 And 2102 Are Christmas Eggs")

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
        RS.ServerMsg.Code:InvokeServer(v)
    end
end)


Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/ups8GeuYAD")
end)
