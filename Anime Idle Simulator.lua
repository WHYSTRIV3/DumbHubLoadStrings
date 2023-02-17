
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V2%20Library.lua", true))()
local ui = Library:CreateWindow()


local Main = ui:new("Main")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"UPDATE1"}
local Achievements = {"Damage", "Level", "Playtime", "Chest", "Sell", "Reincarnate"}
local Numbers = {1, 2, 3, 4, 5}
--Variables

local Teleport = true
local SelectedPlayer;



-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions

function getPlayers()
	local Players = {}

	for _,v in pairs(game:GetService("Players"):GetChildren()) do
		table.insert(Players, v.Name)
	end
	return Players
end











--Main

Main:CreateDropdown("Select User", getPlayers(), function(Players)
	SelectedPlayer = Players
	print(SelectedPlayer)
end)

Main:CreateToggle("Auto Farm", true, function()
		for _,v in pairs(WS.Game.Hits:GetDescendants()) do
			if v:IsA("Model") and v.Parent:IsA("Folder") then
				local CFrameEnd = v:FindFirstChild("HumanoidRootPart").CFrame
				local Time = 0.5
				local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
				tween:Play()
				tween.Completed:Wait()
			
		end
	end
		if SelectedPlayer then
			if Player.PlayerGui.HUD.Up.Deaths.Label.Text == "10/10" or "1/1" then
				local CFrameEnd = game:GetService("Workspace").Game.PlayerIslands[SelectedPlayer].Buttons.NextLevel["Meshes/circle31"].CFrame
				local Time = 0.1
				local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
				tween:Play()
				tween.Completed:Wait()
			end
		end
	RS._GAME._MODULES.Utilities.NetworkUtility.Functions.Weapon:InvokeServer("Swing")
end)


Main:CreateToggle("Auto Collect", true, function()
    for _,v in pairs(game:GetService("Workspace").Debris.Orbs:GetChildren()) do
		if v:IsA("Part") then
		local Time = 1
		local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(Time), {CFrame = Player.Character.HumanoidRootPart.CFrame})
		tween:Play()
		tween.Completed:Wait()
		end
    end
end)




Main:CreateToggle("Auto Hire", true, function()
	RS._GAME._MODULES.Utilities.NetworkUtility.Events.Allies:FireServer("Hire")
end)



Main:CreateToggle("Auto Reincarnate", true, function()
	RS._GAME._MODULES.Utilities.NetworkUtility.Events.Reincarnate:FireServer()
	---------------------------------------------------------------------------
	for _,v in pairs(Player.PlayerGui.Feedback.Stream:GetDescendants()) do
		if v.Name == "Message" then
			v:Destroy()
		end
	end
end)

Main:CreateToggle("Auto Claim Achievements", true, function()
	for _,v in pairs(Achievements) do
		for _,A in pairs(Numbers) do
			game:GetService("ReplicatedStorage")._GAME._MODULES.Utilities.NetworkUtility.Functions["Claim Achievement"]:InvokeServer(tostring(v), tonumber(A))
		end
	end
end)



Main:CreateToggle("Auto Upgrade Allies", true, function()
	if SelectedPlayer then
		for _,v in pairs(game:GetService("Workspace").Game.PlayerIslands[SelectedPlayer].Allies:GetChildren()) do 
			game:GetService("ReplicatedStorage")._GAME._MODULES.Utilities.NetworkUtility.Events.Allies:FireServer("Upgrade", tonumber(v.Name), 1)
		end
	end
	for _,v in pairs(Player.PlayerGui.Feedback:GetChildren()) do 
		if v.Name == "Verification" then
			v:Destroy()
		end
	end
	LI.UIBlur.Visible = false
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

TextLabel.Parent = game:GetService("CoreGui").DumbHubV2
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
		game:GetService("CoreGui").DumbHubV2.FPStext.Text = "FPS: " .. tostring(fps) .. " Average: " .. string.format("%.0f", (sum / #FPSAverage))
		if (tick() - LastTick) >= 15 then
			FPSAverage = { }
			LastTick = tick()
		end
		LastTick = tick()
	end
end)


Misc:CreateButton("Show/Hide FPS Counter", function()
	game:GetService("CoreGui").DumbHubV2.FPStext.Visible = not game:GetService("CoreGui").DumbHubV2.FPStext.Visible
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
    game:GetService("CoreGui").DumbHubV2:Destroy()
	task.wait(1)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/DumbHub.lua"))()
end)


Misc:CreateButton("Uninject", function()
    game:GetService("CoreGui").DumbHubV2:Destroy()
end)


Misc:CreateButton("Uninject and Rejoin", function()
    game:GetService("CoreGui").DumbHubV2:Destroy()
    TeleportService:Teleport(game.PlaceId)
end)
