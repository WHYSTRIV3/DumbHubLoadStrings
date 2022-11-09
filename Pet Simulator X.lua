local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("Pet Simulator X")

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
local Codes = {"Release", "Alien", "500Likes", "3kLikes", "BeastPet349", "BeastPet491", "BeastPet550"}
--Variables

local SelectedTeleports;
local SelectedEggs;
local EquipBestWait = false;
local EquipBestTime = 5
local Things = WS.__THINGS
local Remotes = Things.__REMOTES
local NearestFarmWait = false;
local AreaFarmWait = false;
local SelectedArea;
local Areas = {"All"}

--speeeeeed
local FarmingSpeed = 2;

-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions


function getTeleports()
    local Teleports = {}

    for _,v in pairs(WS["__MAP"].Teleports:GetChildren()) do
            table.insert(Teleports, v.Name)    
    end
    return Teleports
end

function GetThePets()
    local returntable = {}
    for i,v in pairs(Player.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
        if v.ClassName == "TextButton" and v.Equipped.Visible then
            table.insert(returntable, v.Name)
        end
    end
    return returntable
end

function FarmCoin(CoinID, PetID)
    Remotes["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
    Remotes["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
end

function GetEggs()
    local EggsTable = {}

    for _,v in pairs(RS.Game.Eggs:GetDescendants()) do
        if v:IsA("ModuleScript") then
            table.insert(EggsTable, require(v).displayName)
        end
    end
    return EggsTable
end

function GetAreas()
    for _,v in pairs(RS.Game.Coins:GetDescendants()) do
        if v.ClassName == "Folder" and v.Name ~= "Spawn" and v.Name ~= "Fantasy" and v.Name ~= "Tech" and v.Name ~= "Other" and v.Name ~= "Axolotl" and v.Name ~= "Pixel" and v.Name ~= "Cat" then
            table.insert(Areas, v.Name)
        end
    end
end

spawn(function()
    while task.wait(.7) do
        if game:GetService("Workspace")["__THINGS"].Orbs:FindFirstChildOfClass("Part") and (NearestFarmWait or AreaFarmWait) then
            local TweenService = game:GetService("TweenService")

            for i,v in pairs(Things.Orbs:GetChildren()) do
                if v:IsA("Part") and v:FindFirstChild("Orb") then
                    v.Orb.Sunray:Destroy()
                    TweenService:Create(
                        v,
                        TweenInfo.new(.3, Enum.EasingStyle.Linear),
                        {CFrame = Player.Character.HumanoidRootPart.CFrame}
                    ):Play()
                end
            end
        end
    end
end)

GetAreas()

local getThePets = GetThePets()




--MainZ

Main:CreateDropdown("Select Area", Areas, function(ara)
    SelectedArea = ara
    print(SelectedArea)
end)

Main:CreateToggle("Auto Farm ", true, function()
    if AreaFarmWait == false then
        AreaFarmWait = true
        function AreaFarmCoin(CoinID, PetID)
            Remotes["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
            Remotes["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
            RS.Framework.Shared["2 | Network"]["update coin pets"]:Fire(CoinID, {[1] = PetID})
        end
                 
        function GetMyPets()
            local returntable = {}
            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                if v.ClassName == 'TextButton' and v.Equipped.Visible then
                    table.insert(returntable, v.Name)
                end
            end
            return returntable
        end
    
        function GetCoins()
            local returntable = {}
            local ListCoins = Remotes["get coins"]:InvokeServer({})[1]
            for i,v in pairs(ListCoins) do
                if SelectedArea == "All" or string.find(string.lower(v.a), string.lower(SelectedArea)) then
                    table.insert(returntable, i)
                end
            end
            return returntable
        end
    
        local cointhiny = GetCoins()
        local getpet = GetMyPets()
        for i = 1, #cointhiny do
            pcall(function() AreaFarmCoin(cointhiny[i], getpet[i%#getpet+1]) end)
        end
        task.wait(FarmingSpeed)
        AreaFarmWait = false
    end
end)



Main:CreateToggle("Auto Farm Nearest", true, function()
    if NearestFarmWait == false then
        NearestFarmWait = true
        local nearest
        local NearestOne = 300
        for _,v in pairs(Things.Coins:GetChildren()) do
            if (v.POS.Position - Player.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
                nearest = v
                NearestOne = (v.POS.Position - Player.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        local GottenCoin = nearest.Name
        for i = 1, #GottenCoin do
            --coroutine.wrap(function()
                FarmCoin(GottenCoin, getThePets[i%#getThePets+1])
            --end)()
        end
        task.wait(FarmingSpeed)
        NearestFarmWait = false
    end
end)


Main:CreateToggle(" Auto Collect Orbs", true, function()
 for _,v in pairs(game:GetService("Workspace")["__THINGS"].Orbs:GetChildren()) do
   WS.__THINGS.__REMOTES["claim orbs"]:FireServer({{v.Name}})
   end
end)


Main:CreateToggle("Auto Collect Lootbags", true, function()
    for _,v in pairs(game:GetService("Workspace")["__THINGS"].Lootbags:GetChildren()) do
        if (v:GetAttribute("ReadyForCollection")) then
            if not v:GetAttribute("Collected") then
                getsenv(Player.PlayerScripts.Scripts.Game.Lootbags).Collect(v)
                v.CFrame = Player.Character.HumanoidRootPart.CFrame
            end
        end
    end
end)



Main:CreateButton("Fake Lootbag", function()
    local ohString1 = "ce6e120a0c304567be950939b7a574c8"
    local ohTable2 = {
        ["type"] = "Best",
        ["claimed"] = false,
        ["position"] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
        ["world"] = "Fantasy",
        ["player"] = game:GetService("Players").LocalPlayer,
        ["reward"] = {
            [1] = "Coins",
            [2] = 5008984,
            [3] = "Fantasy Coins"
        }
    }
    game:GetService("ReplicatedStorage").Framework.Shared["2 | Network"]["spawn lootbag"]:Fire(ohString1, ohTable2)
end)






-- Teleport

Teleport:CreateDropdown("Teleports", getTeleports(), function(Teleports)
    SelectedTeleports = Teleports;
    print(SelectedTeleports)
end)

Teleport:CreateButton("Teleport", function()
    if SelectedTeleports then
        local TeleportCFrame = WS["__MAP"].Teleports[SelectedTeleports].CFrame
        Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
    end
end)





-- Eggs

Egg:CreateDropdown("Select Egg",GetEggs(), function(Eggs)
    SelectedEggs = Eggs
end)

Egg:CreateToggle("Auto Egg", true, function()
    if SelectedEggs then
        WS.__THINGS.__REMOTES["buy egg"]:InvokeServer({SelectedEggs,false,false})
	   end
	end)


Egg:CreateToggle("Auto Triple Egg", true, function()
		if SelectedEggs then
		WS.__THINGS.__REMOTES["buy egg"]:InvokeServer({SelectedEggs,true,false})
	end
end)



Egg:CreateToggle("Auto Equip Best", true, function()
	if EquipBestWait == false then
    	EquipBestWait = true
		workspace.__THINGS.__REMOTES["unequip all pets"]:InvokeServer({})
		workspace.__THINGS.__REMOTES["equip best pets"]:InvokeServer({})
		task.wait(EquipBestTime)
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


Misc:CreateButton("Redeem Codes", function()
    for _,v in pairs(Codes) do
        RS.EnterCode:FireServer(v)
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
