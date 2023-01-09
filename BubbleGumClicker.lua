
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V2%20Library.lua", true))()
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
local Gifts = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}
--Variables

local SelectedEgg;
local EquipBestWait = false



-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions


function getTeleport()
	local Teleport = {}

	for _,v in pairs(game:GetService("Workspace").MAP.Teleports:GetChildren()) do
		table.insert(Teleport, v.Name)
	end
	return Teleport
end

		
function getEggs()
	local Eggs = {}

	for _,v in pairs(game:GetService("Workspace").MAP.Eggs:GetChildren()) do
		table.insert(Eggs, v.Name)
	end
	return Eggs
end

	

--Main

Main:CreateToggle("Auto Blow", true, function()
	workspace.Stuff.Remotes["blow bubble"]:FireServer({[1] = {[1] = false},[2] = {[1] = 2}})
end)


Main:CreateToggle("Auto Sell", true, function()
	workspace.Stuff.Remotes["sell bubbles"]:FireServer({[1] = {[1] = false},[2] = {[1] = 2}})
end)


Main:CreateToggle("Auto Collect Coins", true, function()
    for i, v in pairs(game:GetService("Workspace").Stuff.Pickups:GetDescendants()) do
			if v:FindFirstChild("TouchInterest") then
			firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
			firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)


Main:CreateToggle("Auto Collect Chest", true, function()
	workspace.Stuff.Remotes["collect chest"]:FireServer({[1] = {[1] = "Heavenly Chest"},[2] = {[1] = false}})
	workspace.Stuff.Remotes["collect chest"]:FireServer({[1] = {[1] = "Void Chest"},[2] = {[1] = false}})
	workspace.Stuff.Remotes["collect chest"]:FireServer({[1] = {[1] = "Sky Chest"},[2] = {[1] = false}})
end)


Main:CreateToggle("Auto Collect Free Gifts", true, function()
	for _,v in pairs(Gifts) do
		workspace.Stuff.Remotes["redeem free gift"]:InvokeServer({[1] = {[1] = v},[2] = {[1] = false}})
	end
end)


Main:CreateButton("Unlock All worlds", function()
	workspace.Stuff.Remotes["unlock island"]:FireServer( {[1] = {[1] = "Sky Island"},[2] = {[1] = false}})
	workspace.Stuff.Remotes["unlock island"]:FireServer( {[1] = {[1] = "Lucky Landing"},[2] = {[1] = false}})
	workspace.Stuff.Remotes["unlock island"]:FireServer( {[1] = {[1] = "Heaven"},[2] = {[1] = false}})
	workspace.Stuff.Remotes["unlock island"]:FireServer( {[1] = {[1] = "Space"},[2] = {[1] = false}})
	workspace.Stuff.Remotes["unlock island"]:FireServer( {[1] = {[1] = "The Void"},[2] = {[1] = false}})
	workspace.Stuff.Remotes["unlock island"]:FireServer( {[1] = {[1] = "Fairy World"},[2] = {[1] = false}})
end)








-- Teleport

tp:CreateDropdown("Select World", getTeleport(), function(World)
	SelectedWorld = World
	print(SelectedWorld)
end)


tp:CreateButton("Teleport", function()
	Player.Character.HumanoidRootPart.CFrame = WS.MAP.Teleports[SelectedWorld].CFrame
end)



-- Eggs

Egg:CreateDropdown("Select Egg", getEggs(), function(Egg)
	SelectedEgg = Egg
	print(SelectedEgg)
end)


Egg:CreateToggle("Auto Egg", true, function()
	if SelectedEgg then
		workspace.Stuff.Remotes["buy egg"]:InvokeServer({[1] = {[1] = SelectedEgg},[2] = {[1] = false}})
	end
end)


Egg:CreateToggle("Auto EquipBest", true, function()
	if EquipBestWait == false then
		EquipBestWait = true
			workspace.Stuff.Remotes["equip best pets"]:FireServer({[1] = {[1] = false},[2] = {[1] = 2}})
		task.wait(5)
	   EquipBestWait = false
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
