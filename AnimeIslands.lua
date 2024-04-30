local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/FATALITY.lua", true))()
local ui = Library:CreateWindow()



local Main = ui:new("Main")
local Upgrade = ui:new("Upgrades")
local Egg = ui:new("Pets")
local tp = ui:new("Teleport")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"SORRYFORLASTUPDATE", "UPDATE4.5", "10KLIKES", "UPDATE4", "1MVISITS", "UPDATE3", "SORRYFORDUNGEONBUG", "UPDATE2.5", "5KLIKES", "UPDATE2", "SORRYFORSHUTDOWN", "2KLIKES", "UPDATE1", "1KLIKES", "Daetoi", "BUGFIXES"}
local Farm = {"TeleportToSelectedMob",  "All Mobs"}
local Upgradess = {"Power", "Gems", "Sword", "PetsEquipped", "Sphere"}
--Variables

local Saved;
local SelectedTp;
local SelectedRebirths;
local SelectedEggs;
local SelectedUpgrade;


-- Anti Afk

Player.Idled:Connect(function()
	VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
	wait(1)
	VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)



--functions



function getMobs()
	local Mobs = {}

	for i,v in pairs(game:GetService("ReplicatedStorage").Mobs:GetChildren()) do
		if v:IsA("Model") then
			table.insert(Mobs, v.Name)
		end
	end
	return Mobs
end

function getIsland()
	local Island = {}

	for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
		if v:IsA("Folder") then
			table.insert(Island, v.Name)
		end
	end
	return Island
end


function getTP()
	local TP = {}

	for i,v in pairs(game:GetService("Workspace").Interact:GetChildren()) do
		if v:IsA("Folder") then
			table.insert(TP, v.Name)
		end
	end
	return TP
end


function getUpgrades()
	local Upgrades = {}

	for i,v in pairs(Upgradess) do
			table.insert(Upgrades, v.Name)
	end
	return Upgrades
end



--Main

local Teleport = true



Main:CreateDivider("Auto Farms")


Main:CreateDropdown("Selected Farm", Farm, function(Farms)
	_G.SelectedFarm = Farms
end)


Main:CreateDropdown("Selected Mob", getMobs(), function(Mobs)
	_G.SelectedMobs = Mobs
end)


Main:CreateToggle("Auto Farm", true, function()
    if _G.SelectedFarm == "TeleportToSelectedMob" then

        local nearest
        local NearestOne = 1000
                for i,v in pairs(game:GetService("Workspace").Client.Mobs:GetDescendants()) do
                        if v:IsA("Model") and v.Name == _G.SelectedMobs then
                            if (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
                                nearest = v
                                NearestOne = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                        
                        end
                    end
                end
                if Teleport then
                    Player.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,0,1)
                end
        elseif _G.SelectedFarm == "All Mobs" then
        
        local nearest
        local NearestOne = 1000
                for i,v in pairs(game:GetService("Workspace").Client.Mobs:GetDescendants()) do
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


Main:CreateToggle("Auto Attack/Click", true, function()
    local args = {
        [1] = "Combat",
        [2] = {
            [1] = "Attack"
        }
    }
    
    game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(args))
end)


Main:CreateToggle("Auto Collect", true, function()
    for i, v in pairs(game:GetService("Workspace").Drops:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)

Main:CreateToggle("Auto Collect Spheres", true, function()
    for i, v in pairs(game:GetService("Workspace").DragonSpheresSpawns:GetDescendants()) do
        if v:FindFirstChild("TouchInterest") then
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
         end
     end
end)



--Upgrades

Upgrade:CreateDivider("Upgrades")


Upgrade:CreateDropdown("Selected Upgrade", Upgradess, function(Upgrade)
    SelectedUpgrade = Upgrade
end)    


Upgrade:CreateButton("Auto Upgrade", function()
    if SelectedUpgrade then
        local args = {
            [1] = "Upgrade",
            [2] = {
                [1] = "Upgrade",
                [2] = tostring(SelectedUpgrade)
            }
        }

        game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(args))
    end
end)



--Egg


local Waitt = false
local PetWait = false
local SummonWait = false
local SwaordWait = false

Egg:CreateDivider("Auto Pet")


Egg:CreateDropdown("Selected Island", getIsland() , function(Island)
    SelectedIsland = Island
end)


Egg:CreateToggle("Auto Pet Summon", true, function()
    if SelectedIsland then
        if PetWait == false then
            PetWait = true
                local Pet = {
                    [1] = "PetSummon",
                    [2] = {
                        [1] = "Spin",
                        [2] = "x1",
                        [3] = tostring(SelectedIsland),
                        [4] = false,
                        [5] = {}
                    }
                }

                game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(Pet))
            task.wait(15)
            PetWait = false
        end
    end
end)


Egg:CreateToggle("Auto Pet Summon(x3)", true, function()
    if SelectedIsland then
        if PetWait == false then
            PetWait = true
                local Pet = {
                    [1] = "PetSummon",
                    [2] = {
                        [1] = "Spin",
                        [2] = "x3",
                        [3] = tostring(SelectedIsland),
                        [4] = false,
                        [5] = {}
                    }
                }

                game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(Pet))
            task.wait(15)
            PetWait = false
        end
    end
end)


Egg:CreateToggle("Auto Mount Spin", true, function()
    local args = {
        [1] = "MountGacha",
        [2] = {
            [1] = "Spin",
            [2] = false
        }
    }

    game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(args))
end)


Egg:CreateToggle("Auto Hero Summon", true, function()
    if SummonWait == false then
        SummonWait = true
            local args = {
                [1] = "HeroSummon",
                [2] = {
                    [1] = "Spin"
                }
            }
            game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(args))
        task.wait(15)
        SummonWait = false
    end
end)


Egg:CreateToggle("Auto EquipBest Summon", true, function()
    if Waitt == false then
        Waitt = true
        local args = {
            [1] = "Inventory",
            [2] = {
                [1] = "EquipBest",
                [2] = "Pets"
            }
        }

            game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(args))
        task.wait(4)
        Waitt = false
    end
end)


Egg:CreateToggle("Auto Equip Best Sword", true, function()
    if SwaordWait == false then
        SwaordWait = true
        local args = {
            [1] = "Inventory",
            [2] = {
                [1] = "EquipBest",
                [2] = "Swords"
            }
        }

            game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(args))
        task.wait(5)
        SwaordWait = false
    end
end)


Egg:CreateButton("Buy Selected World Sword",  function()
    if SelectedIsland then
        local args = {
            [1] = "Market",
            [2] = {
                [1] = "BuyItem",
                [2] = tostring(SelectedIsland),
                [3] = 1
            }
        }

        game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(args))
    end
end)


--tp

tp:CreateDivider("Teleports")


tp:CreateDropdown("Selected Teleport", getTP(), function(TP)
    SelectedTp = TP
end)

tp:CreateButton(" Teleport",function()
  if SelectedTp then
    local args = {
            [1] = "Zone",
            [2] = {
                [1] = "LoadZone",
                [2] = tostring(SelectedTp)
            }
        }
        
        game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(args))
    end
end)




-- Misc

Misc:CreateDivider("Misc")


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
	for i,v in pairs(Codes) do
        local args = {
            [1] = "Shop",
            [2] = {
                [1] = "UseCode",
                [2] = v
            }
        }

        game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(args))
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
