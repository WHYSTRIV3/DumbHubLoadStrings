local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("Anime Hero Simulator")

local Main = ui:new("Auto Farm")
local Dungeon = ui:new("Time/Raid")
local Pods = ui:new("Pods")
local Teleport = ui:new("Teleport")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")

local SelectedWorld;
local SelectedTPWorld;
local SelectedPod;

local EvovleWait = 1;
local Evolved = false;

local TweenTeleport = 1;

local Codes = {"getrichquick", "moneyglitch", "sorry4wait", "feelinglucky", "Release", "bigbucks"}

-- Anti Afk
Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)

-- Functions

function getClosest(zone)
    local closest = math.huge
    local choice
    for _,v in pairs (WS.Enemies[zone]:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HP") and v.HP.Value > 0 then
            local dist = (Player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if dist <= closest then
                closest = dist
                choice = v
            end
        end
    end
   return choice
end

function getClosestDungeon()
    local closest = math.huge
    local choice
    for _,v in pairs (WS.TimeTrial.ActiveEnemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HP") and v.HP.Value > 0 then
            local dist = (Player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if dist <= closest then
                closest = dist
                choice = v
            end
        end
    end
   return choice
end

function getClosestDungeonChest()
    local closest = math.huge
    local choice
    for _,v in pairs (WS.Chests:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HP") and v.HP.Value > 0 then
            local dist = (Player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if dist <= closest then
                closest = dist
                choice = v
            end
        end
    end
   return choice
end

function getClosestRaid()
    local closest = math.huge
    local choice
    for _,v in pairs (WS.Raid.ActiveEnemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HP") and v.HP.Value > 0 then
            local dist = (Player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if dist <= closest then
                closest = dist
                choice = v
            end
        end
    end
   return choice
end

function getWorlds()
    local Worlds = {}

    for _,v in pairs(game:GetService("Workspace").Worlds:GetChildren()) do
        table.insert(Worlds, v.Name)
    end
    return Worlds
end

function getEggs()
    local Eggs = {}

    for _,v in pairs(WS.Eggs:GetChildren()) do
        table.insert(Eggs, v.Name)
    end
    return Eggs
end

function getSwordIcons()

end

function getSwordNames()
    local Swords = {}
    table.clear(Swords)
    for _,v in pairs(Player.PlayerGui.MainGui.Frames.Inventory.Main.ScrollList:GetChildren()) do
        table.insert(Swords, v.Name)
    end
    return getSwordNames()
end


-- Main
Main:CreateDropdown("World", getWorlds(), function(world)
    SelectedWorld = world;
    print(SelectedWorld)
end)

Main:CreateToggle("Kill Aura", true, function()
    if SelectedWorld then
        local mob = getClosest(SelectedWorld)
        --Player.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame
        game:GetService("ReplicatedStorage").Remotes.WeaponRemote:FireServer(mob)
    end
end)

Main:CreateToggle("Kill Aura (Teleport)", true, function()
    if SelectedWorld then
        local mob = getClosest(SelectedWorld)
        Player.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame
        game:GetService("ReplicatedStorage").Remotes.WeaponRemote:FireServer(mob)
    end
end)

Main:CreateToggle("Collect Coins", true, function()
    for _,v in pairs(game:GetService("Workspace").TemporaryAssets:GetChildren())do
        if v.Name == "Coin" then
            Player.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame
        end
        task.wait(0.005)
    end
end)

Main:CreateToggle("Auto Claim Upgrades", true, function()
    for i,v in pairs(Player.PlayerGui.MainGui.Frames.Upgrades.Main.ScrollList:GetChildren()) do
        if v:IsA("Frame") then
            if v.Main.Icon.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                local stringName = v.Name:gsub(".?$","");
                for _,numb in pairs({1,2,3,4,5,6,7,8,9}) do
                    RS.Remotes.ClaimUpgrade:FireServer(stringName, numb)
                end
            end
        end
    end
end)

Main:CreateSlider("Cooldown", {min = 1, max = 100, default = 1}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Main:CreateToggle("Auto Evolve Weapons", true, function()
    if Evolved == false then
        Evolved = true
        for _,v in pairs(Player.PlayerGui.MainGui.Frames.Inventory.Main.ScrollList:GetChildren())do
            RS.Remotes.WeaponEvolve:FireServer(v.Name)
        end
        wait(EvovleWait)
        Evolved = false
    end
end)

Main:CreateToggle("Auto Daily Spin", true, function()
    if Player.PlayerGui.MainGui.Frames.DailySpin.Button.Main.SpinName.Text == "Daily Free" then
        RS.Remotes.DailySpin:InvokeServer()
    end
end)

--Dungeon
local joinWait = false
Dungeon:CreateToggle("Auto Join Dungeon", true, function()
    if WS.TimeTrial.InProgress.Board.Enabled == false and joinWait == false then
        joinWait = true
        RS.Remotes.RequestTeleport:InvokeServer("trial", "Dungeon")
        task.wait(1)
        joinWait = false
    end
end)

Dungeon:CreateToggle("Kill Aura Mobs (Teleport)", true, function()
    local mob = getClosestDungeon()
    --Player.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10)
    local TweenService = game:GetService("TweenService")
    if mob:FindFirstChild("Head") then
        TweenService:Create(
        Player.Character.HumanoidRootPart,
        TweenInfo.new(0, Enum.EasingStyle.Linear),
        {CFrame = mob.HumanoidRootPart.CFrame}
        ):Play()
    end
    game:GetService("ReplicatedStorage").Remotes.WeaponRemote:FireServer(mob)
end)

Dungeon:CreateToggle("Kill Aura Chests (Teleport)", true, function()
    local mob = getClosestDungeonChest()
    --Player.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,0,15)
    local TweenService = game:GetService("TweenService")
    if mob:FindFirstChild("HumanoidRootPart") then
        TweenService:Create(
        Player.Character.HumanoidRootPart,
        TweenInfo.new(0, Enum.EasingStyle.Linear),
        {CFrame = mob.HumanoidRootPart.CFrame}
        ):Play()
    end
    game:GetService("ReplicatedStorage").Remotes.WeaponRemote:FireServer(mob)
end)

Dungeon:CreateToggle("Auto Progress Trial", true, function()
    game:GetService("ReplicatedStorage").Remotes.ProgressTrial:FireServer()
end)

Dungeon:CreateLabel("------------------------Raid------------------------")

Dungeon:CreateToggle("Auto Join Raid", true, function()
    game:GetService("ReplicatedStorage").Remotes.JoinRaid:InvokeServer()
end)

Dungeon:CreateToggle("Kill Aura Raid Boss (Teleport)", true, function()
    local mob = getClosestRaid()
    Player.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10)
    game:GetService("ReplicatedStorage").Remotes.WeaponRemote:FireServer(mob)
end)


--Pods/Pets

Pods:CreateDropdown("Pod", getEggs(), function(egg)
    SelectedPod = egg;
    print(SelectedPod)
end)

Pods:CreateToggle("Auto Egg(Single)", true, function()
    if SelectedPod then
        RS.Remotes.OpenEgg:InvokeServer(SelectedPod, false, false)
    end
end)

Pods:CreateToggle("Auto Egg(Triple)", true, function()
    if SelectedPod then
        RS.Remotes.OpenEgg:InvokeServer(SelectedPod, true, false)
    end
end)


--Teleport

Teleport:CreateDropdown("World", getWorlds(), function(world)
    SelectedTPWorld = world;
    print(SelectedTPWorld)
end)

Teleport:CreateButton("Teleport", function()
    if SelectedTPWorld then
        local TeleportCFrame = WS.Worlds[SelectedTPWorld].Spawn.CFrame
        local Time = 1
        local tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = TeleportCFrame})
        tween:Play()
        tween.Completed:Wait()
    end
end)



-- Misc

Misc:CreateButton("Redeem Codes", function()
    for _,v in pairs(Codes) do
        RS.Remotes.RedeemCode:InvokeServer(v)
    end
end)

Misc:CreateSlider("WalkSpeed", {min = 16, max = 200, default = 16}, function(state)
    Player.Character.Humanoid.WalkSpeed = state
end)

Misc:CreateButton("Copy Discord Invite", function()
    setclipboard("https://discord.gg/8zzP4fXNFz")
end)

local TeleportService = game:GetService("TeleportService")

Misc:CreateButton("Uninject", function()
    game:GetService("CoreGui")["UI V2"]:Destroy()
end)

Misc:CreateButton("Uninject and Rejoin", function()
    game:GetService("CoreGui")["UI V2"]:Destroy()
    TeleportService:Teleport(game.PlaceId)
end)
