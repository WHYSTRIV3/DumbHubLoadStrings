
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/V1Library.lua", true))()
local ui = Library:CreateWindow()

local Main = ui:new("Main")
local Egg = ui:new("Eggs")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"Release", "Alien", "500Likes", "3kLikes", "BeastPet349", "BeastPet491", "BeastPet550"}


--Variables
local TeleportWait = false
local selectedEggs;
local SelectedWin;


-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions

function getEggs()
    local Eggs = {}

    for _,v in pairs(WS.Eggs:GetChildren()) do
        table.insert(Eggs, v.Name)
    end
    return Eggs
end

function getWins()
    local Wins = {}

    for _,v in pairs(WS.Wins:GetChildren()) do
        table.insert(Wins, v.Name)
    end
    return Wins
end







--Main


Main:CreateLabel("", "there is a wait for the next time it gives it to you")
Main:CreateLabel("", "Nothing i can do")

Main:CreateDropdown("Select Win", getWins(), function(Win)
    SelectedWin = Win
    print(SelectedWin)
end)

Main:CreateToggle("Auto Specific Win", true, function()
    if SelectedWin then
        Player.Character.HumanoidRootPart.CFrame = WS.Wins[SelectedWin].CFrame * CFrame.new(0,0,0)
    end
end)





Main:CreateToggle("Loop Through all", true, function()
	if TeleportWait == false then
		TeleportWait = true
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-725.899963, -2.9000001, -49.1000099, 0, -1, -0, -1, 0, -0, 0, 0, -1)
        task.wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(39.8999863, -2002.94995, 122.100006, 0, 0, -1, -1, 0, 0, 0, 1, 0)
        task.wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(272.899963, -2.9000001, 57.6000214, 0, 1, -0, -1, 0, 0, 0, 0, 1)
        task.wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(319.256989, 429.100067, -49.2000046, 0, 1, -0, -1, 0, 0, 0, 0, 1)
        task.wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.299987793, -2.9000001, -757, 0, 0, 1, -1, 0, 0, 0, -1, 0)
        task.wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40.5000725, 117.699997, 673.100037, 0, 0, -1, -1, 0, 0, 0, 1, 0)
        task.wait(1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.5, -8.5, 0.299995422, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		task.wait(1)
		TeleportWait = false
    end
end)



Main:CreateToggle("Sit Here and Collect", true, function()
    for i, v in pairs(game:GetService("Workspace").Wins:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)


Main:CreateToggle("Auto Rebirth", true, function()
game:GetService("ReplicatedStorage").RebirthEvent:FireServer()
end)













-- Teleport











-- Eggs


Egg:CreateDropdown("Select Egg",getEggs(), function(Eggs)
    SelectedEggs = Eggs
end)

Egg:CreateToggle("Auto Egg", true, function()
    if SelectedEggs then
        RS.RemoteEvents.EggOpened:InvokeServer(SelectedEggs, "Single")
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

