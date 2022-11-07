local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
local ui = library:CreateWindow("Tapping Simulator X")

local Main = ui:new("Main")
local Egg = ui:new("Eggs")
local Teleport = ui:new("Teleport")
local Misc = ui:new("Misc")

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer
local WS = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")
--Variables
local selectedRebirth;
local selectedEgg;
local SelectedTeleporters;
local EquipBestWait = 15;
local EquipBest = false;
-- Anti Afk
Player.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
end)

-- Functions


function getTeleporters()
    local Teleporters = {}

    for _,v in pairs(WS.Teleporters:GetChildren()) do
            table.insert(Teleporters, v.Name)    
    end
    return Teleporters
end

function getEggs()
    local Eggs = {}

    for _,v in pairs(WS.Eggs:GetChildren()) do
        table.insert(Eggs, v.Name)
    end
    return Eggs
end


function getRebirthButtons()
    local Rebirths = {}

    for _,v in pairs(Player.PlayerGui.Menus.Rebirth.Frame.List:GetChildren()) do
        if v:IsA("Frame") then 
            table.insert(Rebirths, v.Name)
        end
    end
    return Rebirths
end

function getClosestChest()
	local closest = math.huge
	local choice
	for _,v in pairs(WS.Chest:GetDescendants()) do
        if v:IsA("Model") then
            if v:FindFirstChild("PrimaryPart") then

                local dist = (Player.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).Magnitude
                if dist <= closest then
                    closest = dist
                    choice = v
                end
                Player.Character.HumanoidRootPart.CFrame = choice.Position

            end
        end
	end
end












--Main

--local l__Modules__6 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
--local u4 = require(l__Modules__6:WaitForChild("Events"));

--Main:CreateToggle("Auto Tap", true, function()
   -- u4.ClientCall("ClickEvent");
--end)

Main:CreateToggle("Auto Tap", true, function()
    RS.Remotes.Tap:FireServer()
end)


Main:CreateDropdown("Select Rebirth",getRebirthButtons(), function(rebirth)
    selectedRebirth = rebirth
end)



Main:CreateToggle("Auto Rebirth", true, function()
    if selectedRebirth then
		RS.Remotes.Rebirth:FireServer(tonumber(selectedRebirth))
    end
end)


-- Teleport

Teleport:CreateDropdown("Teleporters", getTeleporters(), function(Teleporters)
    SelectedTeleporters = Teleporters;
    print(SelectedTeleporters)
end)




Teleport:CreateButton("Teleport", function()
    if SelectedTeleporters then
        local TeleportCFrame = WS.Teleporters[SelectedTeleporters].CFrame
        Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
    end
end)

Teleport:CreateButton('Auto Collect Chest', function()
    getClosestChest()

    
end)


-- Eggs

Egg:CreateDropdown("Select Egg",getEggs(), function(Eggs)
    selectedEgg = Eggs
end)

Egg:CreateToggle("Auto Egg", true, function()
    if selectedEgg then
        RS.Remotes.BuyEgg:InvokeServer(selectedEgg,1)
    end
end)


Egg:CreateToggle("Auto Equip Best", true, function()
    if EquipBest == false then
        EquipBest = true
        RS.Remotes.UnequipAll:InvokeServer()
        RS.Remotes.EquipBest:InvokeServer("UIStrokeFixer")
        task.wait(EquipBestWait)
        EquipBest = false
    end
end)



-- Misc



Misc:CreateButton("Show/Hide FPS Counter", function()
	game:GetService("CoreGui")["UI V2"].FPStext.Visible = not game:GetService("CoreGui")["UI V2"].FPStext.Visible
	Ticking = not Ticking
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
