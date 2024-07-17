local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/FATALITY.lua", true))()
local ui = Library:CreateWindow()



local Main = ui:new("Main")
local Farm = ui:new("Auto Farm")
local Dungeon = ui:new("Dungeon")
local TP = ui:new("Teleport")
local Misc = ui:new("Misc/Menus")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"Update12", "22K5LIKES", "25KLIKES", "14KFAV", "14K5FAV", "15KFAV", "15K5FAV", "Update11P2", "13K5FAV", "4KON", "Update11", "GUILDS", "Update22", "29K5FAV", "30KFAV", "30K5FAV", "55KLIKES", "Update21", "28KFAV", "28K5FAV", "29KFAV",
"18M", "Update20", "50KLIKES", "26K5FAV", "27KFAV", "27K5FAV", "26KFAV", "25K5FAV"}

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
local Mobs = {"Head Captain", "Kiri", "Merum", "Former Captain", "Geto"}
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

Main:CreateSlider("Set Roll Amount", {min = 1, max = 6, default = 1}, function(state)
	RollAmount = state
end)


Main:CreateToggle("Auto Roll", true, function()
    if RollAmount then
	    game:GetService("ReplicatedStorage").Events.To_Server:FireServer(unpack({[1] = {["Open_Amount"] = RollAmount or default ,["Action"] = "Gacha_Activate",["Name"] = "Avatars_1"}}))
    end
end)

Main:CreateToggle("Auto Super Roll", true, function()
	if Player.PlayerGui.Main["Quick_Menu"]["Super_Roll"].TextLabel.Text ~= "0 Left" then
		game:GetService("ReplicatedStorage").Events.To_Server:FireServer(unpack({[1] = {["Open_Amount"] = RollAmount,["Super_Roll"] = true,["Action"] = "Gacha_Activate",["Name"] = "Avatars_1"}}))
	end
end)




Main:CreateToggle("Auto Collect Coins", false, function(x)
    Toggled = x
    spawn(function()
        while Toggled do
            -- Short delay between loop iterations
            task.wait(0.1)
            
            -- Ensure the player and HumanoidRootPart are valid
            local player = game.Players.LocalPlayer
            local character = player and player.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart then
                -- Cache the coins
                local coins = game:GetService("Workspace").Debris["Pickup_Debris_1"].Coins:GetChildren()
                
                for _, coin in pairs(coins) do
                    if coin:IsA("Model") and coin:FindFirstChild("Coin") then
                        -- Move to the coin
                        humanoidRootPart.CFrame = coin.Coin.CFrame
                        
                        -- Look for ProximityPrompt within the coin model
                        local proximityPrompt = coin:FindFirstChildOfClass("ProximityPrompt")
                        if proximityPrompt then
                            fireproximityprompt(proximityPrompt, 5)
                            -- Short delay after collecting each coin
                            task.wait(0.5)
                        end
                    end
                end
            end
        end
    end)
end)






Main:CreateToggle("Auto Collect Potion", false, function(x)
    Toggled = x
    spawn(function()
        while Toggled do
            -- Short delay between loop iterations
            task.wait(0.2)
            
            -- Ensure the player and HumanoidRootPart are valid
            local player = game.Players.LocalPlayer
            local character = player and player.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart then
                -- Cache the potions
                local potions = game:GetService("Workspace").Debris["Pickup_Debris_1"].Potions:GetChildren()
                
                for _, potion in pairs(potions) do
                    -- Move to the potion's main part
                    local potionModel = potion:FindFirstChild("Main")
                    if potionModel then
                        humanoidRootPart.CFrame = potionModel.CFrame

                        local proximityPrompt = potion:FindFirstChildOfClass("ProximityPrompt")
                        if proximityPrompt then
                            fireproximityprompt(proximityPrompt, 5)
                            task.wait(0.5)
                        end
                    end
                end
            end
        end
    end)
end)

local FruitName = {"Sand Fruit", "Rubber Fruit", "Bomb Fruit",  "Smoke Fruit", "Flame Fruit"} -- Note: "Rubber Fruit" appears twice in your list, consider removing duplicates if not intended.

Main:CreateToggle("Auto Collect Devil Fruits", false, function(x)
    Toggled = x
    spawn(function()
        while Toggled do
            -- Short delay between loop iterations
            task.wait(0.2)
            
            -- Ensure the player and HumanoidRootPart are valid
            local player = game.Players.LocalPlayer
            local character = player and player.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart then
                -- Cache the Devil Fruits
                local fruits = game:GetService("Workspace").Debris["Pickup_Debris_1"]["Devil_Fruits"]:GetChildren()
                
                for _, devil in pairs(fruits) do
                    -- Check if the Devil Fruit's name is in FruitName list
                    local fruitName = devil.Name
                    if table.find(FruitName, fruitName) then
                        -- Wait a moment before teleporting to the Devil Fruit
                        task.wait(1.5)
                        
                        -- Move to the Devil Fruit part
                        local fruitPart = devil:FindFirstChildWhichIsA("BasePart")
                        if fruitPart then
                            humanoidRootPart.CFrame = fruitPart.CFrame

                            -- Look for ProximityPrompt within the Devil Fruit
                            local proximityPrompt = devil:FindFirstChildOfClass("ProximityPrompt")
                            if proximityPrompt then
                                -- Trigger the proximity prompt
                                fireproximityprompt(proximityPrompt, 5)
                                -- Short delay after interacting with each Devil Fruit
                                task.wait(1.5)
                            end
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

local Mobs = {"Dio", "Armored Titan", "Upper Sun III", "Shiza", "Denzo", "Kakoshi", "Katana Man", "Medara", "Merum", "Dark King", "Geto"}

Farm:CreateDropdown("Selected Mob", Mobs, function(Mob)
    _G.SelectedMob = Mob
end)

Farm:CreateToggle("Auto Farm", false, function(x)
    Toggled = x
    spawn(function()
        while Toggled do
            task.wait()
            if Toggled then
                if _G.SelectedFarm == "TeleportToSelectedMob" then
                    local mobThing = nil
                    if _G.SelectedMob then
                        for _, v in pairs(game:GetService("Workspace").Debris.Monsters:GetDescendants()) do
                            if v:IsA("Model") and v:FindFirstChild("BillboardGui") and v.BillboardGui:FindFirstChild("Frame") and v.BillboardGui.Frame:FindFirstChild("Mob_Name") then
                                if v.BillboardGui.Frame.Mob_Name.Text == _G.SelectedMob then
                                    mobThing = v
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, -5, 2)
                                    break
                                end
                            end
                        end
                    end
                elseif _G.SelectedFarm == "All Mobs" then
                    local nearest
                    local NearestOne = 1000
                    for i, v in pairs(game:GetService("Workspace").Debris.Monsters:GetDescendants()) do
                        if v:IsA("Model") and v.Parent:IsA("Folder") then
                            local distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            if distance < NearestOne then
                                nearest = v
                                NearestOne = distance
                            end
                        end
                    end
                    if nearest then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    else
                        print("No nearest mob found") -- Debug print statement
                    end
                end
            end
        end
    end)
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
    Toggled = x
    spawn(function()
        while Toggled do
            task.wait(1)  -- Wait for one second before each iteration to reduce script load
            if Toggled then
                local Enemies = Player.PlayerGui.General["Labyrinth_UI_Header"].ImageLabel.Frame.Enemies.TextLabel
                if Enemies.Text == "Enemies: 0/0" or Enemies.Text == "Enemies: 0/5" or Enemies.Text == "Enemies: 0/3" or Enemies.Text == "Enemies: 0/1" then
                    local NearestDistance = math.huge 
                    local NearestDoor = nil 
                    local playerPosition = Player.Character.HumanoidRootPart.Position 
                    
                    for _, v in pairs(game:GetService("Workspace").Dungeons.Labyrinth:GetDescendants()) do
                        if v:IsA("MeshPart") and v.Name == "Door" and v.MeshId == "rbxassetid://16992775567" then
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
                            if v:IsA("ProximityPrompt") then
                                fireproximityprompt(v, 5)
                            end
                        end
                    end
                end
            end
        end
    end)
end)


local MaxFarmDistance = 240 -- Define the maximum distance for farming


Dungeon:CreateToggle("Auto Farm Mobs and Chest Mobs", true, function(Toggled)
    if Toggled then
        local nearestEntity
        local NearestDistance = math.huge

        if SelectedDungeons then
            for i, v in pairs(game:GetService("Workspace").Debris.Monsters:GetDescendants()) do
                local distance

                if not table.find(Mobs, v.Name) then
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





--teleport

TP:CreateDivider("Teleport")

TP:CreateButton("Teleport", function()
    Player.PlayerGui.General.Teleport.Visible = true
end)


--Crafts

local Menus = {"Crafting_General", "Crafting_Potions", "Grimoires", "Stands_Craft", "Solo_Shop", "Jewelry_Craft", "Accessories_Craft", "Avatars_Craft", "Mentors_Craft", "Blacksmith", "Curses_Craft", "Avatars_Leveling"}

Misc:CreateDivider("Crafting Menus")

Misc:CreateDropdown("Selected Menu", Menus, function(Crafts)
	SelectedCrafts = Crafts
end) 



Misc:CreateButton("Open Crafting Menu", function()
	if SelectedCrafts then
		Player.PlayerGui.Crafting[SelectedCrafts].Visible = true
else
		Player.PlayerGui.Crafting[SelectedCrafts].Visible = false
	end
end)


-- Misc

Misc:CreateDivider("Miscellaneous Stuff")


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








