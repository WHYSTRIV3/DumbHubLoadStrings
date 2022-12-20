
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
local Upgrades = {"Damage Multiplier", "Health Multiplier", "Walk Speed", "Inventory Space", "Jump Power", "Pet Space"}
local Pass =  {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
--Variables
local SelectedEggs;






-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions
function getEggs()
    local Eggs = {}

    for _,v in pairs(Player.PlayerGui.Main.Eggs.EggsList:GetChildren()) do
        if v:IsA("ImageLabel") then 
            table.insert(Eggs, v.Name)
        end
    end
    return Eggs
end

function getPortals()
    local Portals = {}

    for _,v in pairs(WS["__MAP"].Portals:GetChildren()) do
            table.insert(Portals, v.Name)
    end
    return Portals
end





--Main


Main:CreateToggle("Auto Swing", true, function()
Player.Character:FindFirstChildOfClass("Tool"):Activate() 
end)






Main:CreateToggle("Auto Rebirth", true, function()
    RS.Framework.Modules.Shared.Internal.Modules["2 | Network"].Remotes.s_controller_rebirth:InvokeServer({})
end)


Main:CreateToggle("Auto Upgrade", true, function()
    for _,v in pairs(Upgrades) do
        RS.Framework.Modules.Shared.Internal.Modules["2 | Network"].Remotes.s_controller_upgrade:InvokeServer({[1] = v})
    end
end)

Main:CreateToggle("Auto Collect Free Pass", true, function()
    for _,v in pairs(Pass) do
        RS.Framework.Modules.Shared.Internal.Modules["2 | Network"].Remotes.s_controller_claimtier:InvokeServer({[1] = v, [2] = "Free"})
    end
end)



Main:CreateToggle("Auto Spin Wheel", true, function()
    RS.Framework.Modules.Shared.Internal.Modules["2 | Network"].Remotes.s_controller_spinwheel:InvokeServer({})
end)

-- Teleport


tp:CreateDropdown("Select Teleport", getPortals(), function(Portals)
    SelectedPortals = Portals
    print(SelectedPortals)
end)


tp:CreateButton("Teleport", function()
    if SelectedPortals then
        local TeleportCFrame = WS["__MAP"].Portals[SelectedPortals].Beach.Teleport.CFrame
        Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
    end
end)


-- Eggs


Egg:CreateDropdown("Select Egg", getEggs(), function(Eggs)
    SelectedEggs = Eggs
    print(SelectedEggs)
end)

Egg:CreateToggle("Auto Egg", true, function()
    if SelectedEggs then
        RS.Framework.Modules.Shared.Internal.Modules["2 | Network"].Remotes.s_controller_buyegg:InvokeServer({[1] = SelectedEggs})
    end
end)




Egg:CreateToggle("Auto EquipBest", true, function()
    RS.Framework.Modules.Shared.Internal.Modules["2 | Network"].Remotes.s_pets_bestpets:FireServer({})
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

