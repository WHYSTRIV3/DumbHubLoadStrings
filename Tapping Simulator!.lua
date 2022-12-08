
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
--Variables

local SelectedEggs;
local SelectedIslands;
local Codes = {"Release", "Alien", "500Likes", "3kLikes", "BeastPet349", "BeastPet491", "BeastPet550"}
local modulescrpt;
local SelectedCraftAll = "CraftAll"
local RebirthTable = {"1", "5", "10", "20", "100", "500", "4000", "13500", "32000", "62500", "108000", "171500", "256000", "364000", "500000", "1000000", "2000000", "100000000"}
local SelectedRibirth;
local Teleports = {
    ["Forest"] = CFrame.new(-165, 977, -441),
    ["Flower"] = CFrame.new(-181, 1514, -648),
    ["Swamp"] = CFrame.new(-265, 2113, -660),
    ["Snow"] = CFrame.new(-243, 2931, -470),
    ["Desert"] = CFrame.new(-205, 4222, -778),
    ["Death"] = CFrame.new(-318, 5412, -480),
    ["Beach"] = CFrame.new(-178, 6869, -495),
    ["Mines"] = CFrame.new(-276, 8362, -483),
    ["Cloud"] = CFrame.new(-332, 11232, -237),
    ["Coral"] = CFrame.new(-477, 13798, -542),
    ["Dark Heart"] = CFrame.new(-446, 17166, -553),

    ["Flame Lands"] = CFrame.new(1237, 152, -2858),
    ["Molten"] = CFrame.new(1248, 2180, -2885),
    ["Blue Magma"] = CFrame.new(1337, 5229, -2934),
    ["Purple Magma"] = CFrame.new(1290, 7647, -2958),
    ["Yellow Magma"] = CFrame.new(1378, 10388, -2880),
    ["Red Magma"] = CFrame.new(1391, 13340, -2865),

    ["Fantasy"] = CFrame.new(1372, 150, -5605),
    ["Mystic Mire"] = CFrame.new(1252, 2027, -5591),
    ["Castle"] = CFrame.new(1292, 5114, -5633),
    ["Candy"] = CFrame.new(1246, 8654, -5589),
    ["Festival"] = CFrame.new(1276, 12274, -5570),
    ["Japanese"] = CFrame.new(1249, 16315, -5572),

    ["Space"] = CFrame.new(1236, 134, -7965),
    ["Frost"] = CFrame.new(1362, 1857, -7966),
    ["Toxic"] = CFrame.new(1337, 4951, -7962),
    ["Asteroid"] = CFrame.new(1423, 9578, -7964),
    ["Scrapyard"] = CFrame.new(1326, 13595, -8129),
    ["Blood"] = CFrame.new(1358, 18709, -8066),
    ["Enchantment"] = CFrame.new(37.2773132, 9.55834198, -581.941895, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    ["MountDealer"] = CFrame.new(-402.755066, -3.96583414, -672.853394, 0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, 0.707134247),
    ["PetIndex"] = CFrame.new(-236.662521, 9.20921516, -398.249054, 0.766061246, -0, -0.642767608, 0, 1, -0, 0.642767608, 0, 0.766061246),
    ["ShinyMachine"] = CFrame.new(-234.259125, 9.71887302, -553.722107, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268),
    ["RainbowMachine"] = CFrame.new(-188.256104, 13.2301722, -562.349182, 0.258864343, 0, 0.965913713, 0, 1, 0, -0.965913713, 0, 0.258864343),
    ["Store"] = CFrame.new(-90.6325073, 9.66448116, -542.430359, 0.7807042, -0, -0.624900758, 0, 1, -0, 0.624900758, 0, 0.7807042),
    ["Missions"] = CFrame.new(1302.30762, 282.919922, -5886.35791, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747),
    ["HolyForge"] = CFrame.new(1197.54846, 148.437332, -5744.16211, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627),
    ["BankStorage"] = CFrame.new(1325.26135, 147.747238, -5582.12793, 0, 1, 0, 1, 0, 0, 0, 0, -1),
    ["UltraRebirth"] = CFrame.new(1146.16064, 148.270325, -5504.5918, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    ["Christmas World"] = CFrame.new(-2951.18774, 131.724014, -5513.68848, 0.999224544, 3.8216843e-09, 0.0393742807, -6.934751e-09, 1, 7.8926881e-08, -0.0393742807, -7.91387222e-08, 0.999224544),
}


-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)




--functions

function getIslands()
    local Islands = {}

    for _,v in pairs(WS.Islands:GetChildren()) do
            table.insert(Islands, v.Name)
        end
    return Islands
end

function getEggs()
    local Eggs = {}

    for _,v in pairs(WS.Shops:GetChildren()) do
            table.insert(Eggs, v.Name)
        end
    return Eggs
end

function getTeleportNames()
    local TeleportsTab = {}

    for i,v in pairs(Teleports) do
        table.insert(TeleportsTab, i)
    end
    return TeleportsTab
end







--Main

Main:CreateToggle("Auto Click", true, function()
    local ohNumber1 = 1
    RS.Events.Tap:FireServer(ohNumber1)
end)




Main:CreateToggle("Christmas Auto Click", true, function()
local ohNumber2 = 5
RS.Events.Tap:FireServer(ohNumber2)
end)



Main:CreateDropdown("Auto Rebirth Select", RebirthTable,  function(Reb)
    SelectedRebirth = Reb
    print(SelectedRebirth)
end)


Main:CreateToggle("Auto Rebirth", true, function()
    RS.Events.Rebirth:FireServer(tonumber(SelectedRebirth))
end)








-- Teleport





tp:CreateDropdown("Select Teleport", getTeleportNames(), function(tp)
    SelectedTeleport = tp
    print(SelectedTeleport)
end)

tp:CreateButton("Teleport", function()
    if SelectedTeleport then
        Player.Character.HumanoidRootPart.CFrame = Teleports[SelectedTeleport]
    end
end)


















-- Eggs



Egg:CreateDropdown("Select Egg", getEggs(), function(Eggs)
    SelectedEggs = Eggs
end)


Egg:CreateToggle("Auto Egg", true, function()
    if SelectedEggs then
		local ohTable1 = {}
		local ohNumber3 = 1
		RS.Events.HatchEgg:InvokeServer(ohTable1, SelectedEggs, ohNumber3)
    end
end)

Egg:CreateToggle("Auto x3 Egg(PASS NEEDED)", true, function()
    if SelectedEggs then
		local ohTable1 = {}
		local ohNumber3 = 3
		RS.Events.HatchEgg:InvokeServer(ohTable1, SelectedEggs, ohNumber3)
    end
end)

Egg:CreateToggle("Auto x4 Egg(PASS NEEDED)", true, function()
    if SelectedEggs then
		local ohTable1 = {}
		local ohNumber3 = 4
		RS.Events.HatchEgg:InvokeServer(ohTable1, SelectedEggs, ohNumber3)
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

TextLabel.Parent = game:GetService("CoreGui").DumbHub
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
		game:GetService("CoreGui")DumbHub.FPStext.Text = "FPS: " .. tostring(fps) .. " Average: " .. string.format("%.0f", (sum / #FPSAverage))
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




Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/8zzP4fXNFz")
end)

