

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V2%20Library.lua", true))()
local ui = Library:CreateWindow()

local L = ui:new("List")
local Main = ui:new("Main")
local Farm = ui:new("Auto Farm")
local Egg = ui:new("Eggs")
local tp = ui:new("Teleport")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"UPD1.5", "sorryforshutdowns", "15klikes", "10kactives", "10kfavorites", "5kfavorites", "200kmembers", "150kmembers", "leozimgamers", "l3ni", "1mvisits", "5klikes", "10klikes", "freespins", "opensamu"}
local UIS = game:GetService("UserInputService")
local Mobs = {"crocodile", "kizaru", "mihawk", "aokiji", "Ekune", "obito", "pain", "zabuza", "orochimaru", "madara", "cell", "frieza", "nappa", 
"raditz", "boo", "beast_titan", "armored_titan", "beast_titan", "jaw_titan", "female_titan", "colossal_titan", "beast_titan", 
"pitou", "gon", "hisoka", "killua", "chrollo", "fraudin", "galand", "derieri", "estarossa", "zeldris", "estarossa", "goblin", 
"knight", "geld", "hinata", "clayman"}
--Variables

local Teleport = true
local SelectedWorlds;
local KANdistance = 200
local SelectedEgg;
local EquipBestWait = false
local SelectedMobs;
local Rewards = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)

--functions





function getWorlds()
	local Worlds = {}

	for _,v in pairs(game:GetService("Workspace")["_ENEMIES"]:GetChildren()) do
			table.insert(Worlds, v.Name)
	end
	return Worlds
end



function getEggs()
	local Eggs = {}

	for _,v in pairs(game:GetService("Workspace")["_EGGS"]:GetChildren()) do
			table.insert(Eggs, v.Name)
	end
	return Eggs
end

function getUI()
	local UI = {}

	for _,v in pairs(Player.PlayerGui.CenterUI:GetChildren()) do
		if v:IsA("Frame") then
			table.insert(UI, v.Name)
		end
	end
	return UI
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------

--List

L:CreateLabel("Quest", "Need to be in a World to see quest")
spawn(function()
    while task.wait() do
		for _,v in pairs(game:GetService("Workspace")["_MAP"]:GetChildren()) do
			if v:IsA("Model") then
				L:EditLabel("Quest", "Quest: "..WS["_QUESTS"][tostring(v)].Mural.SurfaceGui.Background.Objectives.main["in_progress"]["_desc"].Text)
			end
		end
    end
end)

L:CreateLabel("Kills Left", "Need to be in a World to see quest kills")
spawn(function()
    while task.wait() do
		for _,v in pairs(game:GetService("Workspace")["_MAP"]:GetChildren()) do
			if v:IsA("Model") then
				L:EditLabel("Kills Left", " Kills Left: "..WS["_QUESTS"][tostring(v)].Mural.SurfaceGui.Background.Objectives.main["in_progress"]["_goal"].Text)
			end
		end
    end
end)

L:CreateLabel("", "--------------------------------------------------------------------------------------------")

L:CreateLabel("Rank Cost", "Need to be in a World")

spawn(function()
    while task.wait() do
		L:EditLabel("Rank Cost", "Next Rank Cost: "..Player.PlayerGui.CenterUI.Class.Main.Mid["can_upgrade"].price.price.Text)
    end
end)

L:CreateLabel("Sword Cost", "Need to be in a World")
spawn(function()
    while task.wait() do
		L:EditLabel("Sword Cost", "Next Sword Cost: "..Player.PlayerGui.CenterUI.Swords.Main.Mid["can_upgrade"].price.price.Text)
    end
end)

L:CreateLabel("", "--------------------------------------------------------------------------------------------")

L:CreateLabel("Meteor Timer", "Waiting For Next Meteor")
spawn(function()
    while task.wait() do
		for _,v in pairs(WS["_METEORS"]:GetChildren()) do
			L:EditLabel("Meteor Timer", "Meteor Time Left: "..WS["_METEORS"][tostring(v)]["time_remaining"].bg["_counter"].Text)
		end
    end
end)

L:CreateLabel("Raid Timer", "Waiting For Next Raid ")
spawn(function()
    while task.wait() do
		for _,v in pairs(WS["_RAID_BOSSES"]:GetChildren()) do
			L:EditLabel("Raid Timer", "Raid Time Left: "..WS["_RAID_BOSSES"][tostring(v)]["time_remaining"].bg["_counter"].Text)
		end
    end
end)

L:CreateLabel("", "--------------------------------------------------------------------------------------------")

L:CreateLabel("Easy Time Trial Timer", "Waiting for Trial ")
spawn(function()
    while task.wait() do
		L:EditLabel("Easy Time Trial Timer", "Easy Time Trial Timer Left: "..game:GetService("Workspace")["_TRIAL"].Portals.Easy.gui.closed["_text"].Text)
    end
end)

L:CreateLabel("Medium Time Trial Timer", "Waiting for Trial ")
spawn(function()
    while task.wait() do
		L:EditLabel("Medium Time Trial Timer", "Medium Time Trial Timer Left: "..game:GetService("Workspace")["_TRIAL"].Portals.Medium.gui.closed["_text"].Text)
    end
end)

L:CreateLabel("Hard Time Trial Timer", "Waiting for Trial ")
spawn(function()
    while task.wait() do
		L:EditLabel("Hard Time Trial Timer", "Hard Time Trial Timer Left: "..game:GetService("Workspace")["_TRIAL"].Portals.Hard.gui.closed["_text"].Text)
    end
end)


L:CreateToggle("Refresh List", true, function()
	L:EditLabel("Rank Cost", "Next Rank Cost: "..Player.PlayerGui.CenterUI.Class.Main.Mid["can_upgrade"].price.price.Text)
	L:EditLabel("Sword Cost", "Next Sword Cost: "..Player.PlayerGui.CenterUI.Swords.Main.Mid["can_upgrade"].price.price.Text)
	L:EditLabel("Hard Time Trial Timer", "Hard Time Trial Timer Left: "..game:GetService("Workspace")["_TRIAL"].Portals.Hard.gui.closed["_text"].Text)
	L:EditLabel("Medium Time Trial Timer", "Medium Time Trial Timer Left: "..game:GetService("Workspace")["_TRIAL"].Portals.Medium.gui.closed["_text"].Text)
	L:EditLabel("Easy Time Trial Timer", "Easy Time Trial Timer Left: "..game:GetService("Workspace")["_TRIAL"].Portals.Easy.gui.closed["_text"].Text)

		for _,v in pairs(WS["_MAP"]:GetChildren()) do
			if v:IsA("Model") then
				L:EditLabel("Kills Left", " Kills Left: "..WS["_QUESTS"][tostring(v)].Mural.SurfaceGui.Background.Objectives.main["in_progress"]["_goal"].Text)
				L:EditLabel("Quest", "Quest: "..WS["_QUESTS"][tostring(v)].Mural.SurfaceGui.Background.Objectives.main["in_progress"]["_desc"].Text)
		end
	end
		for _,v in pairs(WS["_METEORS"]:GetChildren()) do
			L:EditLabel("Meteor Timer", "Meteor Time Left: "..WS["_METEORS"][tostring(v)]["time_remaining"].bg["_counter"].Text)
		end
			for _,v in pairs(WS["_RAID_BOSSES"]:GetChildren()) do
				L:EditLabel("Raid Timer", "Raid Time Left: "..WS["_RAID_BOSSES"][tostring(v)]["time_remaining"].bg["_counter"].Text)
		end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Main

Main:CreateToggle("Auto Swing", true, function()
	RS.Remotes.Server:FireServer( {[1] = "Hit"})
end)

Main:CreateToggle("Auto Rank Up/ Upgrade Sword", true, function()
	game:GetService("ReplicatedStorage").Remotes.Server:FireServer({[1] = "Class"})
	game:GetService("ReplicatedStorage").Remotes.Server:FireServer({[1] = "Swords"})
end)

Main:CreateToggle("Auto Skill Spin", true, function()
	Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_INTERACTS"].Skills.Range.CFrame
	RS.Remotes.Server:FireServer({[1] = "SkillSpin"})
end)

Main:CreateToggle("Auto Claim Rewards", true, function()
	for _,v in pairs(Rewards) do
		game:GetService("ReplicatedStorage").Remotes.Server:FireServer({[1] = "DailyRewards", [2] = v})
	end
end)

Main:CreateToggle("Auto Claim Achivements", true, function()
	for _,v in pairs(Player.PlayerGui.CenterUI.Achievements.Main.Scroll:GetChildren()) do
		if v:IsA("ImageLabel") then
			game:GetService("ReplicatedStorage").Remotes.Server:FireServer({[1] = "Achievements", [2] = tostring(v)})
		end
	end
end)

Main:CreateToggle("Auto Accept Quest", true, function()
	game:GetService("ReplicatedStorage").Remotes.Server:FireServer({[1] = "Quest"})
end)

Main:CreateToggle("Auto Delete Notifications", true, function()
	for _,v in pairs(Player.PlayerGui.Notification.Messages:GetChildren()) do
			if v.Name == "Error" or v.Name == "Warn" or v.Name == "Success" then
			v:Destroy()
		end
	end
end)

-- Farm

Farm:CreateDropdown("Select World", getWorlds(), function(Worlds)
	SelectedWorlds = Worlds
	print(SelectWorlds)
end)

Farm:CreateDropdown("Select Mobs", Mobs, function(Mobs)
    SelectedMobs = Mobs
    print(SelectMobs)
end)

--[[Farm:CreateToggle("Auto Tween Farm", true, function()
	local mobThing = nil
	if SelectedWorlds then
		if TweenWait == false then
			TweenWait = true
				for _,v in pairs(game:GetService("Workspace")["_ENEMIES"][SelectedWorlds]:GetDescendants()) do
					if v:IsA("Model") and v.Parent:IsA("Folder") then
						local CFrameEnd = v:FindFirstChild("HumanoidRootPart").CFrame
						mobThing = v
						local Time = 5
						local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
						tween:Play()
						tween.Completed:Wait()
						TweenWait = false
				end
			end
        end
    end
	RS.Remotes.Server:FireServer( {[1] = "Hit", [2] = mobThing})
end)
--]]

Farm:CreateToggle("Auto TP Farm", true, function()
    local nearest
    local NearestOne = Dis
	if SelectedWorlds then
    	for _,v in pairs(game:GetService("Workspace")["_ENEMIES"][SelectedWorlds]:GetDescendants()) do
			if v:IsA("Model") and v.Parent:IsA("Folder") then
        		if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
					nearest = v
					NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
				end
			end
        end
    end
    if Teleport then
        Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,0,0)
    end
	RS.Remotes.Server:FireServer( {[1] = "Hit", [2] = nearest})
end)

Farm:CreateToggle("Auto Select Mob ",true,function()
	local mobThing = nil
        if SelectedWorlds then
            if SelectedMobs then
                for _, v in pairs(game:GetService("Workspace")["_ENEMIES"][SelectedWorlds]:GetDescendants()) do
					if v:IsA("Model") and v.Name == SelectedMobs  then
							if v["_stats"]["current_hp"].Value > 0 then
							mobThing = v
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,1,2)
                        end
                    end
                end
            end
        end
    RS.Remotes.Server:FireServer({[1] = "Hit", [2] = mobThing})
end)

Farm:CreateToggle("Auto Raid ", true,function()
	local BossThing = nil
	for _,v in pairs(game:GetService("Workspace")["_RAID_BOSSES"]:GetDescendants()) do
		if v:IsA("Model") and v.Parent:IsA("Folder") then
			if v:FindFirstChild("HumanoidRootPart") then
				if v["_stats"]["current_hp"].Value > 0 then
					BossThing = v
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,1,2)
					
				end
			end
		end
	end
	RS.Remotes.Server:FireServer({[1] = "Hit", [2] = BossThing})
end)


Farm:CreateToggle("Auto Meteor ", true,function()
	local MeteorThing = nil
	for _,v in pairs(game:GetService("Workspace")["_METEORS"]:GetDescendants()) do
		if v:IsA("Model") and v.Parent:IsA("Folder") then
			if v:FindFirstChild("root") then
				if v["_stats"]["current_hp"].Value > 0 then
					MeteorThing = v
					Player.Character.HumanoidRootPart.CFrame = v.root.CFrame * CFrame.new(0,2,2)
				end
			end
		end
	end
	RS.Remotes.Server:FireServer({[1] = "Hit", [2] = MeteorThing})
end)

Farm:CreateSlider("TP Farm Distance", {min = 1, max = 500, default = 200}, function(state)
    Dis = state
end)


Farm:CreateLabel("", "------------TimeTrial-----------")

local JoinWait = false

Farm:CreateToggle("Auto Join", true, function()
	if JoinWait == false then
		JoinWait = false
			Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_TRIAL"].Portals.Easy.Range.CFrame
		if game:GetService("Workspace")["_TRIAL"].Portals.Easy.gui.opened.Visible == true then 
			JoinWait = true
		end
	end
end)


Farm:CreateToggle("Auto Progrees Trial", true, function()
for _,v in pairs(game:GetService("Workspace")["_TRIAL"].Easy.Enemies:GetChildren()) do
local ohTable1 = {
	[1] = "TimeTrial",
	[2] = "TeleportRoom",
	[3] = tostring(v)
}

game:GetService("ReplicatedStorage").Remotes.Server:FireServer(ohTable1)

	end
end)


Farm:CreateToggle("Auto Time Trial", true, function()
local nearest
local NearestOne = 200
	for _,v in pairs(game:GetService("Workspace")["_TRIAL"].Easy.Enemies:GetDescendants()) do
		if v:IsA("Model") and v.Parent:IsA("Folder") then
		if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
			nearest = v
			NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
		end
	end
end
	if Teleport then
		Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,0,0)
	end
	RS.Remotes.Server:FireServer( {[1] = "Hit", [2] = nearest})
end)


--use the roon number to teleport to the next room

-- if area == 0 enimes the player teleport to door








-- Teleport



tp:CreateButton("Teleport", function()
	Player.PlayerGui.CenterUI.Teleport.Visible = true
end)



-- Eggs



Egg:CreateDropdown("Select Egg", getEggs(), function(egg)
	SelectedEgg = egg
	print(SelectedEgg)
end)


Egg:CreateToggle("Auto Egg", true, function()
	if SelectedEgg then
		Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_EGGS"][SelectedEgg].Range.CFrame * CFrame.new(0,3,0)
		game:GetService("ReplicatedStorage").Remotes.Server:FireServer({[1] = "BuyHeroes",[2] = SelectedEgg})
	end
end)


Egg:CreateToggle("Auto EquipBest", true, function()
	if EquipBestWait == false then
		EquipBestWait = true
    		for i,v in pairs(getconnections(Player.PlayerGui.CenterUI.Pets.Main.Top.EquipBest.MouseButton1Click)) do
        		v:Fire()
			task.wait(4)
			EquipBestWait = false
		end
    end
end)


--[[
Egg:CreateToggle("Auto Craft Shiny", true, function()
	for _,v in pairs(Player.PlayerGui.CenterUI.Pets.Main.Scroll:GetChildren()) do 
		if v:IsA("ImageButton") then
			if v.data.rarity == "Rare" then
				game:GetService("ReplicatedStorage").Remotes.Server:FireServer({[1] = "ShinyMachine",
				[2] = {
						[1] = v,
						[2] = v,
						[3] = v,
						[4] = v,
						[5] = v
					}
				})
			end
		end
	end
end)
--]]


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
		game:GetService("ReplicatedStorage").Remotes.Server:FireServer({[1] = "Codes", [2] = v})
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

Misc:CreateButton("Refresh ", function()
    game:GetService("CoreGui").DumbHubV2:Destroy()
	task.wait(2)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/DumbHub.lua"))()
end)


Misc:CreateButton("Uninject", function()
    game:GetService("CoreGui").DumbHubV2:Destroy()
end)

Misc:CreateButton("Uninject and Rejoin", function()
    game:GetService("CoreGui").DumbHubV2:Destroy()
    TeleportService:Teleport(game.PlaceId)
end)
