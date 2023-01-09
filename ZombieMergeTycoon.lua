
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V2%20Library.lua", true))()
local ui = Library:CreateWindow()


local Main = ui:new("Main")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"UPDATE1"}

--Variables

local SelectedPlots;
local SelectedTycoon;



-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions

function getTycoon()
    local Tycoon = {}

    for _,v in pairs(game:GetService("Workspace").Tycoon.Tycoons:GetChildren()) do
        table.insert(Tycoon, v.Name)
    end
    return Tycoon
end


function getOwner()
    for _,v in pairs(WS.Tycoon.Tycoons:GetChildren()) do
		if tostring(v.Owner.Value) == Player.Name then
			SelectedPlots = v.Name
		end
	end
end

getOwner()





--Main

Main:CreateLabel("", "Plot: "..SelectedPlots)



Main:CreateDropdown("Selected Plot", getTycoon(), function(Tycoon)
    SelectedTycoon = Tycoon
    print(SelectedTycoon)
end)


Main:CreateToggle("Auto Get Samples", true, function()
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(1, Vector3.new(-190.07846069335938, 2.289586305618286, 261.3152160644531))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(2, Vector3.new(-184.17544555664062, 2.296891450881958, 260.1817321777344))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(4, Vector3.new(-178.60289001464844, 2.279636859893799, 267.8474426269531))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(5, Vector3.new(-191.52503967285156, 2.2993853092193604, 261.00677490234375))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(1, Vector3.new(-190.07846069335938, 2.289586305618286, 261.3152160644531))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(2, Vector3.new(-184.17544555664062, 2.296891450881958, 260.1817321777344))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(4, Vector3.new(-178.60289001464844, 2.279636859893799, 267.8474426269531))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(5, Vector3.new(-191.52503967285156, 2.2993853092193604, 261.00677490234375))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(1, Vector3.new(-190.07846069335938, 2.289586305618286, 261.3152160644531))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(2, Vector3.new(-184.17544555664062, 2.296891450881958, 260.1817321777344))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(4, Vector3.new(-178.60289001464844, 2.279636859893799, 267.8474426269531))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(5, Vector3.new(-191.52503967285156, 2.2993853092193604, 261.00677490234375))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(1, Vector3.new(-190.07846069335938, 2.289586305618286, 261.3152160644531))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(2, Vector3.new(-184.17544555664062, 2.296891450881958, 260.1817321777344))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(4, Vector3.new(-178.60289001464844, 2.279636859893799, 267.8474426269531))
game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(5, Vector3.new(-191.52503967285156, 2.2993853092193604, 261.00677490234375))
end)


Main:CreateToggle("Auto Put Samples In Machine", true, function()
game:GetService("ReplicatedStorage").Signals.RemoteEvents.PutRemote:FireServer()
end)


Main:CreateToggle("Auto Upgrade", true, function()
    for i, v in pairs(game:GetService("Workspace").Tycoon.Tycoons[SelectedTycoon]["Buttons_E"].Upgrade:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)

Main:CreateToggle("Auto Add Zombie", true, function()
    for i, v in pairs(game:GetService("Workspace").Tycoon.Tycoons[SelectedTycoon]["Buttons_E"].Add:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)


Main:CreateToggle("Auto Merge", true, function()
    for i, v in pairs(game:GetService("Workspace").Tycoon.Tycoons[SelectedTycoon]["Buttons_E"].Merge:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)


--[[
Main:CreateToggle("Auto Kill Zombies", true, function()
    for _, v in pairs(game:GetService("Workspace").Zombies:GetChildren()) do
        if v:IsA("Model") then
            workspace.Zombies[tostring(v)].Zombie.HumanoidRootPart.CFrame = CFrame.new(-147.198059, 5.98697472, 214.053329, 0.808997452, -0, -0.587812185, 0, 1, -0, 0.587812185, 0, 0.808997452)
        end
     end
end)
--]]




-- Teleport











-- Eggs










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
