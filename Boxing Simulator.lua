
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
local Aura = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24}
local Rank = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41}
--Variables
local SelectedTeleports;
local SelectedEggs;
local Teleport = true
local TeleportWait = false



-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions


function getTeleports()
    local Teleports = {}
    for _,v in pairs(game:GetService("Workspace").IslandUnlock:GetChildren()) do
        table.insert(Teleports,v.Name)
    end
    return Teleports
end

function getEggs()
    local Eggs = {}
    for _,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
        table.insert(Eggs,v.Name)
    end
    return Eggs
end







--Main

Main:CreateToggle("Auto Punch", true, function()
    Player.Character:FindFirstChildOfClass("Tool"):Activate() 
end)



Main:CreateToggle("Auto Boxes Farm", true, function()
    local nearest
    local NearestOne = 300
    for _,v in pairs(game:GetService("Workspace").Boxes:GetDescendants()) do
	if v:IsA("Model") and v.Parent:IsA("Folder") then
        if (v.Root.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.Root.Position - Player.Character.HumanoidRootPart.Position).Magnitude
			end
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.Root.CFrame * CFrame.new(0,0,0)
    end
end)


Main:CreateToggle("Auto Boss Farm", true, function()
    local nearest
    local NearestOne = 300
    for _,v in pairs(game:GetService("Workspace").Boss:GetDescendants()) do
	if v:IsA("Model") and v.Parent:IsA("Folder") then
        if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            nearest = v
            NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
			end
        end
    end

    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
    end
end)


Main:CreateToggle("Auto Buy", true, function()
    RS.Events.BuyAllGlove:FireServer()
    RS.Events.BuyAllDNA:FireServer()
end)


Main:CreateToggle("Auto Buy Aura", true, function()
    for _,v in pairs(Aura) do
    RS.Events.BuyAura:FireServer(v) 
    end
end)


Main:CreateToggle("Auto Buy Rank", true, function()
if TeleportWait == false then
    TeleportWait = true
        for _,v in pairs(Rank) do
            RS.Events.BuyClass:FireServer(v)
            task.wait(4)
            TeleportWait = false
        end
    end
end)


Main:CreateToggle("Auto Collect Coins", true, function()
    for _,v in pairs(game:GetService("Workspace").Coins:GetDescendants()) do
        if v.Name == "HumanoidRootPart" then
		local Time = 1
		local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(Time), {CFrame = Player.Character.HumanoidRootPart.CFrame})
		tween:Play()
		tween.Completed:Wait()
        end
    end
end)


Main:CreateToggle("Auto Collect Canes", true, function()
    for _,v in pairs(game:GetService("Workspace").Canes:GetDescendants()) do
        if v.Name == "HumanoidRootPart" then
		local Time = 1
		local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(Time), {CFrame = Player.Character.HumanoidRootPart.CFrame})
		tween:Play()
		tween.Completed:Wait()
        end
    end
end)


Main:CreateToggle("Auto Collect Trophies", true, function()
    for _,v in pairs(game:GetService("Workspace").Trophies:GetDescendants()) do
        if v.Name == "HumanoidRootPart" then
		local Time = 1
		local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(Time), {CFrame = Player.Character.HumanoidRootPart.CFrame})
		tween:Play()
		tween.Completed:Wait()
        end
    end
end)



-- Teleport


tp:CreateDropdown("Select Teleport", getTeleports(), function(Teleports)
    SelectedTeleports = Teleports
    print(SelectedTeleports)
end)


tp:CreateButton("Teleport", function()
    if SelectedTeleports then
        local TeleportCFrame = WS.IslandUnlock[SelectedTeleports].CFrame
        Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
    end
end)


-- Eggs


Egg:CreateDropdown("Select Egg", getEggs(), function(Selected)
    SelectedEggs = Selected
    print(SelectedEggs)
end)


Egg:CreateToggle("Auto Egg", true, function()
    if SelectedEggs then
        RS.Events.BuyEgg:FireServer(SelectedEggs, false)
    end
end)


Egg:CreateToggle("Auto 3x Egg(GamePass Needed)", true, function()
    if SelectedEggs then
        RS.Events.BuyEgg:FireServer(SelectedEggs, true)
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

