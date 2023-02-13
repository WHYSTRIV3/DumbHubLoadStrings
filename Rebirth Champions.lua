
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V2%20Library.lua", true))()
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
local Codes = {"UPDATE1"}
local Upgrades = {"More Speed", "Jump Boost", "Extra Luck", "Extra Gems", "Pet Storage", "Pets Equipped"}
local Rebirths = {1, 5, 10, 50, 100, 250, 500, 1000, 4200, 10000, 25000, 50000, 75000, 420000, 910000, 1200000, 10000000, 50000000, 100000000, 500000000, 750000000, 1000000000, 2500000000, 5000000000, 10000000000, 25000000000, 75000000000, 500000000000, 1000000000000}
--Variables
local SelectedRebirths;
local SelectedEgg;
local EquipBestWait = false





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


function getRebirths()
    local Rebirths = {}

    for _,v in pairs(Player.PlayerGui.CoreUI.Frames.Rebirths.Inner:GetChildren()) do
        if v:IsA("Frame") and v.Name == "Rebirth" then
            table.insert(Rebirths, v.Rebirths.Value)
        end
    end
    return Rebirths
end






--Main

Main:CreateToggle("Auto Tap", true, function()
    game:GetService("ReplicatedStorage").Events.Tap:FireServer()
end)

Main:CreateDropdown("Select Rebirth", getRebirths(), function(Rebirths)
    SelectedRebirths = Rebirths
    print(SelectedRebirths)
end)


Main:CreateToggle("Auto Rebirth", true, function()
    if SelectedRebirths then 
        RS.Events.Rebirth:FireServer(SelectedRebirths)
    end
end)



Main:CreateToggle("Auto Buy Upgrades", true, function()
    for _,v in pairs(Upgrades) do
        RS.Functions.BuyUpgrade:InvokeServer(v)
    end
end)

Main:CreateToggle("Auto Collect Chest", true, function()
    for i, v in pairs(game:GetService("Workspace").Chests:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)


Main:CreateToggle("Auto Collect Moons/Everything", true, function()
    for i, v in pairs(game:GetService("Workspace").CSpawn:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)


Main:CreateToggle("Auto Delete Notifications", true, function()
    for _,v in pairs(Player.PlayerGui.CoreUI.Popups:GetChildren()) do 
        if v.Name == "Popup" then 
              v:Destroy()
            end
        end
    for _,A in pairs(Player.PlayerGui.CoreUI.Popups2:GetChildren()) do 
        if A.Name == "ClickPopup" then 
            A:Destroy()
        end
    end   
end)



-- Teleport

tp:CreateButton("Teleport To Spawn", function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(85.7329102, 342.923492, 53.4121399, 0.991817057, -5.61789335e-08, 0.127667248, 6.78977088e-08, 1, -8.74396093e-08, -0.127667248, 9.53924086e-08, 0.991817057)
end)

tp:CreateButton("Teleport To Moon World", function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(2981.30762, -0.000500202179, -1026.24304)
end)

tp:CreateButton("Teleport To Ocean World", function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(2954.97046, 6.74036884, -1051.76465)
end)

tp:CreateButton("Teleport To Honey World", function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(995.559448, 346.1521, -57.2687798, -0.383630276, -1.13552074e-08, -0.923486769, 2.17496297e-08, 1, -2.13311377e-08, 0.923486769, -2.82687669e-08, -0.383630276)
end)

tp:CreateButton("Teleport To Galaxy World", function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(1003.48956, 346.152039, 411.438538, -0.103954911, -1.05877142e-07, -0.994581997, 5.11927496e-08, 1, -1.11804638e-07, 0.994581997, -6.25380281e-08, -0.103954911)
end)

tp:CreateButton("Teleport To Digital World", function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(1008.09241, 346.125244, 771.178589, -0.0698584542, 8.90183927e-08, -0.997556925, -3.45153772e-08, 1, 9.16535043e-08, 0.997556925, 4.08338252e-08, -0.0698584542)
end)

tp:CreateButton("Teleport To Pixel World", function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(1315.89539, 346.125275, 1198.25415, 0.0386699736, -8.33976443e-09, -0.999252021, -2.30936088e-08, 1, -9.23970411e-09, 0.999252021, 2.34336355e-08, 0.0386699736)
end)

tp:CreateButton("Teleport To Magma World", function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(1601.23242, 318.790955, 772.777588, 0.130073786, 1.46265844e-08, -0.991504312, -3.42349331e-08, 1, 1.02606883e-08, 0.991504312, 3.26094387e-08, 0.130073786)
end)

tp:CreateButton("Teleport To Radioactive World", function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(1612.04614, 318.790955, 307.835602, -0.119398236, -7.04988281e-08, -0.992846429, -3.4821952e-09, 1, -7.05880154e-08, 0.992846429, -4.97079933e-09, -0.119398236)
end)

tp:CreateButton("Teleport To Heaven World", function()
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(1697.11316, 318.790955, 37.3085365, -0.0894343704, 3.47406086e-08, -0.99599272, -1.77750925e-09, 1, 3.50399922e-08, 0.99599272, 4.90416596e-09, -0.0894343704)
end)

-- Eggs

Egg:CreateDropdown("Select Egg", getEggs(), function(Egg)
    SelectedEgg = Egg
    print(SelectedEgg)
end)

Egg:CreateToggle("Auto Egg", true, function()
    if SelectedEgg then
    RS.Events.OpenEgg:FireServer(SelectedEgg, nil, nil, nil, {["1"] = false,["4"] = false,["3"] = false,["2"] = false})
    end
end)

Egg:CreateToggle("Auto x3 Egg", true, function()
    if SelectedEgg then
        RS.Events.OpenEgg:FireServer(SelectedEgg, true, nil, nil, {["1"] = false,["4"] = false,["3"] = false,["2"] = false})
    end
end)


Egg:CreateToggle("Auto Equip Best", true, function()
    if EquipBestWait == false then 
        EquipBestWait = true
            RS.Events.PetAction:InvokeServer("EquipBest")
        task.wait(5)
        EquipBestWait = false
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
        RS.Events.CodeEvent:FireServer(v)
    end
end)


Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/ups8GeuYAD")
end)

local TeleportService = game:GetService("TeleportService")

Misc:CreateButton("Uninject", function()
    game:GetService("CoreGui").DumbHubV2:Destroy()
end)

Misc:CreateButton("Uninject and Rejoin", function()
    game:GetService("CoreGui").DumbHubV2:Destroy()
    TeleportService:Teleport(game.PlaceId)
end)
