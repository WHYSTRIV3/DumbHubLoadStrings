local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/FATALITY.lua", true))()
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

--Variables

local Saved;
local SelectedTeleport;
local SelectedRebirths;
local SelectedEggs;

-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions


function getWorlds()
    local Worlds = {}

    for i,v in pairs(game:GetService("Workspace").Scripted.Islands:GetChildren()) do
        table.insert(Worlds, v.Name)
    end
    return Worlds
end

function getEggs()
    local Eggs = {}

    for i,v in pairs(game:GetService("Workspace").Scripted.EggHolders:GetChildren()) do
        table.insert(Eggs, v.Name)
    end
    return Eggs
end

function getRebirths()
    local Rebirths = {}

    for i,v in pairs(Player.PlayerGui.Rebirth.Holder.Holder.ScrollHolder.ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") then
            table.insert(Rebirths, v.Name)
        end
    end
    return Rebirths
end

function getUpgrades()
    local Upgrades = {}

    for i,v in pairs(Player.PlayerGui.SpawnUpgrades.Holder.Holder.ScrollHolder.ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") then
            table.insert(Upgrades, v.Name)
        end
    end
    return Upgrades
end



--Main


Main:CreateToggle("Auto Click", true, function()
    game:GetService("ReplicatedStorage").Events.Click:FireServer()
end)


Main:CreateDropdown("Selected Rebirth" ,getRebirths(), function(Rebirths)
    SelectedRebirths = Rebirths
    print(SelectedRebirths)
end)

Main:CreateToggle("Auto Rebirth", true, function()
    if SelectedRebirths then
        game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(tonumber(SelectedRebirths))
    end
end)

Main:CreateToggle("Auto Upgrade", true, function()
    for i,v in pairs(Player.PlayerGui.SpawnUpgrades.Holder.Holder.ScrollHolder.ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") then
            game:GetService("ReplicatedStorage").Functions.PurchaseUpgrade:InvokeServer("Spawn", tostring(v))
        end
    end
end)

Main:CreateToggle("Auto Claim Daily Rewards", true, function()
    for i,v in pairs(Player.PlayerGui.DailyRewards.Holder.Holder.Reward.Holder.Rewards:GetChildren()) do
        if v:IsA("ImageButton") then
            game:GetService("ReplicatedStorage").Events.CollectDailyReward:FireServer(tostring(v))
        end
    end
end)

Main:CreateToggle("Auto IncreaseMastery", true, function()
    game:GetService("ReplicatedStorage").Functions.IncreaseMastery:InvokeServer()
end)

Main:CreateToggle("Auto Buy Potions", true, function()
    game:GetService("ReplicatedStorage").Functions.BuyPotion:InvokeServer("Click", 1)

    game:GetService("ReplicatedStorage").Functions.BuyPotion:InvokeServer("Gem", 1)

    game:GetService("ReplicatedStorage").Functions.BuyPotion:InvokeServer("Rebirth", 1)

    game:GetService("ReplicatedStorage").Functions.BuyPotion:InvokeServer("Luck", 1)
end)


Main:CreateToggle("Auto Collect Chest", true, function()
    for i, v in pairs(game:GetService("Workspace").Scripted.Chests:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)





-- Teleport

tp:CreateDropdown("Selected Teleport" ,getWorlds(), function(Teleport)
     SelectedTeleport = Teleport
     print(SelectedTeleport)
end)

tp:CreateButton("Teleport", function()
    if SelectedTeleport then
        Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Scripted.Islands[SelectedTeleport].SpawnPoint.CFrame
    end
end)    


tp:CreateButton("Save Position", function()
	Saved = Player.Character.HumanoidRootPart.CFrame
	game.StarterGui:SetCore("SendNotification", {
		Title = "Saved Position";
		Text = "Your position has been saved"; 
		Icon = "rbxassetid://12469060106";
		Duration = 3;
	})
end)

tp:CreateButton("Teleport To Saved Position", function()
	Player.Character.HumanoidRootPart.CFrame = Saved
end)


-- Eggs


Egg:CreateDropdown("Selected Egg", getEggs(), function(Eggs)
    SelectedEggs = Eggs
    print(SelectedEggs)
end)

Egg:CreateToggle("Auto Egg", true, function()
    if SelectedEggs then
        RS.Functions.Hatch:InvokeServer(tostring(SelectedEggs), "Single")
    end
end)

Egg:CreateToggle("Auto x3 Egg(PassNeeded)", true, function()
    if SelectedEggs then
        RS.Functions.Hatch:InvokeServer(tostring(SelectedEggs), "Triple")
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

TextLabel.Parent = game:GetService("CoreGui").V3DumbHub
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
		game:GetService("CoreGui").V3DumbHub.FPStext.Text = "FPS: " .. tostring(fps) .. " Average: " .. string.format("%.0f", (sum / #FPSAverage))
		if (tick() - LastTick) >= 15 then
			FPSAverage = { }
			LastTick = tick()
		end
		LastTick = tick()
	end
end)


Misc:CreateButton("Show/Hide FPS Counter", function()
	game:GetService("CoreGui").V3DumbHub.FPStext.Visible = not game:GetService("CoreGui").V3DumbHub.FPStext.Visible
	Ticking = not Ticking
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


Misc:CreateButton("Hide User", function()
	getgenv().settings = {
		['HiddenName'] = "Subscribe To DumbHub2.0"
	}
	
	local Player = game.Players.LocalPlayer
	local function HideName(oldName)
		for Index, Value in next, game:GetDescendants() do 
			if Value.ClassName == "TextLabel" or Value.ClassName == "TextButton" then 
				
				local str = Value.Text:gsub(oldName,settings.HiddenName)
				str = str:gsub(Player.Name,settings.HiddenName)
				str = str:gsub(Player.DisplayName, settings.HiddenName)
				Value.Text = str 
				Value:GetPropertyChangedSignal("Text"):Connect(function()
					local str = Value.Text:gsub(Player.Name,settings.HiddenName)
					str = str:gsub(Player.DisplayName, settings.HiddenName)
					Value.Text = str 
				end)
			end
		end
	end
	
	
	HideName(Player.Name)
	
	
	game.DescendantAdded:Connect(function(Value)
		if Value.ClassName == "TextLabel" or Value.ClassName == "TextButton" then 
			
			local str = Value.Text:gsub(Player.Name, settings.HiddenName)
			str = str:gsub(Player.DisplayName, settings.HiddenName)
			Value.Text = str 
			Value:GetPropertyChangedSignal("Text"):Connect(function()
				local str = Value.Text:gsub(Player.Name,settings.HiddenName)
				str = str:gsub(Player.DisplayName, settings.HiddenName)
				Value.Text = str 
			end)
	
		end
	end)
end)


local TeleportService = game:GetService("TeleportService")


Misc:CreateButton("Refresh UI", function()
    game:GetService("CoreGui").V3DumbHub:Destroy()
	task.wait(1)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/DumbHub.lua"))()
end)


Misc:CreateButton("Uninject", function()
    game:GetService("CoreGui").V3DumbHub:Destroy()
end)


Misc:CreateButton("Uninject and Rejoin", function()
    game:GetService("CoreGui").V3DumbHub:Destroy()
    TeleportService:Teleport(game.PlaceId)
end)
