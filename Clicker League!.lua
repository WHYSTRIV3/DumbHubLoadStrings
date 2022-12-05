local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("Clicker League")

local Main = ui:new("Main")
local Egg = ui:new("Eggs")
local Teleport = ui:new("Teleport")
local Free = ui:new("Free:)")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"Release", "Alien", "500Likes", "3kLikes", "BeastPet349", "BeastPet491", "BeastPet550"}
local RebirthTable = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16","17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35"}
--Variables
local SelectedEggs;
local SelectedRebirthTable;
local SelectedTeleports;
local SellTweenSpeed = 1
local EquipBest = false;
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

function getTeleports()
    local Teleports = {}
    for _,v in pairs(game:GetService("Workspace")["Programmed_Assets"].Teleports:GetChildren()) do
        table.insert(Teleports, v.Name)
    end
    return Teleports
end





--Main

Main:CreateToggle("Auto Click", true, function()
    RS.Events.Tap:FireServer("Click")
end)


Main:CreateDropdown("Select Rebirth", RebirthTable, function(RBT)
    SelectedRebirthTable = RBT
    print(SelectedRebirthTable)
end)

Main:CreateToggle("Auto Rebirth", true, function()
    if SelectedRebirthTable then
        RS.Events.Rebirth:FireServer(tonumber(SelectedRebirthTable))
    end
end)


Main:CreateToggle("Auto Collect Pumpkins", true, function()
    for i, v in pairs(game:GetService("Workspace")["Programmed_Assets"].CollectableCoins.Halloween.Coins:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)

Main:CreateToggle("Auto Trick or Treat", true, function()
    for i, v in pairs(game:GetService("Workspace")["Programmed_Assets"].Map.TrickOrTreats:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)

Main:CreateToggle("Auto Collect Chest", true, function()
    for i, v in pairs(game:GetService("Workspace")["Programmed_Assets"].Chests:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)









-- Teleport

Teleport:CreateDropdown("Select World", getTeleports(), function(STP)
    SelectedTeleports = STP
    print(SelectedTeleports)
end)


Teleport:CreateButton("Teleport", function()
    if SelectedTeleports then
            local TeleportCFrame =  WS["Programmed_Assets"].Teleports[SelectedTeleports]["Teleport_Part"].CFrame
            Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
    end
end)



Teleport:CreateButton("Teleport", function()
local ohInstance1 = game:GetService("Players").LocalPlayer

game:GetService("ReplicatedStorage").Events.SpinsAdd:FireServer(ohInstance1)
end)



-- Eggs

Egg:CreateDropdown("Select Egg", getEggs(), function(Eggs)
    SelectedEggs = Eggs
    print(SelectedEggs)
end)

Egg:CreateToggle("Auto Egg", true, function()
    if SelectedEggs then
        RS.Events.HatchEgg:FireServer(SelectedEggs, "One")
    end
end)

Egg:CreateToggle("Auto Triple Egg", true, function()
    if SelectedEggs then
        RS.Events.HatchEgg:FireServer(SelectedEggs, "Three")
    end
end)

Egg:CreateToggle("Auto Craft", true, function()
    RS.Functions.Pets:InvokeServer("CraftAll")
end)



Egg:CreateToggle("Auto Equip Best", true, function()
    if EquipBest == false then
        EquipBest = true
        RS.Events.Pets:FireServer("EquipBest", "Taps")
        task.wait(8)
        EquipBest = false
    end
end)



--Free

Free:CreateToggle("Free Spin Tokens", true, function()
    local ohInstance1 = game:GetService("Players").LocalPlayer
    
    game:GetService("ReplicatedStorage").Events.SpinsAdd:FireServer(ohInstance1)
end)



Free:CreateToggle("Free Potions", true, function()
local ohString1 = "potion"
local ohString2 = "Potion"

game:GetService("ReplicatedStorage").Events.WheelOfFortune:FireServer(ohString1, ohString2)
end)


Free:CreateToggle("Free Taps", true, function()
local ohString1 = "taps"
local ohNumber2 = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

game:GetService("ReplicatedStorage").Events.WheelOfFortune:FireServer(ohString1, ohNumber2)
end)

Free:CreateToggle("Free Ruby", true, function()
    local ohString1 = "ruby"
    local ohNumber2 = 250000000
    
    game:GetService("ReplicatedStorage").Events.WheelOfFortune:FireServer(ohString1, ohNumber2)
    end)
    

Free:CreateButton("Free best pet i think", function()
local ohString1 = "pet"
local ohString2 = "Illustrious Gemstone"

game:GetService("ReplicatedStorage").Events.WheelOfFortune:FireServer(ohString1, ohString2)
end)



Free:CreateToggle("Free x2 Hatch Speed", true, function()
local ohString1 = "boost"
local ohString2 = "X2 Hatch Speed"

game:GetService("ReplicatedStorage").Events.WheelOfFortune:FireServer(ohString1, ohString2)
end)

Free:CreateToggle("Free x2 Luck", true, function()
    local ohString1 = "boost"
    local ohString2 = "X2 Luck"
    
    game:GetService("ReplicatedStorage").Events.WheelOfFortune:FireServer(ohString1, ohString2)
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
