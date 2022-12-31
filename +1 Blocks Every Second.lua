
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V1Library.lua", true))()
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
local Codes = {"Release", "Alien", "500Likes", "3kLikes", "BeastPet349", "BeastPet491", "BeastPet550"}
local Buy = {
     1,
    2,
     3,
     4,
     5,
     6,
    7,
     8,
    9,
   10,
    11,
	 12,
	 13,
	14,
	15
}
--Variables

local SelectedEggs;
local SelectedBuy;




-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions


function getEggs()
	local Eggs = {}

	for _,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
		table.insert(Eggs, v.Name)
	end
	return Eggs
end



function getBuyNames()
    local BuyTabs = {}

    for i,v in pairs(Buy) do
        table.insert(BuyTabs, i)
    end
    return BuyTabs
end





--Main

Main:CreateToggle("Auto Build", true, function()
	game:GetService("ReplicatedStorage").Remotes.PlaceBlock:FireServer()
end)


Main:CreateToggle("Auto Rebirth", true, function()
RS.Remotes.Rebirth:InvokeServer("RebirthShop")
end)


Main:CreateToggle("Auto Daily Chest", true, function()
game:GetService("ReplicatedStorage").Remotes.Claim:InvokeServer()
end)


Main:CreateToggle("Auto Claim Gift", true, function()
game:GetService("ReplicatedStorage").Remotes.ClaimGift:InvokeServer()
end)


Main:CreateDropdown("Select Upgrade", getBuyNames(), function(Buy)
    SelectedBuy = Buy
    print(SelectedBuy)
end)


Main:CreateButton("Buy", function()
    if SelectedBuy then
        game:GetService("ReplicatedStorage").Remotes.PurchaseTower:InvokeServer(SelectedBuy)
    end
end)




--[[
Main:CreateButton("Unlock All GamePasses", function() 
    for _,v in pairs(Player.Gamepasses:GetChildren()) do 
        if v.Value == false then
                v.Value = true 
        end
    end
end)
]]

-- Teleport

tp:CreateButton("Spawn", function()
	Player.character.HumanoidRootPart.CFrame = CFrame.new(-42.0018845, 8.94007778, -32.100811, -0.907149851, -6.54051391e-08, 0.420807689, -7.89084993e-08, 1, -1.46781804e-08, -0.420807689, -4.65206114e-08, -0.907149851)
end)



-- Eggs

Egg:CreateDropdown("select Egg", getEggs(), function(Eggs)
	SelectedEggs = Eggs
	print(SelectedEggs)
end)


Egg:CreateToggle("Auto Egg", true, function()
	RS.RemoteEvents.EggOpened:InvokeServer(SelectedEggs, "Single")
end)


Egg:CreateToggle("Auto Craft", true, function()
	for _,v in pairs(Player.Pets:GetDescendants()) do
		if v.Name == "PetID" then
				RS.RemoteEvents.PetActionRequest:InvokeServer("Craft", {["PetID"] = v.Value})
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

Misc:CreateButton("Redeem Codes", function()
    for _,v in pairs(Codes) do
        RS.EnterCode:FireServer(v)
    end
end)


Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/ups8GeuYAD")
end)

