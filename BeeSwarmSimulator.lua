

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/FATALITY.lua", true))()
local ui = Library:CreateWindow()



local Info = ui:new("Info")
local Farming = ui:new("Farming") --PuffShrooms --Planters
local Combat = ui:new("Combat")
local Puffshroom = ui:new("Puffshrooms")
local Planter = ui:new("Planters")
local Dispencers = ui:new("Dispencers")
local Buffs = ui:new("Buffs")
local tp = ui:new("Teleport")
local Premium = ui:new("Premium")
local Misc = ui:new("Misc")
local Setting = ui:new("Settings")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"UPDATE1"}
local TweenService = game:GetService("TweenService")
--Variables

local Saved;
local SelectedZones;
local SelectedStars;
local SelectedField;
local SelectedMaskEquip;
local Star = {"Bronze Star Amulet Generator", "Silver Star Amulet Generator", "Gold Star Amulet Generator", "Diamond Star Amulet Generator", "Supreme Star Amulet Generator"}
local Mask = {"Diamond Mask", "Demon Mask", "Gummy Mask", "Honey Mask", "Fire Mask", "Bubble Mask", "Beekeeper's Mask", "Helmet", "Strange Goggles"}

getgenv().ToggleTable = { 
	Toggles = {
		AutoFarm = false,
		AutoDig = false,
		AutoCollect = false,
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




-- Anti Afk

Player.Idled:Connect(function()
	VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
	wait(1)
	VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)



--functions


function getZones()
	local Zones = {}

	for _,v in pairs(game:GetService("Workspace").FlowerZones:GetChildren()) do
		table.insert(Zones, v.Name)
	end
	return Zones
end


function getMisc()
	local Misc = {}

	for _,v in pairs(game:GetService("Workspace").Toys:GetChildren()) do
		table.insert(Misc, v.Name)
	end
	return Misc
end


function getFields()
	local Fields = {}

	for i,v in pairs(game:GetService("Workspace").FlowerZones:GetChildren()) do
		table.insert(Fields, v.Name)
	end
	return Fields
end


function getPlanters()
	local Planters = {}

	for i,v in pairs(game:GetService("ReplicatedStorage").LocalPlanters["Planter Pots"]:GetChildren()) do
		table.insert(Planters, v.Name)
	end
	return Planters
end



local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end







--Info
local Hive;
local Hivee;


function getOwner()
	for i,v in pairs(game:GetService("Workspace").Honeycombs:GetChildren()) do
		if tostring(v.Owner.Value) == Player.Name then
			Hive = v.Name
		end
	end
end

getOwner()


function getSpawn()
	for i,v in pairs(game:GetService("Workspace").Honeycombs:GetChildren()) do
		if tostring(v.Owner.Value) == Player.Name then
			Hivee = v
		end
	end
end

getSpawn()


local function clickButton(button)
    local vim = game:GetService('VirtualInputManager')
    vim:SendMouseButtonEvent(button.AbsolutePosition.X + button.AbsoluteSize.X / 2, button.AbsolutePosition.Y + 50, 0, true, button, 1)
    vim:SendMouseButtonEvent(button.AbsolutePosition.X + button.AbsoluteSize.X / 2, button.AbsolutePosition.Y + 50, 0, false, button, 1)
end


-- Labels

Info:CreateDivider("Hive Stats")


Info:CreateLabel("HoneyMade", "Honey Made: 0?")

Info:CreateLabel("Estimated Honey", "Estimated Honey Gain In A Hour: 0?")

Info:CreateLabel("Estimated Day Honey", "Estimated Honey Gain In A Day: 0?")


Info:CreateDivider("Balloon Info")


Info:CreateLabel("BalloonBlessing", "Your Balloon Blessing is at: Waiting For Balloon")


Info:CreateLabel("Balloon", "Your Balloon Pollen is at: Waiting For Balloon")





Info:CreateDivider("Mob Timers")


Info:CreateLabel("Mondo", "Mondo Chick Timer: 0?")



Info:CreateLabel("Spider", "Spider Crab Timer: 0?")


Info:CreateLabel("WereWolf", "WereWolf Crab Timer: 0?")




local BeforeHoney = Player.CoreStats.Honey.Value
local StartTime = os.time()  

local function formatNumberWithCommas(number)

	local formatted = tostring(number)


	formatted = string.reverse(formatted)
	formatted = string.gsub(formatted, "(%d%d%d)", "%1,")


	formatted = string.gsub(formatted, ",$", "")
	formatted = string.reverse(formatted)

	return formatted
end



local function formatNumberWithAbbreviation(number)
	local suffixes = {"", "K", "M", "B", "T", "Qd"}  
	local formattedNumber = tonumber(number)
	local suffixIndex = 1

	while formattedNumber >= 1000 and suffixIndex < #suffixes do
		formattedNumber = formattedNumber / 1000
		suffixIndex = suffixIndex + 1
	end

	return string.format("%.1f%s", formattedNumber, suffixes[suffixIndex])
end



Info:CreateActiveToggle("Activate List", true, function()
	wait(1)
    local Current = Player.CoreStats.Honey.Value
    local UpdatedHoney = Current - BeforeHoney
    local formattedHoney = formatNumberWithAbbreviation(UpdatedHoney)
    Info:EditLabel("HoneyMade", "Honey Made: " .. formattedHoney)

    wait(0.03)  -- Introduce a short wait to reduce potential lag

    local ElapsedTime = os.time() - StartTime
    if ElapsedTime > 0 then
        local HoneyGainedInHour = (Current - BeforeHoney) / ElapsedTime * 3600
        local formattedHoneyGained = formatNumberWithAbbreviation(HoneyGainedInHour)
        Info:EditLabel("Estimated Honey", "Estimated Honey Gain In An Hour: " .. formattedHoneyGained)

        local HoneyGainedInDay = (Current - BeforeHoney) / ElapsedTime * 86400
        local formattedHoneyGainedDay = formatNumberWithAbbreviation(HoneyGainedInDay)
        Info:EditLabel("Estimated Day Honey", "Estimated Honey Gain In A Day: " .. formattedHoneyGainedDay)
    end

    wait(0.03)  -- Introduce another short wait

    if WS.Balloons.HiveBalloons:FindFirstChild("HiveBalloonInstance") == nil then
        repeat
            wait()  -- Replace task.wait() with wait()
        until WS.Balloons.HiveBalloons:FindFirstChild("HiveBalloonInstance")
    else
        local BalloonPollen = WS.Balloons.HiveBalloons.HiveBalloonInstance.BalloonBody.GuiAttach.Gui.Bar.TextLabel.Text
        Info:EditLabel("Balloon", "Your Balloon Pollen is at: " .. BalloonPollen)

        local BalloonBlessing = WS.Balloons.HiveBalloons.HiveBalloonInstance.BalloonBody.GuiAttach.Gui.BlessingBar.TextLabel.Text
        Info:EditLabel("BalloonBlessing", "Your Balloon Blessing is at: " .. BalloonBlessing)
    end
end)


--Farming
hives = game.Workspace.Honeycombs:GetChildren() for i = #hives, 1, -1 do  v = game.Workspace.Honeycombs:GetChildren()[i] if v.Owner.Value == nil then game.ReplicatedStorage.Events.ClaimHive:FireServer(v.HiveID.Value) end end

local Sprinkler = {[1] = {["Name"] = "Sprinkler Builder"}}
local GetMethods = {"Default Converting", "Micro-Converters"}
local DefaultConvertingMethod = "Default Converting"
local NearestOne = 30

local SproutWait = false
local TP = false
local Sprout = true
local HoneyMaskEquip = false
local SelectedMask = false
local Convert = true
local farmSproutInProgress = false
local autoConvertInProgress = false
local balloonConvertInProgress = false
local AutoFarmInProgress = false
local AutoStickerInProgress = false
local previousField = nil
local tween = nil
local StopMoving = true  
local SelectedBlessing;


local SelectedIgnoreToken = {}
local SelectedPrioritizeToken = {}


local Feilds = {
	"Mushroom Field", 
	"Strawberry Field", 
	"Sunflower Field", 
	"Blue Flower Field", 
	"Spider Field", 
	"Pumpkin Patch", 
	"Mountain Top Field", 
	"Bamboo Field", 
	"Pine Tree Forest", 
	"Rose Field", 
	"Cactus Field", 
	"Stump Field", 
	"Clover Field", 
	"Coconut Field", 
	"Pepper Patch",
	"Pineapple Patch", 
	"Dandelion Field"
}




local Tokens = {
    ["Rolley Jelly"] = "rbxassetid://1471882621",
    ["Gold Egg"] = "rbxassetid://1471849394",
    ["Cloud Vial"] = "rbxassetid://3030569073",
    ["Ticket"] = "rbxassetid://1674871631",
    ["Star Jelly"] ="rbxassetid://2319943273",
    ["GumDrop"] = "rbxassetid://1838129169",
    ["Ant Pass"] = "rbxassetid://2060626811",
    ["Diamond Egg"] = "rbxassetid://1471850677",
    ["Strawberry"] = "rbxassetid://1952740625",
    ["Sunflower Seed"] = "rbxassetid://1952682401",
    ["Enzyems"] = "rbxassetid://2584584968",

    ["Glitter"] = "rbxassetid://2542899798",
    ["Jelly Bean"] = "rbxassetid://3080740120",
    ["Coconut"] = "rbxassetid://3012679515",
    ["Micro-Converter"] = "rbxassetid://2863122826",
    ["Loaded Dice"] = "rbxassetid://8055428094",
    ["Smooth Dice"] = "rbxassetid://8054996680",

    ["HoneySuckels"] = "rbxassetid://8277901755",
    ["Mystic Mire"] = "rbxassetid://3036899811",
    ["HoneyToken"] = "rbxassetid://1472135114",

}





function getTokenNames()
    local TokensTab = {}

    for i,v in pairs(Tokens) do
        table.insert(TokensTab, i)
    end
    return TokensTab
end







Farming:CreateDivider("Farming")
Combat:CreateDivider("Auto Mobs")
Buffs:CreateDivider("Buffs")
Dispencers:CreateDivider("Dispencers")
tp:CreateDivider("Teleport")
Misc:CreateDivider("Miscellaneous")
Setting:CreateDivider("Settings")



Farming:CreateDropdown("Select Field", getFields(),function(Field)
	SelectedField = Field
end)





function TweenBackToField()
	local CFrameEndd = WS.FlowerZones[SelectedField].CFrame * CFrame.new(0,6,0)
	local Timee = 7
	local tweenn = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Timee, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEndd})
	tweenn:Play()
	tweenn.Completed:Wait()
	wait(7)
	if Player.Character.HumanoidRootPart.CFrame == CFrameEndd then
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Sprinkler))
	end
end



function moveAroundTarget(targetPosition)
    local moveRadius = 30 
    while ToggleTable.Toggles.AutoFarm and StopMoving do  
        local newPosition = targetPosition + Vector3.new(math.random(-moveRadius, moveRadius), 0, math.random(-moveRadius, moveRadius))
        local humanoid = Player.Character and Player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:MoveTo(newPosition)
        end
        wait(math.random(2, 4))
    end
end



Farming:CreateToggle("Auto Farm", false, function(isEnabled)
    ToggleTable.Toggles.AutoFarm = isEnabled

    spawn(function()
        while ToggleTable.Toggles.AutoFarm do
            task.wait()

            if isEnabled then
                if SelectedField then
                    local currentField = SelectedField
                    local targetCFrame = WS.FlowerZones[currentField].CFrame * CFrame.new(0, 5, 0)
                    local tweenTime = 7

                    -- Tween to the new selected field if it has changed
                    if currentField ~= previousField then
                        previousField = currentField

                        local humanoidRootPart = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart then
                            local tweenInfo = TweenInfo.new(tweenTime, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0)
                            local tween = game:GetService("TweenService"):Create(humanoidRootPart, tweenInfo, {CFrame = targetCFrame})
                            tween:Play()

                            -- Wait for tween completion
                            tween.Completed:Wait()
                            
                            -- Fire server event and perform other actions
                            game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Sprinkler))
                            wait(0.5)
                            moveAroundTarget(targetCFrame.Position)
                        end
                    end
                else
                    previousField = nil
                    -- Handle stopping actions when SelectedField is nil
                    -- Cancel tween if exists
                    if tween then
                        tween:Cancel()
                    end
                end
            else
                -- Handle stopping actions when AutoFarm is toggled off
                previousField = nil
                -- Cancel tween if exists
                if tween then
                    tween:Cancel()
                end
            end
        end
    end)
end)






Farming:CreateToggle("Auto Dig", false, function(Toggled)
	ToggleTable.Toggles.AutoDig = Toggled
	spawn(function()
		while ToggleTable.Toggles.AutoDig do
			task.wait()
			if Toggled then
				game:GetService("ReplicatedStorage").Events.ToolCollect:FireServer()
			end
		end
	end)
end)



Misc:CreateMultiDropdown("Prioritized Tokens", getTokenNames(), function(PriToken)
    SelectedPrioritizeToken = PriToken 
end)


Misc:CreateMultiDropdown("Ignored Tokens", getTokenNames(), function(selectedTokens)
    SelectedIgnoreToken = selectedTokens  
end)



Farming:CreateToggle("Auto Collect", true, function(enabled)
    if enabled then
        local Player = game.Players.LocalPlayer
        local Workspace = game:GetService("Workspace")
        local maxDistance = 30  -- Maximum distance to consider
        
        local nearestDistance = maxDistance  -- Initialize with the maximum distance
        local nearestToken = nil
        
        -- Loop through all collectibles in the workspace
        for _, v in pairs(Workspace.Collectibles:GetChildren()) do
            if v.Orientation.Z == 0 then
                local distanceToPlayer = (v.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                local prioritizeFound = false
                local ignoreFound = false
                
                -- Check if the token should be ignored
                if next(SelectedIgnoreToken) ~= nil then
                    for _, Ignore in pairs(SelectedIgnoreToken) do
                        if v.FrontDecal.Texture == Tokens[Ignore] then
                            ignoreFound = true
                            break  -- No need to check further if ignored
                        end
                    end
                end
                
                -- Check if the token should be prioritized
                if next(SelectedPrioritizeToken) ~= nil then
                    for _, PrioritizeToken in pairs(SelectedPrioritizeToken) do
                        if v.FrontDecal.Texture == Tokens[PrioritizeToken] then
                            prioritizeFound = true
                            break  -- No need to check further if prioritized
                        end
                    end
                else
                    prioritizeFound = true  -- If no tokens are prioritized, consider all tokens prioritized
                end
                
                -- Decide whether to collect the token based on prioritization and ignoring
                if prioritizeFound or not ignoreFound then
                    -- Check if this token is closer than the previously nearest token
                    if distanceToPlayer < nearestDistance then
                        nearestDistance = distanceToPlayer
                        nearestToken = v
                    end
                end
            end
        end
      
        -- Move to the nearest token if found and not ignored
        if nearestToken then
            Player.Character.Humanoid:MoveTo(nearestToken.Position)

        end
        
        -- Reset variables for the next iteration
        nearestDistance = maxDistance  -- Reset to the maximum distance
        nearestToken = nil
    end
end)







DefaultConvertingMethod = "Default Converting"
_G.SelectedConvertingMethod = DefaultConvertingMethod

-- Create the dropdown and set the selected method
Misc:CreateDropdown("Select Converting Method", GetMethods, function(selectedValue)
    _G.SelectedConvertingMethod = selectedValue or DefaultConvertingMethod
end, DefaultConvertingMethod)


local positionTolerance = 1.0 

Farming:CreateToggle("Auto Convert", false, function(Toggled)
    ToggleTable.Toggles.AutoConvert = Toggled

    spawn(function()
        while ToggleTable.Toggles.AutoConvert do
            task.wait()

            -- Wait until balloon conversion is not in progress
            while balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                task.wait()
            end

            if Toggled and not balloonConvertInProgress and not AutoStickerInProgress and not farmSproutInProgress then
                if _G.SelectedConvertingMethod == "Default Converting" then
                    -- Check pollen and convert logic
                    if Player.CoreStats.Pollen.Value >= Player.CoreStats.Capacity.Value and Convert then
                        for _, hive in ipairs(game:GetService("Workspace").Honeycombs:GetChildren()) do
                            task.wait()
                            if hive:FindFirstChild("Owner") and hive:FindFirstChild("SpawnPos") then
                                if tostring(hive.Owner.Value) == game.Players.LocalPlayer.Name then
                                    StopMoving = false
                                    wait(0.1)
                                    autoConvertInProgress = true
                                    HoneyMaskEquip = true
                                    SelectedMask = false

                                    -- Tween to hive position
                                    local CFrameEnd = CFrame.new(hive.SpawnPos.Value.Position) * CFrame.fromEulerAnglesXYZ(0, math.rad(180), 0)
                                    local Time = 7
                                    local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
                                    tween:Play()
                                    tween.Completed:Wait()

                                    Convert = false
                                    wait(1)
                                    game:GetService("ReplicatedStorage").Events.PlayerHiveCommand:FireServer("ToggleHoneyMaking")

                                    -- Exit loop early if autoConvertInProgress is false
                                    if not ToggleTable.Toggles.AutoConvert then
                                        break
                                    end
                                end
                            end
                        end
                    end

                    -- Post-conversion actions
                    if Player.CoreStats.Pollen.Value == 0 and not balloonConvertInProgress and not AutoStickerInProgress and not farmSproutInProgress then
                        wait(4)
                        HoneyMaskEquip = false
                        SelectedMask = true
                        Convert = true

                        -- Tween back to selected field
                        local CFrameEndd = WS.FlowerZones[SelectedField].CFrame * CFrame.new(0, 5, 0)
                        local Timee = 7
                        local tweenn = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Timee, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEndd})
                        tweenn:Play()
                        tweenn.Completed:Wait()

                        if not ToggleTable.Toggles.AutoConvert then
                            break
                        end

                        -- Wait for tween completion before further actions
                        if (Player.Character.HumanoidRootPart.Position - CFrameEndd.Position).magnitude <= positionTolerance then
                            game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Sprinkler))
                            wait(2)
                            StopMoving = true
                            autoConvertInProgress = false
                        end
                    end

                elseif _G.SelectedConvertingMethod == "Micro-Converters" then
                    if Player.CoreStats.Pollen.Value >= Player.CoreStats.Capacity.Value and Convert then
                        game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack({[1] = {["Name"] = "Micro-Converter"}}))
                        wait(5)
                    end

                end
            else
                StopMoving = true
                autoConvertInProgress = false
                Convert = true
                HoneyMaskEquip = false
                SelectedMask = true
            end
        end
    end)
end)

local BlessingTable = {
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
    "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
    "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
    "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",
    "51", "52", "53", "54", "55", "56", "57", "58", "59", "60",
    "61", "62", "63", "64", "65", "66", "67", "68", "69", "70",
    "71", "72", "73", "74", "75", "76", "77", "78", "79", "80",
    "81", "82", "83", "84", "85", "86", "87", "88", "89", "90",
    "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"
}

-- Trim whitespace from each element
for i = 1, #BlessingTable do
    BlessingTable[i] = BlessingTable[i]:gsub("^%s*(.-)%s*$", "%1")
end


local currentBlessingThreshold = BlessingTable[1]


-- Function to handle dropdown change
local function OnBlessingThresholdChanged(state)
    currentBlessingThreshold = state
end

-- Create dropdown for Blessing Threshold
Farming:CreateDropdown("Balloon Blessing (>=)", BlessingTable, OnBlessingThresholdChanged)

Farming:CreateToggle("Convert Balloon At Blessing", false, function(Toggled)
    ToggleTable.Toggles.ConvertBalloon = Toggled

    spawn(function()
        while ToggleTable.Toggles.ConvertBalloon do
            task.wait()

            -- Wait until Auto Convert is not in progress
            while autoConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                task.wait()
            end

            -- Start Convert Balloon At Blessing logic
            if Toggled and not autoConvertInProgress and not AutoStickerInProgress and not farmSproutInProgress then
                local blessingLabelText = WS.Balloons.HiveBalloons.HiveBalloonInstance.BalloonBody.GuiAttach.Gui.BlessingBar.TextLabel.Text
                if tonumber(blessingLabelText:match("%d+")) >= tonumber(currentBlessingThreshold) then
                    HoneyMaskEquip = true
                    SelectedMask = false

                    for _, hive in ipairs(game:GetService("Workspace").Honeycombs:GetChildren()) do
                        task.wait()
                        if hive:FindFirstChild("Owner") and hive:FindFirstChild("SpawnPos") then
                            if tostring(hive.Owner.Value) == game.Players.LocalPlayer.Name then
                                StopMoving = false 
                                wait(0.1)
                                balloonConvertInProgress = true
                                local CFrameEnd = CFrame.new(hive.SpawnPos.Value.Position) * CFrame.fromEulerAnglesXYZ(0, math.rad(180), 0)
                                local Time = 7
                                local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
                                tween:Play()
                                tween.Completed:Wait()

                                -- Check for HiveBalloonInstance and blessing threshold again
                                if WS.Balloons.HiveBalloons:FindFirstChild("HiveBalloonInstance") and tonumber(blessingLabelText:match("%d+")) >= tonumber(currentBlessingThreshold) then
                                    game:GetService("ReplicatedStorage").Events.PlayerHiveCommand:FireServer("ToggleHoneyMaking")

                                    -- Wait until HiveBalloonInstance is gone
                                    while WS.Balloons.HiveBalloons:FindFirstChild("HiveBalloonInstance") do
                                        task.wait()
                                    end

                                    -- After waiting, perform post-conversion actions
                                    wait(5)
                                    HoneyMaskEquip = false
                                    SelectedMask = true


                                    if not autoConvertInProgress and not AutoStickerInProgress and not farmSproutInProgress then
                                    local CFrameEndd = WS.FlowerZones[SelectedField].CFrame * CFrame.new(0, 5, 0)
                                    local tweenn = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEndd})
                                    tweenn:Play()
                                    tweenn.Completed:Wait()

                                    -- Check if Player's position is close to the target CFrame position with increased tolerance
                                    if (Player.Character.HumanoidRootPart.Position - CFrameEndd.Position).magnitude <= positionTolerance then
                                        game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Sprinkler))
                                        wait(2)
                                        StopMoving = true 
                                        balloonConvertInProgress = false
										end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end)







Farming:CreateToggle("Auto Sticker Stack", false, function(Toggled)
    ToggleTable.Toggles.AutoSticker = Toggled
    spawn(function()
    while ToggleTable.Toggles.AutoSticker do
        wait(1.3)  -- Adjust the delay as needed
            if Toggled then

                while autoConvertInProgress or ballonConvertInProgress or farmSproutInProgress do
                    task.wait()  
                end

        
        
        -- Check if the Sticker Stack clock is not visible
        local stickerStack = game:GetService("Workspace").Toys["Sticker Stack"]
        if stickerStack and stickerStack.StackModel.Clock.SurfaceGui.ClockTextLabel.Visible == false then
			AutoStickerInProgress = true
            local CFrameEndd = CFrame.new(-414.686432, 111.787292, -150.381332)
            local Time = 7

            -- Tween to move to the target CFrame
            game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEndd}):Play()
            wait(Time)

            -- Perform virtual input actions
            clickButton(Player.PlayerGui.ScreenGui.ActivateButton)

            -- Click on the first child of gridSlotStage if available
            local gridSlotStage = Player.PlayerGui.ScreenGui.MiscPopUpFrame.StickerStackGui.InventoryFrame.InventoryScrollingFrame.GuiGrid.GridSlotStage
            local children = gridSlotStage:GetChildren()
            if #children > 0 then
                clickButton(children[1].ObjImage.GuiTileSimple.ObjButton)

                -- Click YesButton in QuestionBox
                clickButton(Player.PlayerGui.ScreenGui.QuestionBox.Box.YesButton)
                wait(1)

                -- Click YesButton again (assuming this is intended)
                clickButton(Player.PlayerGui.ScreenGui.QuestionBox.Box.YesButton)
                wait(1)
            end

            -- Check and handle StickerTP state
            if stickerStack.StackModel.Clock.SurfaceGui.ClockTextLabel.Visible == true and not StickerTP then
                StickerTP = true
                TweenBackToField()
				AutoStickerInProgress = false  -- Assuming TweenBackToField is defined elsewhere
                StickerTP = false
            end
        end
	else
		AutoStickerInProgress = false
		StickerTP = false
        end
    end  
end)
end)

Farming:CreateToggle("Farm Under Balloons", false, function(x)
	Toggled = x
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
				if FarmBalloon == true then
					for i,v in pairs(game:GetService("Workspace").Balloons.FieldBalloons:GetChildren()) do
						if v:FindFirstChild("BalloonRoot") and v:FindFirstChild("PlayerName") then
							if v:FindFirstChild("PlayerName").Value == game.Players.LocalPlayer.Name then
								if tonumber((v.BalloonRoot.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < 60/1.4 then
									Player.Character.Humanoid:MoveTo(v.BalloonRoot.Position)
								end
							end
						end
					end
				end
			end
		end
	end)
end)


Farming:CreateToggle("Farm Bubble Bloat", false, function(Toggled)
	ToggleTable.Toggles.FarmBubbleBloat = Toggled
	spawn(function()
		while ToggleTable.Toggles.FarmBubbleBloat do
			task.wait()
			if Toggled then
				for i,v in pairs(game:GetService("Workspace").Particles:GetChildren()) do
					if #game:GetService("Workspace").Particles.PopStars:GetChildren() == 1 then
						if string.find(v.Name, "Bubble") and tonumber((v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < 60/1.4 then
							Player.Character.Humanoid:MoveTo(v.Position)
						end
					end
				end
			end
		end
	end)
end)


Farming:CreateToggle("Farm Fuzzy Bombs", false, function(Toggled)
	ToggleTable.Toggles.FarmFuzzyBombs = Toggled
	spawn(function()
		while ToggleTable.Toggles.FarmFuzzyBombs do
			task.wait()
			if Toggled then
				for i,v in pairs(game:GetService("Workspace").Particles:GetChildren()) do
					if v.Name == "DustBunnyInstance" then
						Player.Character.Humanoid:MoveTo(v.Root.Position)
					end
				end
			end
		end
	end)
end)


Farming:CreateToggle("Auto Use Sprout", true, function()
	if SproutWait == false then
		SproutWait = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Magic Bean"})
		wait(5)
		SproutWait = false
	end
end)


Farming:CreateToggle("Auto Farm Sprout", false, function(x)
	Toggled = x
	spawn(function()
		while Toggled do
			task.wait()

			wait(0.8)

			while AutoStickerInProgress or autoConvertInProgress or ballonConvertInProgress do
				task.wait()
			end


			if Toggled then
				if #game:GetService("Workspace").Sprouts:GetChildren() >= 1 and TP == false then
					TP = true
					wait(0.5)
					for i,v in pairs(game:GetService("Workspace").Sprouts:GetChildren()) do
						if v.Name == "Sprout" and Sprout == true then
							farmSproutInProgress = true
							local CFrameEnd = v.CFrame 
							local Time = 7
							local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
							tween:Play()
							tween.Completed:Wait()
							if Player.Character.HumanoidRootPart.CFrame == CFrameEnd then
								game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Sprinkler))
							end
							wait(7)
							Sprout = false
							wait(23)

						elseif #game:GetService("Workspace").Sprouts:GetChildren() == 0 and TP == true then

							Sprout = true
							TweenBackToField()
							TP = false
							farmSproutInProgress = true

						end
					end
				end		
			end
		end
	end)
end)




Farming:CreateToggle("Farm Under Clouds", true, function()
	for i,v in pairs(game:GetService("Workspace").Clouds:GetChildren()) do
		e = v:FindFirstChild("Plane")
		if e and tonumber((e.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < 60/1.4 then
			Player.Character.Humanoid:MoveTo(v.Position)
		end
	end
end)



Farming:CreateToggle("Farm Star Shower", true, function()
	for i,v in pairs(game:GetService("Workspace").Particles:GetDesendants()) do
		if v.Name == "Star" then
			Player.Character.HumanoidRootPart.CFrame = v.CFrame
		end
	end

end)


Farming:CreateToggle("Farm Flames", true, function()
	for i,v in pairs(game:GetService("Workspace").PlayerFlames:GetChildren())  do
		Player.Character.Humanoid:MoveTo(v.Position)
	end
end)



--Combat


local Tppp = true
local Spider = true
local Mondo = true 
local WereWolf = true
local KingBeetle = true
local TunnelBear = true
local TPP = true





local Toggled = false
local TPP = true  -- Assuming TPP is meant to be true initially

Combat:CreateToggle("Auto Mob", false, function(enabled)
	Toggled = enabled

	if enabled then
		spawn(function()
			while Toggled do
				for i, v in pairs(game:GetService("Workspace").MonsterSpawners:GetChildren()) do
					if v:FindFirstChild("Territory") and TPP then
						local monsterpart = nil

						-- Determine the monsterpart based on spawner name
						if v.Name == "WerewolfSpawner" then
							monsterpart = game:GetService("Workspace").Territories.WerewolfPlateau.w
						elseif v.Name == "MushroomSpawner" then
							monsterpart = game:GetService("Workspace").Territories.MushroomZone.Part
						else
							monsterpart = v.Territory.Value
						end

						if monsterpart then
							game.Players.LocalPlayer.Character.Humanoid.Jump = true
							local CFrameEnd = monsterpart.CFrame
							local Time = 7
							local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
							tween:Play()
							tween.Completed:Wait()
							wait(10)

							while v:FindFirstChild("TimerLabel", true).Visible do
								local CFrameEnd = monsterpart.CFrame
								local Time = 7
								local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
								tween:Play()
								tween.Completed:Wait()
								task.wait(1)
							end

							TweenBackToField()  -- Assuming you have a function to return to the field
							game.Players.LocalPlayer.Character.Humanoid.Jump = false
							TPP = false  -- Assuming TPP should be set to false after returning
						end
					end
				end
				task.wait()
			end
		end)
	end
end)


Combat:CreateToggle("Auto Mondo Chick", false, function(x)
	Toggled = x
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
                while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                    task.wait()
                end
				for i,v in pairs(game:GetService("Workspace").Monsters:GetDescendants()) do
					if v.MonsterType.Value == "Mondo Chick" and Mondo == true then
						Player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(30,10,0)
					end
				end
			elseif  v.MonsterType.Value ~= "Mondo Chick" then
				TweenBackToField()

			end
		end
	end)
end)


Combat:CreateToggle("Auto Vicious Bee", false, function(enabled)
	Toggled = enabled

	if enabled then
		spawn(function()
			while Toggled do
				task.wait()

				local foundViciousBee = false
				for i, v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") and (v.MonsterType.Value == "Vicious Bee" or v.MonsterType.Value == "Gifted Vicious Bee") then
						foundViciousBee = true
						local CFrameEnd = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)  -- Adjust the offset as needed
						local Time = 7
						local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
						tween:Play()
						tween.Completed:Wait()
					end
				end

				if not foundViciousBee then
					TweenBackToField()  -- Assuming you have a function to return to the field position
				end
			end
		end)
	else
		TweenBackToField()  -- Ensure to return to field position when toggled off
	end
end)


Combat:CreateToggle("Auto Spider", false, function(x)
	Toggled = x
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
                while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                    task.wait()
                end
				Tppp = true
				if game:GetService("Workspace").MonsterSpawners["Spider Cave"].Attachment.TimerGui.TimerLabel.Text == "1:00" and Spider == true then
					local CFrameEnd = game:GetService("Workspace").MonsterSpawners["Spider Cave"].CFrame
					local Time = 7
					local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
					tween:Play()
					tween.Completed:Wait()
					wait(7)
					game.Players.LocalPlayer.Character.Humanoid.Jump = true
					Spider = false


				end
			elseif  WS.MonsterSpawners["Spider Cave"].Attachment.TimerGui.TimerLabel.Text ~= "Spider: 25:25" then
				Spider = true
				TweenBackToField()
				game.Players.LocalPlayer.Character.Humanoid.Jump = false
				Tppp = false

			end
		end
	end)
end)


Combat:CreateToggle("Auto WereWorlf", false, function(x)
    while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
        task.wait()
    end
end)


Combat:CreateToggle("Auto Tunnle Bear", false, function(x)
	Toggled = x
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
                while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                    task.wait()
                end
				Tppp = true
				if game:GetService("Workspace").MonsterSpawners.TunnelBear.TimerAttachment.TimerGui.TimerLabel.Text == "Tunnel Bear: 2:20:19" then
					local CFrameEnd = game:GetService("Workspace").MonsterSpawners["Spider Cave"].CFrame
					local Time = 7
					local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
					tween:Play()
					tween.Completed:Wait()
					wait(7)

				end
			elseif  WS.MonsterSpawners["King Beetle Cave"].Attachment.TimerGui.TimerLabel.Text == "King Beetle: 20:23:54" then
				TweenBackToField()
				Tppp = false

			end
		end
	end)
end)


Combat:CreateToggle("Auto King Beetle", false, function(x)
	Toggled = x
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
                
                    while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                        task.wait()
                    end
				Tppp = true
				if game:GetService("Workspace").MonsterSpawners["King Beetle Cave"].Attachment.TimerGui.TimerLabel.Text == "1:00" and KingBeetle == true then
					local CFrameEnd = game:GetService("Workspace").MonsterSpawners["King Beetle Cave"].CFrame
					local Time = 7
					local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
					tween:Play()
					tween.Completed:Wait()
					wait(7)
					KingBeetle = false
				end
			elseif  WS.MonsterSpawners["King Beetle Cave"].Attachment.TimerGui.TimerLabel.Text == "King Beetle: 20:23:54" then
				KingBeetle = true
				TweenBackToField()
				Tppp = false

			end
		end
	end)
end)





Combat:CreateActiveToggle("Avoid Mobs (In All Situations)", true, function(Toggled)

            local mobsNearby = false

            for _, v in ipairs(game:GetService("Workspace").Monsters:GetChildren()) do
                if v:FindFirstChild("Head") then
                    local distance = (v.Head.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                    if distance < 30 then
                        mobsNearby = true
                    end
                end
            end

            if mobsNearby then
                if StopMoving == true then
                    StopMoving = false
                    game.Players.LocalPlayer.Character.Humanoid.Jump = true
                end

                if StopMoving == false then
                    StopMoving = true
                end
            end

            wait(0.5) -- Adjust the wait time as needed
   
end)



Combat:CreateButton("Check For Windy Bee", function()
	local windyBeeFound = false

	for i, v in pairs(WS.Monsters:GetChildren()) do
		if string.find(v.Name, "Windy") then
			windyBeeFound = true
			break  -- No need to continue searching if we found Windy Bee
		end
	end

	if windyBeeFound then
		game.StarterGui:SetCore("SendNotification", {
			Title = "Windy Bee Check";
			Text = "Windy Bee Found"; 
			Icon = "";
			Duration = 3;
		})
	else
		game.StarterGui:SetCore("SendNotification", {
			Title = "Windy Bee Check";
			Text = "Windy Bee Not Found"; 
			Icon = "";
			Duration = 3;
		})
	end
end)



local alertEnabled = false

Combat:CreateToggle("Alert Windy Bee Spawn", false, function(enabled)
	alertEnabled = enabled

	if enabled then
		local windyBeeFound = false

		for i, v in pairs(game:GetService("Workspace").Monsters:GetDescendants()) do
			if v:IsA("Model") and v.Name == "Windy" then
				windyBeeFound = true
			end
		end

		if windyBeeFound then
			game.StarterGui:SetCore("SendNotification", {
				Title = "Windy Bee Check";
				Text = "Windy Bee Found"; 
				Icon = "";
				Duration = 3;
			})

			alertEnabled = false  -- Disable further checking once found
			Combat:SetToggle("Alert Windy Bee Spawn", false)  -- Update the UI toggle state
		else
			game.StarterGui:SetCore("SendNotification", {
				Title = "Windy Bee Check";
				Text = "Windy Bee Not Found"; 
				Icon = "";
				Duration = 3;
			})
		end
	end
end)





--Puffshroom


--[[

game:GetService("Workspace").Happenings.Puffshrooms.PuffballMushroomModelCommon["Puffball Stem"]



game:GetService("Workspace").Happenings.Puffshrooms.PuffballMushroomModelCommon["Puffball Top"].Attachment.Gui.NameRow.TextLabel


--]]






--Planters

local Reposition = false
local PlanterTween = false
local SelectedPlanter1Field;
local SelectedPlanter2Field;
local SelectedPlanter3Field;
local PlanterPrecent;
local SelectedPlanter1;
local SelectedPlanter2;
local SelectedPlanter3;
local CollectPlanter2 = true
local CollectPlanter3 = true
local Planter1 = true
local CollectPlanter1 = true





Planter:CreateDivider("1st Planter Farming")



Planter:CreateDropdown("1st Planter", getPlanters(), function(Planter1)
	SelectedPlanter1 = Planter1
end)

Planter:CreateDropdown("Select Planter 1 Field", getFields(),function(Planter1Field)
	SelectedPlanter1Field = Planter1Field
end)




local CollectingPlanter = false  

local function PlacePlanter1()
	if game:GetService("Workspace").Planters:FindFirstChild(SelectedPlanter1) == nil and not CollectingPlanter then
		local CFrameEnd = WS.FlowerZones[SelectedPlanter1Field].CFrame
		local Time = 7
		local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
		tween:Play()
		tween.Completed:Wait()
		wait(7)
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack({[1] = {["Name"] = SelectedPlanter1}}))
		wait(2)
		TweenBackToField()
	end
end


local function CollectPlanter1()
	for i,v in pairs(game:GetService("Workspace").Planters:GetChildren()) do
		if v:IsA("MeshPart") and v.Parent:IsA("Folder") and CollectPlanter1 then 
			local desiredText = string.match(v["Gui Attach"]["Planter Gui"].Bar.TextLabel.Text, "^(.-)%s*%(")
			if desiredText == SelectedPlanter1 then
				if v.GrowthPercent.Value == 1 then
					CollectingPlanter = true  -- Set to true when starting collection
					local CFrameEnd = game:GetService("Workspace").Planters[SelectedPlanter1].Soil.CFrame 
					local Time = 7
					local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
					tween:Play()
					tween.Completed:Wait()

					wait(7)

					-- Perform harvesting actions
					if Player.PlayerGui.ScreenGui.ActivateButton.TextBox.Text == "Harvest the "..SelectedPlanter1 then
						local vim = game:GetService("VirtualInputManager")
						local x = Player.PlayerGui.ScreenGui.ActivateButton
						vim:SendMouseButtonEvent(x.AbsolutePosition.X + x.AbsoluteSize.X / 2, x.AbsolutePosition.Y + 50, 0, true, x, 1)
						vim:SendMouseButtonEvent(x.AbsolutePosition.X + x.AbsoluteSize.X / 2, x.AbsolutePosition.Y + 50, 0, false, x, 1)

						-- Wait for 15 seconds after harvesting
						wait(15)

						-- Reset state and continue
						CollectingPlanter = false
						TweenBackToField()  -- Call TweenBackToField() after the wait
					end
				end
			end                
		end
	end
end


Planter:CreateToggle("Place Planter 1", false, function(x)
	local Toggled = x  -- Ensure Toggled is local to this function
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
                while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                    task.wait()
                end
				PlacePlanter1()
			end
		end
	end)
end)


Planter:CreateToggle("Collect Planter 1", false, function(x)
	local Toggled = x  -- Ensure Toggled is local to this function
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
                while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                    task.wait()
                end
				CollectPlanter1()
			end
		end
	end)
end)




Planter:CreateDivider("2nd Planter Farming")


Planter:CreateDropdown("2nd Planter", getPlanters(), function(Planter2)
	SelectedPlanter2 = Planter2
end)

Planter:CreateDropdown("Select Planter 2 Field", getFields(),function(Planter2Field)
	SelectedPlanter2Field = Planter2Field
end)



local function PlacePlanter2()
	if game:GetService("Workspace").Planters:FindFirstChild(SelectedPlanter2) == nil then
		local CFrameEnd = WS.FlowerZones[SelectedPlanter2Field].CFrame
		local Time = 7
		local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
		tween:Play()
		tween.Completed:Wait()
		wait(7)
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack({[1] = {["Name"] = SelectedPlanter2}}))
		wait(2)
		TweenBackToField()
	end			
end


local function CollectPlanter2()
	for i,v in pairs(game:GetService("Workspace").Planters:GetChildren()) do
		if v:IsA("MeshPart") and v.Parent:IsA("Folder") and  CollectPlanter2 then 
			local desiredText = string.match(v["Gui Attach"]["Planter Gui"].Bar.TextLabel.Text, "^(.-)%s*%(")
			if desiredText == SelectedPlanter2 then
				if v.GrowthPercent.Value == 1 then
					local CFrameEnd = game:GetService("Workspace").Planters[SelectedPlanter2].Soil.CFrame 
					local Time = 7
					local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
					tween:Play()
					tween.Completed:Wait()
					wait(7)
					CollectPlanter2 = false
					wait(1)
					if Player.PlayerGui.ScreenGui.ActivateButton.TextBox.Text == "Harvest the "..SelectedPlanter2 then
						wait(2)
						local vim = game:GetService'VirtualInputManager'
						local x = Player.PlayerGui.ScreenGui.ActivateButton
						vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
						vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)

						wait(15)
						CollectPlanter2 = true
						TweenBackToField()
					end
				end
			end				
		end
	end
end


Planter:CreateToggle("Place Planter 2", false, function (x)
	local Toggled = x  -- Ensure Toggled is local to this function
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
                while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                    task.wait()
                end
				PlacePlanter2()
			end
		end
	end)
end)

Planter:CreateToggle("Collect Planter 2", false, function (x)
	local Toggled = x  -- Ensure Toggled is local to this function
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
                while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                    task.wait()
                end
				CollectPlanter2()
			end
		end
	end)
end)


Planter:CreateDivider("3rd Planter Farming")


Planter:CreateDropdown("3rd Planter", getPlanters(), function(Planter3)
	SelectedPlanter3 = Planter3
end)


Planter:CreateDropdown("Select Planter 3 Field", getFields(),function(Planter3Field)
	SelectedPlanter3Field = Planter3Field
end)


local function PlacePlanter3()
	if game:GetService("Workspace").Planters:FindFirstChild(SelectedPlanter3) == nil then
		local CFrameEnd = WS.FlowerZones[SelectedPlanter3Field].CFrame
		local Time = 7
		local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
		tween:Play()
		tween.Completed:Wait()
		wait(7)
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack({[1] = {["Name"] = SelectedPlanter3}}))
		wait(2)
		TweenBackToField()
	end
end


local function CollectPlanter3()
	for i,v in pairs(game:GetService("Workspace").Planters:GetChildren()) do
		if v:IsA("MeshPart") and v.Parent:IsA("Folder") and  CollectPlanter3 == true then 
			local desiredText = string.match(v["Gui Attach"]["Planter Gui"].Bar.TextLabel.Text, "^(.-)%s*%(")
			if desiredText == SelectedPlanter3 then
				if v.GrowthPercent.Value == 1 then
					local CFrameEnd = game:GetService("Workspace").Planters[SelectedPlanter3].Soil.CFrame 
					local Time = 7
					local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})
					tween:Play()
					tween.Completed:Wait()
					wait(7)
					CollectPlanter3 = false
					wait(1)
					if Player.PlayerGui.ScreenGui.ActivateButton.TextBox.Text == "Harvest the "..SelectedPlanter3 then
						wait(2)
						local vim = game:GetService'VirtualInputManager'
						local x = Player.PlayerGui.ScreenGui.ActivateButton
						vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
						vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)

						wait(15)
						CollectPlanter3 = true
						TweenBackToField()
					end
				end
			end				
		end
	end
end


Planter:CreateToggle("Place Planter 3", false, function (x)
	local Toggled = x  -- Ensure Toggled is local to this function
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
                while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                    task.wait()
                end
				PlacePlanter3()
			end
		end
	end)
end)


Planter:CreateToggle("Collect Planter 3", false, function (x)
	local Toggled = x  -- Ensure Toggled is local to this function
	spawn(function()
		while Toggled do
			task.wait()
			if Toggled then
                while autoConvertInProgress or balloonConvertInProgress or AutoStickerInProgress or farmSproutInProgress do
                    task.wait()
                end
				CollectPlanter3()
			end
		end
	end)
end)





--Buffs


local Gum = {[1] = {["Name"] = "Gumdrops"}}
local Red = {[1] = {["Name"] = "Red Extract" }}
local Blue = {[1] = {["Name"] = "Blue Extract" }}
local Glue = {[1] = {["Name"] = "Glue"}}
local Oil = {[1] = {["Name"] = "Oil"}}
local Glitter = {[1] = {["Name"] = "Glitter"}}
local Enzymes = {[1] = {["Name"] = "Enzymes"}}
local JellyBeans = {[1] = {["Name"] = "Jelly Beans"}}
local TropicalDrink = {[1] = {["Name"] = "Tropical Drink"}}
local CloudVial = {[1] = {["Name"] = "Cloud Vial"}}
local SuperSmoothie = {[1] = {["Name"] = "Super Smoothie"}}


local Gumm = false
local Redd = false
local Bluee = false
local Gluee = false
local Oill = false
local Glitterr = false
local Enzymess = false
local JellyBeanss = false
local TropicalDrinkk = false
local CloudViall = false
local SuperSmoothiee = false



Buffs:CreateButton("All Buffs", function()
	game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Red))
	game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Blue))
	game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Glue))
	game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Glitter))
	game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Oil))
	game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Enzymes))
	game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(TropicalDrink))

end)


Buffs:CreateToggle("Auto GumDrops", true, function()

	if Gumm == false then
		Gumm = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Gum))
		wait(2)
		Gumm = false
	end
end)


Buffs:CreateToggle("Auto Red Extract", true, function()
	if Redd == false then
		Redd = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Red))
		wait(600)
		Redd = false
	end
end)


Buffs:CreateToggle("Auto Blue Extract", true, function()
	if Bluee == false then
		Bluee = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Blue))
		wait(600)
		Bluee = false
	end
end)


Buffs:CreateToggle("Auto Glue", true, function()
	if Gluee == false then
		Gluee = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Glue))
		wait(600)
		Gluee = false
	end
end)


Buffs:CreateToggle("Auto Oil", true, function()
	if Oill == false then
		Oill = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Oil))
		wait(600)
		Oill = false
	end
end)


Buffs:CreateToggle("Auto Glitter", true, function()
	if Glitterr == false then
		Glitterr = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Glitter))
		wait(900)
		Glitterr = false
	end
end)


Buffs:CreateToggle("Auto Enzymes", true, function()
	if Enzymess == false then
		Enzymess = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(Enzymes))
		wait(600)
		Enzymess = false
	end
end)


Buffs:CreateToggle("Auto JellyBeans", true, function()
	if JellyBeanss == false then
		JellyBeanss = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(JellyBeans))
		wait(30)
		JellyBeanss = false
	end
end)


Buffs:CreateToggle("Auto TropicalDrink", true, function()
	if TropicalDrinkk == false then
		TropicalDrinkk = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(TropicalDrink))
		wait(600)
		TropicalDrinkk = false
	end
end)


Buffs:CreateToggle("Auto CloudVial", true, function()
	if CloudViall == false then
		CloudViall = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(CloudVial))
		wait(180)
		CloudViall = false
	end
end)


Buffs:CreateToggle("Auto SuperSmoothie", true, function()
	if SuperSmoothiee == false then
		SuperSmoothiee = true
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(SuperSmoothie))
		wait(1200)
		SuperSmoothiee = false
	end
end)










--Dispencers


local Dispencerss = {"Free Ant Pass Dispencer", "Treat Dispencer", "Blueberry Dispencer", "Strawberry Dispencer", "Glue Dispencer", "Free Royal Jelly Dispencer", "Wealth Clock", "Free Robo Pass Dispencer"}


Dispencers:CreateToggle("Auto Wealth Clock", true, function()
	game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Wealth Clock")
end)


Dispencers:CreateToggle("Auto Treat Dispenser", true, function()
	game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Treat Dispenser")
end)


Dispencers:CreateToggle("Auto Free Ant Pass Dispenser", true, function()
	game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Free Ant Pass Dispenser")
end)

Dispencers:CreateToggle("Auto Blueberry Dispenser", true, function()
	game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Blueberry Dispenser")
end)


Dispencers:CreateToggle("Auto Strawberry Dispenser", true, function()
	game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Strawberry Dispenser")
end)


Dispencers:CreateToggle("Auto Glue Dispenser", true, function()
	game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Glue Dispenser")
end)


Dispencers:CreateToggle("Auto Free Royal Jelly Dispenser", true, function()
	game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Free Royal Jelly Dispenser")
end)


Dispencers:CreateToggle("Auto Free Robo Pass Dispenser", true, function()
	game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Free Robo Pass Dispenser")
end)













-- Teleport



tp:CreateDropdown("Select Teleport (Feilds)", getZones(), function(Zones)
	SelectedZones = Zones
end)


tp:CreateDropdown("Select Teleport (Misc)", getMisc(), function(Misc)
	SelectedMisc = Misc
end)


tp:CreateButton("Teleport To Selected Field", function()
	if SelectedZones then
		local CFrameEnd = WS.FlowerZones[SelectedZones].CFrame 
		local Time = 7
		local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})	
		tween:Play()
		tween.Completed:Wait()
	end
end)


tp:CreateButton("Teleport To Selected Misc", function()
	if SelectedMisc then
		local CFrameEnd = WS.Toys[SelectedMisc].Platform.CFrame
		local Time = 7
		local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrameEnd})	
		tween:Play()
		tween.Completed:Wait()
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













--Misc



Misc:CreateDropdown("Select Default Mask", Mask, function(Mask)
	SelectedMaskEquip = Mask
end)

Misc:CreateToggle("Equip Honey Mask Before Convert ", false, function(Enabled)
	ToggleTable.Toggles.AutoHoneyMaskEquip = Enabled-- Ensure Toggled is local to this function
	spawn(function()
		while ToggleTable.Toggles.AutoHoneyMaskEquip do
			task.wait()
			if Enabled then
				if HoneyMaskEquip == true and SelectedMask == false then
					game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer(unpack({[1] = "Equip",[2] = {["Type"] = "Honey Mask",["Category"] = "Accessory"}}))
				end
				if SelectedMask == true and HoneyMaskEquip == false and SelectedMaskEquip then
					game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer(unpack({[1] = "Equip",[2] = {["Type"] = SelectedMaskEquip,["Category"] = "Accessory"}}))
				end
			end
		end
	end)
end)



Misc:CreateDropdown("Select Star Amullet", Star, function(Stars)
	SelectedStars = Stars
	print(SelectedStars)
end)


Misc:CreateButton("Generate Selected Star", function()
	if SelectedStars then
		local args = {[1] = SelectedStars}
		game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer(unpack(args))
	end
end)


Misc:CreateButton("Generate Moon Amullet", function()
	local args = {[1] = "Moon Amulet Generator"}
	game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer(unpack(args))
end)

Misc:CreateButton("Redeem Codes", function()
	for _,v in pairs(Codes) do
		RS.Events.CodeEvent:FireServer(v)
	end
end)



--Settings


Setting:CreateSlider("WalkSpeed", {min = 1, max = 50, default = 50}, function(state)
	Player.Character.Humanoid.WalkSpeed = state
end)


local TeleportService = game:GetService("TeleportService")

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/DTkfPKrpBu")
end)


Setting:CreateButton("Uninject", function()
	game:GetService("CoreGui").FATALITY:Destroy()
end)


Setting:CreateButton("Uninject and Rejoin", function()
	game:GetService("CoreGui").FATALITY:Destroy()
	TeleportService:Teleport(game.PlaceId)
end)

