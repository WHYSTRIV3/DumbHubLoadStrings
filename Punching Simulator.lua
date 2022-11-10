local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("Punching Simulator")

local Main = ui:new("Main")
local Egg = ui:new("Eggs")
local Teleport = ui:new("Teleport")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"STARSTUDIOS", "RELEASE", "FREEBOOST", "FREEPET", "LETSFIGHT", "20KVISITS", "200LIKES", "5KMEMBERS", "300LIKES", "SPOOKYUPDATE", "HAPPYHALLOWEEN", "10KMEMBERS"}
local SelectedZones;
local SelectedINTERACTIONS;
local KANdistance = 500;
local Remotes = RS.Remotes
local TappingRemote = Remotes:FindFirstChild("Tapping")
local FunctionRemote = Remotes:FindFirstChild("Function")
local SelectedWorlds;
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions
function getWorlds()
    local Worlds = {}
    for _,v in pairs(game:GetService("Workspace")["_GAME"]["_MINIONS"]:GetChildren()) do
        table.insert(Worlds, v.Name)
    end
    return Worlds
end



function getZones()
    local Zones = {}

    for _,v in pairs(game:GetService("Workspace")["_GAME"]["_ZONES"]:GetChildren()) do
        table.insert(Zones, v.Name)
    end
    return Zones
end


function getINTERACTIONS()
    local INTERACTIONS = {}
    for _,v in pairs(game:GetService("Workspace")["_GAME"]["_INTERACTIONS"]:GetChildren()) do
        table.insert(INTERACTIONS, v.Name)
    end
    return INTERACTIONS
end


--Main

Main:CreateToggle("Auto click", true, function()
RS.Remotes.Tapping:FireServer("Tapping")
end)


Main:CreateToggle("Auto Kill Near", true, function()
    local nearest
    local NearestOne = KANdistance
    for _,v in pairs(WS["_GAME"]["_MINIONS"]:GetDescendants()) do
        if v:IsA("Model") and v.Parent:IsA("Folder") then
            if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
                nearest = v
                NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
            end
        end
    end
    Remotes.Attack:FireServer("Attack", nearest)
end)

Main:CreateToggle("Auto RankUp", true, function()
    if Player.PlayerGui.Interface.CenterFrame.RankUp.RankData.Percent.Text == "100%" then
        FunctionRemote:InvokeServer("RankUp")
    end
end)


Main:CreateToggle("Auto Buy Aura", true, function()
RS.Remotes.Function:InvokeServer("AuraBuy")
end)


Main:CreateButton("Redeem Codes", function()
    for _,v in pairs(Codes) do
        RS.Remotes.Function:InvokeServer("Codes", v)
    end
end)



-- Teleport

Teleport:CreateDropdown("Zones", getZones(), function(Zones)
    SelectedZones = Zones;
    print(SelectedZones)
end)

Teleport:CreateButton("Teleport", function()
    if SelectedZones then
        local TeleportCFrame = WS["_GAME"]["_ZONES"][SelectedZones].CFrame
        Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
    end
end)


Teleport:CreateDropdown("INTERACTIONS", getINTERACTIONS(), function(INTERACTIONS)
    SelectedINTERACTIONS = INTERACTIONS;
    print(SelectedINTERACTIONS)
end)

Teleport:CreateButton("Teleport", function()
    if SelectedINTERACTIONS then
        local TeleportCFrame = WS["_GAME"]["_INTERACTIONS"][SelectedINTERACTIONS].CFrame
        Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
    end
end)






-- Eggs

Egg:CreateDropdown("Selected World", getWorlds(), function(Selected)
    SelectedWorlds = Selected
    print(SelectedWorlds)
end)

Egg:CreateToggle("Auto Egg", true, function()
    if SelectedWorlds then
    local ohString1 = "BuyEgg"
    local ohTable2 = {
	["Egg"] = "NormalEgg",
	["Type"] = "Single",
	["World"] = SelectedWorlds
}

game:GetService("ReplicatedStorage").Remotes.Function:InvokeServer(ohString1, ohTable2)
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

TextLabel.Parent = game:GetService("CoreGui")["UI V2"]
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
		game:GetService("CoreGui")["UI V2"].FPStext.Text = "FPS: " .. tostring(fps) .. " Average: " .. string.format("%.0f", (sum / #FPSAverage))
		if (tick() - LastTick) >= 15 then
			FPSAverage = { }
			LastTick = tick()
		end
		LastTick = tick()
	end
end)



Misc:CreateButton("Show/Hide FPS Counter", function()
	game:GetService("CoreGui")["UI V2"].FPStext.Visible = not game:GetService("CoreGui")["UI V2"].FPStext.Visible
	Ticking = not Ticking
end)


Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/ups8GeuYAD")
end)

local TeleportService = game:GetService("TeleportService")

Misc:CreateButton("Uninject", function()
    game:GetService("CoreGui")["UI V2"]:Destroy()
end)

Misc:CreateButton("Uninject and Rejoin", function()
    game:GetService("CoreGui")["UI V2"]:Destroy()
    TeleportService:Teleport(game.PlaceId)
end)
