local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/FATALITY.lua", true))()
local ui = Library:CreateWindow()



local Main = ui:new("Main")
local Farm = ui:new("Auto Farm")
local Dungeon = ui:new("Dungeon")
local Craft = ui:new("Craft")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"Update12", "22K5LIKES", "25KLIKES", "14KFAV", "14K5FAV", "15KFAV", "15K5FAV", "Update11P2", "13K5FAV", "4KON", "Update11", "GUILDS"}

--Variables
local Rewards = {"1", "2", "3", "4", "5", "6", "7", "8"}
local Saved;
local SelectedTeleport;
local SelectedDungeons;
local Teleport = true
local SelectedDAFks;
local SelectedMob;
local SelectedCrafts;
local Potions = {"Speed_Potion_I", "Lucky_Potion_I", "Lucky_Potion_II"}
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)


getgenv().ToggleTable = { 
	Toggles = {
		CollectCoins = false,
		CollectOrbs = false,
		CollectPotions = false,
		IgnoreHoneyCollect = false,
		ConvertBalloon = false,
		FarmFuzzyBombs = false,
		FarmBubbleBloat = false,
		FarmBalloon = false,
		AutoSticker = false,
		FarmingField = false,
		FarmFlames = false,
		farmflower = false,
		AutoHoneyMaskEquip = false,

	}
}



--functions


function getDungeons()
    local Dungeons = {}

    for i,v in pairs(Player.PlayerGui.General.Labyrinth:GetChildren()) do
        table.insert(Dungeons, v.Name)
	end
    return Dungeons
end

function getAFK()
    local AFK = {}

    for i,v in pairs(Player.PlayerGui.General.AFK:GetChildren()) do
        table.insert(AFK, v.Name)
	end
    return AFK
end



function getMobs()
    local Mobs = {}

    for i,v in pairs(game:GetService("Workspace").Debris.Monsters:GetDescendants()) do
		if v:IsA("TextLabel") and v.Name == "Mob_Name" then
        	table.insert(Mobs, v.Text)
		end
	end
    return Mobs
end




function getTPs()
    local TPs = {}

    for i,v in pairs(game:GetService("Workspace")["Upgrades Power Etc"]:GetChildren()) do
        table.insert(TPs, v.Name)
	end
    return TPs
end


function getCrafts()
    local Crafts = {}

    for i,v in pairs(game:GetService("Players").WHYSTRlVE.PlayerGui.Crafting["Crafting_General"].Left.ScrollingFrame:GetDescendants()) do
		if v:IsA("TextLabel") and v.Name == "Title" then
        	table.insert(Crafts, v.Text)
		end
	end
    return Crafts
end


--Main

Main:CreateDivider("Main Stuff")

Main:CreateToggle("Auto Roll", true, function()
	game:GetService("ReplicatedStorage").Events.To_Server:FireServer(unpack({[1] = {["Open_Amount"] = 1,["Action"] = "Gacha_Activate",["Name"] = "Avatars_1"}}))
end)


Main:CreateToggle("Auto Collect Coins", false, function(x)
	Toggled = x
	spawn(function()
	while Toggled do
		task.wait()
		if Toggled then
			local coins = game:GetService("Workspace").Debris["Pickup_Debris_1"].Coins:GetChildren()
			for _, coin in ipairs(coins) do
				local proximityPrompt = coin:FindFirstChildOfClass("ProximityPrompt")
				if proximityPrompt then
					fireproximityprompt(proximityPrompt)
					local coinModel = coin:FindFirstChild("Coin")
						if coinModel then
							Player.Character:MoveTo(coinModel.Position)
                		end
            		end
        		end
    		end
		end
	end)
end)


Main:CreateToggle("Auto Collect Potion", true, function(enabled)
	Toggled = x
	spawn(function()
	while Toggled do
		task.wait()
		if Toggled then
				local Potions = game:GetService("Workspace").Debris["Pickup_Debris_1"].Potions:GetChildren()
				for _, Potion in ipairs(Potions) do
					local proximityPrompt = Potion:FindFirstChildOfClass("ProximityPrompt")
					if proximityPrompt then
						fireproximityprompt(proximityPrompt)
						local PotionModel = Potion:FindFirstChild("Main")
						if PotionModel then
							Player.Character:MoveTo(PotionModel.Position)
						end
					end
				end
			end
		end
	end)
end)

Main:CreateToggle("Auto Collect Orbs", true, function()
	for i,v in pairs(game:GetService("Workspace").Debris["Pickup_Orbs"]:GetDescendants()) do
		Player.Character.HumanoidRootPart.CFrame = v.Star.CFrame
	end
end)


Main:CreateToggle("Auto Claim Rewards", true, function()
	for i,v in pairs(Rewards) do
		game:GetService("ReplicatedStorage").Events.To_Server:FireServer(unpack({[1] = {["Action"] = "Hourly_Rewards",["Id"] = tonumber(v)}}))	
	end
end)




Main:CreateToggle("Auto Use Collectable Potions", true, function()
	for i,v in pairs(Potions) do
		local args = {[1] = {["Selected"] = {[1] = tostring(v)},["Action"] = "Use",["Category"] = "Resources"}}
		game:GetService("ReplicatedStorage").Events.Inventory:FireServer(unpack(args))
	end
end)

--Farm 

local Farms = {"TeleportToSelectedMob",  "All Mobs"}

Farm:CreateDivider("Auto Farm")

Farm:CreateLabel("Gotta Use The Free Auto Click To Attack Mobs", "Gotta Use The Free Auto Click To Attack Mobs")

Farm:CreateDropdown("Selected Farm", Farms, function(Farm)
	_G.SelectedFarm = Farm
end)


Farm:CreateDropdown("Selected Mob", getMobs(), function(Mob)
	_G.SelectedMob = Mob
end)



Farm:CreateToggle("Auto Farm", true, function()
    if _G.SelectedFarm == "TeleportToSelectedMob" then

		local mobThing = nil

            if _G.SelectedMob then
                for _, v in pairs(game:GetService("Workspace").Debris.Monsters:GetDescendants()) do
					if v:IsA("Model") and WS.Debris.Monsters[tostring(v)].BillboardGui.Frame["Mob_Name"].Text == _G.SelectedMob  then
						mobThing = v
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,1,2)
					end
				end
			end
		

        elseif _G.SelectedFarm == "All Mobs" then
        
        local nearest
        local NearestOne = 1000
                for i,v in pairs(game:GetService("Workspace").Debris.Monsters:GetDescendants()) do
                        if v:IsA("Model") and v.Parent:IsA("Folder") then
                            if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
                            nearest = v
                            NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                        end
                    end
                end
        if Teleport then
            Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
        end
    end
end)






-- Dungeon



local Dungeons = {"E-Rank", "C-Rank", "A-Rank", "S-Rank", "SS-Rank"}

local AFk = {"Easy-F", "Medium-C", "Hard-A", "???-S"}





Dungeon:CreateDivider("Dungeon Farm")

Dungeon:CreateLabel("Gotta Use The Free Auto Click To Attack Mobs", "Gotta Use The Free Auto Click To Attack Mobs")


Dungeon:CreateDropdown("Selected Dungeon", Dungeons, function(Dungeons)
	SelectedDungeons = Dungeons
end)


Dungeon:CreateToggle("Auto Join Dungeon", false, function(x)
	Toggled = x
		spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
    			if SelectedDungeons then
					for i,v in pairs(Player.PlayerGui.Notifications.Global:GetDescendants()) do
						if v:IsA("TextLabel") and v.Text == "Dungeon Opened [" ..SelectedDungeons..  "] (Closing In 02m)" then
							task.wait(2)
							Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Dungeons["Start_Labyrinth"][SelectedDungeons][SelectedDungeons].CFrame
						end
					end
						if Player.PlayerGui.General.Labyrinth[SelectedDungeons].Visible == true then
						local args = {[1] = {["Type"] = "Labyrinth",["Action"] = "Enter_Dungeon",["Name"] = tostring(SelectedDungeons)}}
							game:GetService("ReplicatedStorage").Events.To_Server:FireServer(unpack(args))
							task.wait(2)
						
					end
				end
			end
		end
	end)
end)

local IgnoreBossRoom = false
Dungeon:CreateToggle("Ignore Boss Room Till The End", true, function(x)
    IgnoreBossRoom = x
end)


Dungeon:CreateToggle("Auto Open Doors", false, function(x)
    local Enemies = Player.PlayerGui.General["Labyrinth_UI_Header"].ImageLabel.Frame.Enemies.TextLabel
    Toggled = x
    spawn(function()
        while Toggled do
            task.wait()
            if Toggled then
                if Enemies.Text == "Enemies: 0/0" or Enemies.Text == "Enemies: 0/5" or Enemies.Text == "Enemies: 0/3" or Enemies.Text == "Enemies: 0/1" then
                    local NearestDistance = math.huge 
                    local NearestDoor = nil 
                    local playerPosition = Player.Character.HumanoidRootPart.Position 
                    
                    for _, v in pairs(game:GetService("Workspace").Dungeons.Labyrinth:GetDescendants()) do
                        if v:IsA("MeshPart") and v.Name == "Door" then
                            local doorPosition = v.Position
                            local distance = (doorPosition - playerPosition).Magnitude
                            
                            if IgnoreBossRoom then
                                local isBossRoom = false
                                for _, child in pairs(v:GetChildren()) do
                                    if child:IsA("TextLabel") and child.Text == "Boss Room" then
                                        isBossRoom = true
                                        break
                                    end
                                end
                                if isBossRoom and Enemies.Text ~= "Enemies: 0/0" then
                                    continue
                                end
                            end

                            if distance < NearestDistance then
                                NearestDistance = distance
                                NearestDoor = v
                            end
                        end
                    end
                    
                    -- Move the player to the nearest door if one was found
                    if NearestDoor then
                        Player.Character.HumanoidRootPart.CFrame = NearestDoor.CFrame * CFrame.new(0, -8, 3)
                        
                        -- Fire proximity prompts after moving to the door
                        for _, v in pairs(game:GetService("Workspace").Dungeons.Labyrinth:GetDescendants()) do
                            if v.ClassName == "ProximityPrompt" then
                                fireproximityprompt(v, 5)
                            end
                        end
                    end
                end
            end
            task.wait(1)  -- Wait for one second before the next iteration
        end
    end)
end)


local MaxFarmDistance = 240 -- Define the maximum distance for farming

Dungeon:CreateToggle("Auto Farm Mobs and Chest Mobs", true, function(Toggled)
    local nearestEntity
    local NearestDistance = math.huge
    if SelectedDungeons then
        if #game:GetService("Workspace").World:GetChildren() == 2 then
            for i, v in pairs(game:GetService("Workspace").Debris.Monsters:GetDescendants()) do
                local distance

                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v.Parent:IsA("Folder") then
                    distance = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                elseif v:IsA("MeshPart") and v.Parent:IsA("Model") then
                    distance = (v.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                end

                if distance and distance < NearestDistance and distance <= MaxFarmDistance then
                    nearestEntity = v
                    NearestDistance = distance
                end
            end

            if nearestEntity then
                if nearestEntity:IsA("Model") then
                    Player.Character.HumanoidRootPart.CFrame = nearestEntity.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                elseif nearestEntity:IsA("MeshPart") then
                    Player.Character.HumanoidRootPart.CFrame = nearestEntity.CFrame * CFrame.new(0, 0, 5)
                end
            end
        end
    end
end)





Dungeon:CreateDivider("AFK-Rank Farm")

Dungeon:CreateDropdown("Selected AFK-Rank", AFk, function(AFk)
	SelectedDAFks = AFk
end)


Dungeon:CreateToggle("Auto AFK-Rank", false, function(x)
    Toggled = x
    spawn(function()
        while Toggled do
            task.wait()
            if Toggled then
                if SelectedDAFks then
                    if game:GetService("Workspace").World:FindFirstChild("Lobby") then
                        Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Dungeons["Start_Labyrinth"][SelectedDAFks][SelectedDAFks].CFrame

                        local Button = Player.PlayerGui.General.AFK[SelectedDAFks].Main["Info_Menu"].Buttons.Public
                        local events = { "MouseButton1Click", "MouseButton1Down", "Activated" }
                        for i, v in ipairs(events) do
                            firesignal(Button[v])
                        end
                    end
                end
            end
            task.wait(15) -- Wait for 15 seconds before the next iteration
        end
    end)
end)


Dungeon:CreateToggle("Auto Farm AFK Mobs", true, function(Toggled)
    local nearestEntity
    local NearestDistance = math.huge
    if SelectedDungeons then
        if #game:GetService("Workspace").World:GetChildren() == 2 then
            for i, v in pairs(game:GetService("Workspace").Debris.Monsters:GetDescendants()) do
                local distance

                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v.Parent:IsA("Folder") then
                    distance = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                elseif v:IsA("MeshPart") and v.Parent:IsA("Model") then
                    distance = (v.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                end

                if distance and distance < NearestDistance and distance <= MaxFarmDistance then
                    nearestEntity = v
                    NearestDistance = distance
                end
            end

            if nearestEntity then
                if nearestEntity:IsA("Model") then
                    Player.Character.HumanoidRootPart.CFrame = nearestEntity.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                elseif nearestEntity:IsA("MeshPart") then
                    Player.Character.HumanoidRootPart.CFrame = nearestEntity.CFrame * CFrame.new(0, 0, 5)
                end
            end
        end
    end
end)




Dungeon:CreateButton("Reset Character(Kys)", function()
	Player.Character.Humanoid.Health = 0
end)





--Potions




--Crafts

local Menus = {"Crafting_General", "Crafting_Potions", "Grimoires", "Stands_Craft", "Solo_Shop", "Jewelry_Craft", "Accessories_Craft", "Avatars_Craft", "Mentors_Craft", "Blacksmith", "Curses_Craft", "Avatars_Leveling"}

Craft:CreateDivider("Crafting Menus")

Craft:CreateDropdown("Selected Menu", Menus, function(Crafts)
	SelectedCrafts = Crafts
end) 



Craft:CreateButton("Open Crafting Menu", function()
	if SelectedCrafts then
		Player.PlayerGui.Crafting[SelectedCrafts].Visible = true
else
		Player.PlayerGui.Crafting[SelectedCrafts].Visible = false
	end
end)


-- Misc

Misc:CreateDivider("Miscellaneous Stuff")


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

TextLabel.Parent = game:GetService("CoreGui").FATALITY
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
		game:GetService("CoreGui").FATALITY.FPStext.Text = "FPS: " .. tostring(fps) .. " Average: " .. string.format("%.0f", (sum / #FPSAverage))
		if (tick() - LastTick) >= 15 then
			FPSAverage = { }
			LastTick = tick()
		end
		LastTick = tick()
	end
end)


Misc:CreateButton("Show/Hide FPS Counter", function()
	game:GetService("CoreGui").FATALITY.FPStext.Visible = not game:GetService("CoreGui").FATALITY.FPStext.Visible
	Ticking = not Ticking
end)


Misc:CreateButton("Redeem Codes", function()
    for _,v in pairs(Codes) do
		local args = {
			[1] = {
				["Action"] = "Redeem_Code",
				["Text"] = tostring(v)
			}
		}
		game:GetService("ReplicatedStorage").Events.To_Server:FireServer(unpack(args))
    end
end)


Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/ups8GeuYAD")
end)




local TeleportService = game:GetService("TeleportService")


Misc:CreateButton("Refresh UI", function()
    game:GetService("CoreGui").FATALITY:Destroy()
	task.wait(1)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/DumbHub.lua"))()
end)


Misc:CreateButton("Uninject", function()
    game:GetService("CoreGui").FATALITY:Destroy()
end)


Misc:CreateButton("Uninject and Rejoin", function()
    game:GetService("CoreGui").FATALITY:Destroy()
    TeleportService:Teleport(game.PlaceId)
end)



