
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V2%20Library.lua", true))()
local ui = Library:CreateWindow()

local Free = ui:new("Free")
local Main = ui:new("Free Boost")
local Egg = ui:new("Free Eggs")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"UPDATE1"}
local CoinAmount = {100, 500, 1000, 5000, 10000, 50000, 100000, 500000, 1000000}
local Time = {1, 5, 10, 20, 30, 60}
--Variables

local Teleport = true
local SelectedCoinAmount;
local EquipBestWait = false
local Selectedsword;
local SelectedPets;
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions



function getPets()
	local Pets = {}

	for _,v in pairs(game:GetService("ReplicatedStorage").Player.pet.model:GetChildren()) do 
		table.insert(Pets, v.Name)
	end
	return Pets
end

function getsword()
	local sword = {}

	for _,v in pairs(game:GetService("ReplicatedStorage")["Model_Sword"].sword:GetChildren()) do 
		table.insert(sword, v.Name)
	end
	return sword
end






--Free

Free:CreateLabel("", "THERE IS A CHANCE U CAN GET BANNED ")

Free:CreateLabel("", "WITH LEAVING THE TOGGLE ON TO LONG KEEP IT REAL SHORT")

Free:CreateLabel("", "OR USE THE BUTTONS")

Free:CreateDropdown("Select Coin Amount/Yaoqi Amount", CoinAmount, function(CoinAmount)
	SelectedCoinAmount = CoinAmount
	print(SelectedCoinAmount)
end)



Free:CreateToggle("Give yaoqi ", true, function()
	if SelectedCoinAmount then
		game:GetService("ReplicatedStorage").Player.Event.send_yaoqi:FireServer(SelectedCoinAmount)
    end
end)



Free:CreateToggle("Give Coins", function()
	if SelectedCoinAmount then
		game:GetService("ReplicatedStorage").Player.Event.send_coin:FireServer(SelectedCoinAmount)
	end
end)


Free:CreateButton("Give Coins", function()
	if SelectedCoinAmount then
		game:GetService("ReplicatedStorage").Player.Event.send_coin:FireServer(SelectedCoinAmount)
	end
end)

Free:CreateButton("Give yaoqi", function()
	if SelectedCoinAmount then
		game:GetService("ReplicatedStorage").Player.Event.send_yaoqi:FireServer(SelectedCoinAmount)
	end
end)



Free:CreateButton("Unlock All GamePasses", function() 
    for _,v in pairs(Player.data["product_data"]:GetChildren()) do 
        if v.Value == false then
                v.Value = true
        end
    end
end)





Free:CreateToggle("Unlock Some Achivements", function() 
game:GetService("ReplicatedStorage").Player.Module.Achivements["btn_playingtime_Event"]:FireServer()

game:GetService("ReplicatedStorage").Player.Module.Achivements["Achivements_Init_Event"]:FireServer()

game:GetService("ReplicatedStorage").Player.Module.Achivements["btn_mapKillMonster_Event"]:FireServer()

game:GetService("ReplicatedStorage").Player.Module.Achivements["btn_monsterTrainer_Event"]:FireServer()

game:GetService("ReplicatedStorage").Player.Module.Achivements["btn_hcfail_Event"]:FireServer()

game:GetService("ReplicatedStorage").Player.Module.Achivements["btn_maxMap_Event"]:FireServer()
end)



--Main


Main:CreateToggle("Every Boost", true, function() 
	game:GetService("ReplicatedStorage").Player.Module.choujiang.wheel5_7:FireServer(610)
end)



Main:CreateToggle("Free Luck Boost", true, function() 
	game:GetService("ReplicatedStorage").Player.Module.choujiang.wheel1_2:FireServer(27)
end)


Main:CreateToggle("Free Damage Boost ", true, function() 
	game:GetService("ReplicatedStorage").Player.Module.choujiang.wheel3_4:FireServer(40)
end)


Main:CreateToggle("Free Monsters soul boost", true, function() 
	game:GetService("ReplicatedStorage").Player.Module.choujiang.wheel3_4:FireServer(63)
end)


Main:CreateToggle("Free XP boost", true, function() 
	game:GetService("ReplicatedStorage").Player.Module.choujiang.wheel5_7:FireServer(238)
end)


Main:CreateToggle("Free Lucky Boost", true, function() 
	game:GetService("ReplicatedStorage").Player.Module.choujiang.wheel5_7:FireServer(650)
end)

Main:CreateToggle("Free auto Rank up", true, function() 
	game:GetService("ReplicatedStorage").Player.Event["exp_add"]:FireServer(10000000000)
game:GetService("ReplicatedStorage").Player.Event.lvup:FireServer(game:GetService("Players").LocalPlayer)
end)



Main:CreateToggle("Free Coins from wheel", true, function() 
	game:GetService("ReplicatedStorage").Player.Module.choujiang.wheel3_4:FireServer(85)
end)


-- Teleport








-- Eggs



Egg:CreateDropdown("Select Pet", getPets(), function(pets)
	SelectedPets = pets
	print(SelectedPets)
end)


Egg:CreateDropdown("Select Sword", getsword(), function(sword)
	Selectedsword = sword
	print(Selectedsword)
end)

Egg:CreateButton("Free Pets", function()
	if SelectedPets then
	game:GetService("ReplicatedStorage").Player.pet.event.petbaby_set:FireServer(SelectedPets)
	end
end)






Egg:CreateButton("Free Sword", function()
	if Selectedsword then
		game:GetService("ReplicatedStorage").Player.Module.choujiang["getWeapon_event"]:FireServer(Selectedsword)
	end
end)


Egg:CreateButton("Free Upgrade Currency", function()
local ohTable1 = {
	["wea_type"] = "s_m6_7",
	["map"] = 6,
	["lv"] = 50,
	["lock"] = false,
	["weaponid"] = 17,
	["star"] = 0,
	["weapon_lev"] = "Eternity",
	["damage"] = 7607
}

game:GetService("ReplicatedStorage").Player.Module.weapon.wea_sale:FireServer(ohTable1)
end)


Egg:CreateButton("Unlock all Swords", function()
game:GetService("ReplicatedStorage").Player.Module.weapon.unlockall:FireServer()
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

local TeleportService = game:GetService("TeleportService")

Misc:CreateButton("Uninject", function()
    game:GetService("CoreGui").DumbHubV2:Destroy()
end)

Misc:CreateButton("Uninject and Rejoin", function()
    game:GetService("CoreGui").DumbHubV2:Destroy()
    TeleportService:Teleport(game.PlaceId)
end)
