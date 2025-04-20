local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WHYSTRIV3/DumbHub/main/FATALITY.lua", true))()
local ui = Library:CreateWindow()



local Main = ui:new("Main")
local Egg = ui:new("Eggs")
local Give = ui:new("Give")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
local T = WS.Terrain
local LI = game:GetService("Lighting")
local Codes = {"UPDATE1"}

--Variables

local Saved;
local SelectedTeleport;
local SelectedRebirths;
local SelectedEggs;
local SelectedWorlds;
local SelectedEggs;

local Time;
local Timee;
local AutoWin = false
local autoTreasure = false

local AutoDelete = false
local SelectedPets = {}
-- Anti Afk

Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)






--functions

local GameWorlds = {
    "World1",
    "World2",
    "World3",
    "World4",
    "World5",
    "World6",
    "World7",
}


function getWorlds()
    local Worlds = {}

    for i,v in pairs(GameWorlds) do
        table.insert(Worlds, v)
    end
    return Worlds
end

function getEggs()
    local Eggs = {}

    for i,v in pairs(game:GetService("ReplicatedStorage").Pets:GetChildren()) do
        table.insert(Eggs, v.Name)
    end
    return Eggs
end

function getPets()
    local Pets = {}

    for i,v in pairs(game:GetService("ReplicatedStorage").Pets:GetDescendants()) do
        if v:IsA("MeshPart") then
            table.insert(Pets, v.Name)
        end
    end
    return Pets
end




--Main

Main:CreateDivider("Main")

Main:CreateDropdown("Selected Word", getWorlds(), function(Worlds)
    SelectedWorlds = Worlds
end)


Main:CreateSlider("Wait Time ", {min = 1, max = 120, default = 1}, function(state)
    Time = state
end)


Main:CreateToggle("Auto Win", false, function(toggle)
    AutoWin = toggle
    if toggle then
        spawn(function()
            while AutoWin do
                if SelectedWorlds then
                    for i, v in pairs(WS[SelectedWorlds]:GetDescendants()) do
                        if v.Name == "WinPart" then
                        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                        firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                         end
                     end
                    task.wait(0.5)
                end
            end
        end)
    end
end)



Main:CreateToggle("Auto Dig", true, function()
    game:GetService("ReplicatedStorage").Remotes.DigEvent:FireServer()
end)




Main:CreateToggle("Auto Collect Treasure", false, function(toggle)
    autoTreasure = toggle
    if toggle then
        task.spawn(function()
            while autoTreasure do
                for _, v in pairs(WS.Treasure:GetDescendants()) do
                    if v:IsA("ProximityPrompt") and v.Enabled then
                        fireproximityprompt(v, 5)
                    elseif v:IsA("BasePart") and v:FindFirstChild("TouchInterest") then
                        local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            firetouchinterest(v, hrp, 0)
                            firetouchinterest(v, hrp, 1)
                        end
                    end
                end
                task.wait(1) -- Run every second
            end
        end)
    end
end)


local AutoClaimQuest = false

Main:CreateToggle("Auto Claim Quest", false, function(toggle)
    AutoClaimQuest = toggle
    if toggle then
        task.spawn(function()
            while AutoClaimQuest do
                for _, v in pairs(Player.PlayerGui.MainGui.QuestsFrame.Frame:GetChildren()) do
                    if v:IsA("Frame") and v:FindFirstChild("ClaimFrame") then
                        local claimText = v.ClaimFrame:FindFirstChild("Claim")
                        if claimText and claimText:FindFirstChild("TextLabel") and claimText.TextLabel.Text == "Claim!" then
                            game:GetService("ReplicatedStorage").Remotes.ClaimQuestEvent:FireServer(v.Name)
                        end
                    end
                end
                task.wait(2) -- adjust the interval if needed
            end
        end)
    end
end)





--Egg


Egg:CreateDivider("Egg")


Egg:CreateDropdown("Selected Egg", getEggs(), function(Eggs)
    SelectedEggs = Eggs
end)

Egg:CreateToggle("Auto Egg", getEggs(), function()
    if SelectedEggs then
        game:GetService("ReplicatedStorage").PetRemotes.HatchServer:InvokeServer(unpack({[1] = workspace.World1.Prompts.Eggs[SelectedEggs]}))
    end
end)

Egg:CreateMultiDropdown("Select Pets", getPets(), function(Pets)
    SelectedPets = Pets
end)

Egg:CreateToggle("Delete Selected Pets", false, function(toggle)
    AutoDelete = toggle
    if toggle then
        task.spawn(function()
            while AutoDelete do
                for _, pet in pairs(game:GetService("Players").LocalPlayer.Pets:GetChildren()) do 
                    for _, selectedName in pairs(SelectedPets) do
                        if pet.Name == selectedName then
                            game:GetService("ReplicatedStorage").PetRemotes.DeletePet:FireServer(pet.Name)
                        end
                    end
                end
                task.wait(2)
            end
        end)
    end
end)




-- Teleport








--Give
Give:CreateDivider("Give")

Give:CreateLabel("Warning", "Warning!, there could be a risk isk!!")

local Rewards = {
    ["100 Gems"] = 1,
    ["2.5k Cash"] = 2,
    ["Give 1 Spins"] = 3,
    ["Give Random Mythical Pet"] = 4,
    ["250 Gems"] = 5,
    ["1k Cash"] = 6,
    ["Give 3 Spins"] = 7,
    ["Give Max Cash"] = 8,
    ["Give 10 Spins"] = 10
}


local RewardNames = {}
for name, _ in pairs(Rewards) do
    table.insert(RewardNames, name)
end


local SelectedReward = nil

Give:CreateDropdown("Select Give", RewardNames, function(selected)
    SelectedReward = Rewards[selected]
end)




Give:CreateToggle("Auto Give", false, function(toggle)
    AutoGive = toggle
    if toggle then
        task.spawn(function()
            while AutoGive do
                if SelectedReward then
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(SelectedReward)
                end
                task.wait(0.5)
            end
        end)
    end
end)



Give:CreateToggle("Auto Give Random Pet", true, function(toggle)
local args = {[1] = "Pet",[2] = 12}
game:GetService("ReplicatedStorage").Remotes.AddRewardEvent:FireServer(unpack(args))
end)

--[[
Give:CreateToggle("Auto Give 5M", true, function(toggle)

local args = {
    [1] = "Cash",
    [2] = 5000000
}

game:GetService("ReplicatedStorage").Remotes.AddRewardEvent:FireServer(unpack(args))

end)

--]]

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
