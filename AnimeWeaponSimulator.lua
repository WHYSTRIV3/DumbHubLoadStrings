
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V2%20Library.lua", true))()
local ui = Library:CreateWindow()


local Main = ui:new("Main")
local Farm = ui:new("AutoFarm")
local Egg = ui:new("Eggs")
local tp = ui:new("Teleport")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"AWSIMULATER", "NINJAWORLD"}
--Variables
local Wait = false
local Teleport = true
local PetWait = false
local SelectedEggs;
local WepWait = false
local Teleports = {
    ["Naruto"] = CFrame.new(3.60548782, 1.25007296, -25.1732044),
    ["One Piece"] = CFrame.new(0.160696268, 2.41139603, 3497.68555),
    ["Dragon Ball"] = CFrame.new(-1.75369334, 1.88815427, 6999.05762),
	["One Punch"] = CFrame.new(3.27097845, 2.47178888, 10493.7295),
	["Demon Slayer"] = CFrame.new(-2.11921477, 2.47054887, 13994.7832),
	["JoJo"] = CFrame.new(-5.39369535, 2.47097063, 17510.3926)

}
local Doors = {2, 3, 4, 5, 6}
local AttackWait = false
local SelectedMobs;
local SelectedDungeons;
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)



----------Dungeons-------------

local DungeonsPseudo = {
	["Easy Dungeon"] = game:GetService("Workspace").Enemy["简单地下城"].Name,
	["Normal Dungeon"]   = game:GetService("Workspace").Enemy["普通地下城"].Name,
	["Difficult Dungeon"] = game:GetService("Workspace").Enemy["困难地下城"].Name

  }


  local Dungeons = {"Easy Dungeon", "Normal Dungeon", "Difficult Dungeon"}


----------Worlds-------------
local WorldsPseudo = {
	Naruto     = WS["场景"][1],
	OnePiece   = WS["场景"][2],
	DragonBall = WS["场景"][3],
	OnePunch =  WS["场景"][4],
	DemonSlayer =  WS["场景"][5],
	JoJo =  WS["场景"][6]
  }

local Worlds = {"Naruto", "OnePiece", "DragonBall", "OnePunch", "DemonSlayer", "JoJo"}


----------Eggs-------------

local EggsPseudo = {
	["Naruto Scroll"] = WS["场景"][1]["抽奖"]["宠物蛋1"].EggId.Value,
	["OnePiece Scroll"]  = WS["场景"][2]["抽奖"]["宠物蛋1"].EggId.Value,
	["DragonBall Scroll"] = WS["场景"][3]["抽奖"]["宠物蛋2"].EggId.Value,
	["OnePunch Scroll"] =  WS["场景"][4]["抽奖"]["宠物蛋4"].EggId.Value,
	["DemonSlayer Scroll"] =  WS["场景"][5]["抽奖"]["宠物蛋5"].EggId.Value,
	["JoJo Scroll"] =  WS["场景"][6]["抽奖"]["宠物蛋6"].EggId.Value
  }

  local Eggs = {"Naruto Scroll", "OnePiece Scroll", "DragonBall Scroll", "OnePunch Scroll", "DemonSlayer Scroll", "JoJo Scroll"}

----------Mobs-------------

local MobsPseudo = {
	["Noob Ninja"] = game:GetService("Workspace").Enemy[1]["世界1_小怪1"].Name,
	["Ninja"] = game:GetService("Workspace").Enemy[1]["世界1_小怪2"].Name,
	["Zans"] = game:GetService("Workspace").Enemy[1]["世界1_小怪3"].Name,
	["Teyu"] = game:GetService("Workspace").Enemy[1]["世界1_小怪4"].Name,
	["Zabuzhan"] = game:GetService("Workspace").Enemy[1]["世界1_小怪5"].Name,
	["Deidala"] = game:GetService("Workspace").Enemy[1]["世界1_Boss"].Name,
	["Marine"] = game:GetService("Workspace").Enemy[2]["世界2_小怪1"].Name,
	["Pirate"] = game:GetService("Workspace").Enemy[2]["世界2_小怪2"].Name,
	["Pirate Leader"] = game:GetService("Workspace").Enemy[2]["世界2_小怪3"].Name,
	["Mr.500"] = game:GetService("Workspace").Enemy[2]["世界2_小怪4"].Name,
	["Mr.100"] = game:GetService("Workspace").Enemy[2]["世界2_小怪5"].Name,
	["Mr.0"] = game:GetService("Workspace").Enemy[2]["世界2_Boss"].Name,
	["Aggressor"] = game:GetService("Workspace").Enemy[3]["世界3_小怪1"].Name,
	["Aggressor Leader"] = game:GetService("Workspace").Enemy[3]["世界3_小怪2"].Name,
	["Alien"] = game:GetService("Workspace").Enemy[3]["世界3_小怪3"].Name,
	["Alien Leader"] = game:GetService("Workspace").Enemy[3]["世界3_小怪4"].Name,
	["Friesa Servent"] = game:GetService("Workspace").Enemy[3]["世界3_小怪5"].Name,
	["Friesa"] = game:GetService("Workspace").Enemy[3]["世界3_Boss"].Name,
	["CrabMan"] = game:GetService("Workspace").Enemy[4]["世界4_小怪1"].Name,
	["Muscle Man"] = game:GetService("Workspace").Enemy[4]["世界4_小怪2"].Name,
	["Demon Man"] = game:GetService("Workspace").Enemy[4]["世界4_小怪3"].Name,
	["Kelp Man"] = game:GetService("Workspace").Enemy[4]["世界4_小怪4"].Name,
	["Deep Sea King"] = game:GetService("Workspace").Enemy[4]["世界4_小怪5"].Name,
	["Hungry Wolf"] = game:GetService("Workspace").Enemy[4]["世界4_Boss"].Name,
	["Noob Ghost"] = game:GetService("Workspace").Enemy[5]["世界5_小怪1"].Name,
	["Ghost"] = game:GetService("Workspace").Enemy[5]["世界5_小怪2"].Name,
	["Demon"] = game:GetService("Workspace").Enemy[5]["世界5_小怪3"].Name,
	["Aseli"] = game:GetService("Workspace").Enemy[5]["世界5_小怪4"].Name,
	["Demon Leader"] = game:GetService("Workspace").Enemy[5]["世界5_小怪5"].Name,
	["Lui"] = game:GetService("Workspace").Enemy[5]["世界5_Boss"].Name,
	["Yo"] = game:GetService("Workspace").Enemy[6]["世界6_小怪1"].Name,
	["Vampire"] = game:GetService("Workspace").Enemy[6]["世界6_小怪2"].Name,
	["Esidisi"] = game:GetService("Workspace").Enemy[6]["世界6_小怪3"].Name,
	["Cars"] = game:GetService("Workspace").Enemy[6]["世界6_小怪4"].Name,
	["Dios"] = game:GetService("Workspace").Enemy[6]["世界6_小怪5"].Name,
	["Dios Mega"] = game:GetService("Workspace").Enemy[6]["世界6_Boss"].Name,


  }


  local Mobs = {"Noob Ninja", "Ninja","Zans", "Teyu", "Zabuzhan","Deidala", "Marine", "Pirate", "Pirate Leader", "Mr.500", "Mr.100", "Mr.0", "Aggressor", "Aggressor Leader", "Alien", 
  "Alien Leader", "Friesa Servent", "Friesa", "CrabMan", "Muscle Man", "Demon Man", "Kelp Man", "Deep Sea King", "Hungry Wolf", 
  "Noob Ghost", "Ghost", "Demon", "Aseli", "Demon Leader", "Lui", "Yo", "Vampire", "Esidisi", "Cars", "Dios", "Dios Mega"}



----------Labels-------------





--functions


function getWorlds()
    local Worlds = {}

    for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do 
        table.insert(Worlds, v.Name)
    end
    return Worlds
end



function getTeleportNames()
    local TeleportsTab = {}

    for i,v in pairs(Teleports) do
        table.insert(TeleportsTab, i)
    end
    return TeleportsTab
end

function getWorlds()
    local Worlds = {}

	for _,v in pairs(WS["场景"]:GetChildren()) do
		if v:IsA("Model")   then
			table.insert(Worlds, v.Name)
		end
    end
    return Worlds
end



--Main
Main:CreateToggle("Auto Swing", true, function()
	if AttackWait == false then
		AttackWait = true
			game:GetService("ReplicatedStorage").System.SystemClick.Click:FireServer()
		task.wait(0.1)
	   AttackWait = false
 	end
end)




Main:CreateToggle("Auto Collect Coins", true, function()
    for _,v in pairs(WS:GetChildren()) do
		if v.Name == "2D物品" then
		local Time = 1
		local tween = game:GetService("TweenService"):Create(v, TweenInfo.new(Time), {CFrame = Player.Character.HumanoidRootPart.CFrame})
		tween:Play()
		tween.Completed:Wait()
		end
    end


	for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v:IsA("Model") then
			for _,A in pairs(v:GetChildren()) do
				if A:IsA("Part") and A.Parent:IsA("Model")  then
					if A.Name == "TouchPart" then
						local giver = A
						giver.CFrame = Player.Character.HumanoidRootPart.CFrame
						task.wait(0.1)
						giver.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(-1000, -1000, 10000000)
					end
				end
			end
		end
	end
end)


Main:CreateToggle("Auto Rank Up", true, function()
	game:GetService("ReplicatedStorage").Msg.RemoteEvent:FireServer("重生")
end)

Main:CreateToggle("Auto Buy Doors", true, function()
	for _,v in pairs(Doors) do 
		game:GetService("ReplicatedStorage").Msg.RemoteEvent:FireServer("解锁世界", tonumber(v))
	end
end)

Main:CreateToggle("Auto Spin Wheel", true, function()
	game:GetService("ReplicatedStorage").System.SystemDailyLottery.Spin:InvokeServer()
end)

-- Farm


Farm:CreateDropdown("Select World", Worlds, function(Worlds)
    SelectedWorlds = WorldsPseudo[Worlds]
	print(SelectedWorlds)
end)


Farm:CreateDropdown("Select Mobs", Mobs, function(Mobs)
    SelectedMobs = MobsPseudo[Mobs]
    print(SelectedMobs)
end)

Farm:CreateDropdown("Select Dungeon", Dungeons, function(Dungeons)
    SelectedDungeons = DungeonsPseudo[Dungeons]
    print(SelectedDungeons)
end)




Farm:CreateToggle("Auto TP Farm", true, function()
    local nearest
    local NearestOne = 3000
	if SelectedWorlds then
    for _,v in pairs(game:GetService("Workspace").Enemy[tostring(SelectedWorlds)]:GetDescendants()) do
		if v:IsA("Model") and v.Parent:IsA("Folder") then
			if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HP") and v.HP.Value > 0 then
        		if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            		nearest = v
         			NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
				end
			end
		end
    end
end
	if Teleport then
    	Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,1,3)
end
	if AttackWait == false then
		AttackWait = true
			game:GetService("ReplicatedStorage").System.SystemClick.Click:FireServer()
		task.wait(0.1)
	   AttackWait = false
	end
end)


Farm:CreateToggle("Auto Selected Mobs Farm ",true,function()
	local mobThing = nil
        if SelectedWorlds then
            if SelectedMobs then
                for _, v in pairs(game:GetService("Workspace").Enemy[tostring(SelectedWorlds)]:GetDescendants()) do
					if v:IsA("Model") and v.Name == SelectedMobs  then
							if v.HP.Value > 0 then
							mobThing = v
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,1,2)
                        end
                    end
                end
            end
        end
    	if AttackWait == false then
			AttackWait = true
				game:GetService("ReplicatedStorage").System.SystemClick.Click:FireServer()
			task.wait(0.1)
		   AttackWait = false
		end
end)


Farm:CreateToggle("Auto Dungeon Farm", true, function()
    local nearest
    local NearestOne = 100
	if SelectedDungeons then
    for _,v in pairs(game:GetService("Workspace").Enemy[tostring(SelectedDungeons)]:GetDescendants()) do
		if v:IsA("Model") and v.Parent:IsA("Folder") then
        		if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
            		nearest = v
         			NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
			end
		end
    end
end
	if Teleport then
    	Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,1,3)
end
	if AttackWait == false then
		AttackWait = true
			game:GetService("ReplicatedStorage").System.SystemClick.Click:FireServer()
		task.wait(0.1)
	   AttackWait = false
	end
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



Egg:CreateDropdown("Select Egg", Eggs, function(Eggs)
    SelectedEggs = EggsPseudo[Eggs]
	print(SelectedEggs)
end)


Egg:CreateToggle("Auto Egg", true, function()
	if SelectedEggs then
		game:GetService("ReplicatedStorage").Tool.DrawUp.Msg.DrawHero:InvokeServer(SelectedEggs, 1)
	end
end)

Egg:CreateToggle("Auto Egg", true, function()
	if SelectedEggs then
		game:GetService("ReplicatedStorage").Tool.DrawUp.Msg.DrawHero:InvokeServer(SelectedEggs, 3)
	end
end)

Egg:CreateToggle("Auto EquipBest Pet", true, function()
	if PetWait == false then
		PetWait = true
			game:GetService("ReplicatedStorage").ServerMsg.WearBestPet:InvokeServer()
		task.wait(5)
		PetWait = false
	end
end)


Egg:CreateToggle("Auto EquipBest Weapon", true, function()
	if WepWait == false then 
		WepWait = true
			game:GetService("ReplicatedStorage").Msg.RemoteEvent:FireServer("装备最佳武器")
		task.wait(5)
	   WepWait = false
	end
end)


Egg:CreateToggle("Auto Craft Weapons", true, function()
	for _,v in pairs(game:GetService("Players").WHYSTRlVE.PlayerGui.ScreenGui["武器"].Frame.ScrollPet:GetDescendants()) do
		if v.Name == "onlyID" then
			game:GetService("ReplicatedStorage").Msg.RemoteEvent:FireServer("武器合成", v.Value)
		end
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
        RS.ServerMsg.Code:InvokeServer(v)
    end
end)


Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
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



Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/ups8GeuYAD")
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
	task.wait(5)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/DumbHub.lua"))()
end)
