
local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("Bubble Gum Simulator")

local Main = ui:new("Main")
local Egg = ui:new("Eggs")
local Gum = ui:new("Gum/Flavors")
local Teleport = ui:new("Teleport")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"TwitterRelease", "20HourLuck", "Update78", "FrostPortal", "2020", "2hourluck", "300k", "300M", "400M", "600M", "600MBoost", "AncientTimes", "AtlantisHats", "Autumn", "AutumnSale", "BeachBoost", "BGSStream", "BGSXMAS", "BlizzyrdBest", "BlizzyrdOP", "BlizzyWizzy", "BlueCrew", "BriteJuice", "BubblePass", "Bunny", "Candy", "CANDYCANE", "CandyCanes", "Carnival", "Carnival2", "Challenges"}
local GumTable = {"Normal Gum", "Stretchy Gum", "Extra Stretchy Gum", "Chewy Gum", "Extra Chewy Gum", "Epic Gum", "VIP Gum", "Super Gum", "Super Duper Gum", "Omega Gum", "Unreal Gum", "Monster Gum", "Ultra Gum", "Quantum Gum"}
local GumFlavorsTable = {"Bubble Gum", "Blueberry", "Pizza", "Cherry", "Donut", "Chocolate", "Watermelon", "Contrast", "Gold", "Lemon", "Swirl"}
--Variables
local SelectedEgg;
local SelectedCrate;
local SelectedGumFlavors;
local SelectedGum;
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)








--functions

function getEggs()
    local Eggs = {}

    for _,v in pairs(RS.Assets.Eggs:GetChildren()) do
        table.insert(Eggs, v.Name)
    end
    return Eggs
end



function getCrates()
    local Crates = {}

    for _,v in pairs(RS.Assets.Crates:GetChildren()) do
        table.insert(Crates, v.Name)
    end
    return Crates
end


--Main


Main:CreateToggle("Auto Blow", true, function()
    local ohString1 = "BlowBubble"
    game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(ohString1)
end)

Main:CreateButton("Teleport To Sell", function()
    local ohString1 = "Teleport"
    local ohString2 = "Sell"
    
    game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(ohString1, ohString2)
end)

Main:CreateLabel("Need To Be By Sell Circle")

Main:CreateToggle("Auto Spawn Sell", true, function()
    local ohString1 = "SellBubble"
    local ohString2 = "Sell"
    
    game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(ohString1, ohString2)
end)




-- Teleport









  
--Gum

Gum:CreateDropdown("Select Spawn Gum",GumTable, function(Gum)
    SelectedGum = Gum
    print(SelectedGum)
end)




Gum:CreateButton("Buy Spawn Gum", function()
        if SelectedGum then 
    local ohString2 = "EarthGum"
    
    game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer("BuyShopItem", ohString2, "Gum", SelectedGum)
        end
end)

Gum:CreateDropdown("Select Spawn Flavors",GumFlavorsTable, function(Flavors)
    SelectedGumFlavors = Flavors
    print(SelectedGumFlavors)
end)


Gum:CreateButton("Buy Spawn Flavors", function()
    if SelectedGumFlavors then 
local ohString2 = "EarthFlavors"

game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer("BuyShopItem", ohString2, "Flavors", SelectedGumFlavors)
    end
end)



-- Eggs

Egg:CreateDropdown("Select Egg",getEggs(), function(Eggs)
    SelectedEgg = Eggs
end)

Egg:CreateDropdown("Select Crate",getCrates(), function(Crates)
    SelectedCrate = Crates
end)


Egg:CreateToggle("Auto Egg", true, function()
    if SelectedEgg then
        RS.NetworkRemoteEvent:FireServer("PurchaseEgg",SelectedEgg)
    end
end)


Egg:CreateToggle("Auto Crate", true, function()
    if SelectedCrate then
        RS.NetworkRemoteEvent:FireServer("PurchaseEgg",SelectedCrate)
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
        RS.NetworkRemoteFunction:InvokeServer("RedeemCode",v)
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
