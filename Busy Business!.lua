local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("Busy Business!")

local Main = ui:new("Main")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"FREEPOINTS3", "FREEPOINTS2", "FREEPOINTS", "20KLIKES", "25KLIKES", "30KLIKES", "8MVISITS"}
local ObjectsTable = {"Blender1", "Grill1", "SodaMachine1", "SoftServeMachine1"}
local UpgradesTable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}
local Rewards = {1, 2, 3, 4, 5, 6, 7, 8, 9}
local MachineUpgrades = {"Hotdog", "Soda", "Ice Cream Cone", "Ice Cream Bar"}
--Variables

local SelectedPlots;
local SelectedObjects;
local SelectedMachine;
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)








--functions



function getPlots()
    local Plots = {}

    for _,v in pairs(WS.Plots:GetChildren()) do
            table.insert(Plots, v.Name)
        end
    return Plots
end



function getOwner()
    for _,v in pairs(WS.Plots:GetChildren()) do
		if tostring(v.Owner.Value) == Player.Name then
			SelectedPlots = v.Name
		end
	end
end

getOwner()








--Main


Main:CreateLabel("Choosen Plot: "..SelectedPlots)


Main:CreateToggle("Auto Order ", true, function()
	for _,v in pairs(WS.Plots[SelectedPlots].Customers:GetChildren()) do
		RS.Communication.CustomerOrder:FireServer(v)
	end
end)




Main:CreateToggle("Auto Make Object ", true, function()
	for _,v in pairs(WS.Plots[SelectedPlots].Objects:GetChildren()) do
	RS.Communication.UseMachine:FireServer(v, true)
	end
end)




Main:CreateToggle("Auto Serve", true, function()
	for _,v in pairs(WS.Plots[SelectedPlots].Customers:GetChildren()) do
	RS.Communication.ServeCustomer:FireServer(v)
	end
end)


Main:CreateDropdown("Select MachineUpgrade", MachineUpgrades, function(Machine)
    SelectedMachine = Machine
    print(SelectedMachine)
end)


Main:CreateToggle("Auto Upgrade Machine ", true, function()
	local ohString1 = SelectedMachine
	
	game:GetService("ReplicatedStorage").Communication.UpgradeMachine:FireServer(ohString1)
end)
	


Main:CreateToggle("Auto Upgrade", true, function()
	for _,v in pairs(Player.Character.PlayerGui.Main.Menus.Upgrades.Inner.Upgrades.Hold:GetChildren()) do
		if v:IsA("Frame") and not v.Name == "Example" then
		RS.Communication.BuyUpgrade:FireServer(tonumber(v.Name))
		end
	end
end)



Main:CreateToggle("Auto Buy Next Place", true, function()
game:GetService("ReplicatedStorage").Communication.NewShop:InvokeServer()
end)



Main:CreateToggle("Auto Rewards", true, function()
	for _,v in pairs(Rewards) do
		RS.Communication.ClaimPlaytimeReward:InvokeServer(v)
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
        RS.Remotes.Client:InvokeServer("Codes", v)
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

