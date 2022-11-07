local library = loadstring(game:HttpGet("https://gitlab.com/Ner0ox/versus/-/raw/main/ui/UIV2.lua", true))()
    local ui = library:CreateWindow("Clicking Gods")
    
    local Main = ui:new("Main")
    local Egg = ui:new("Eggs")
    local Teleport = ui:new("Teleport")
    local Misc = ui:new("Misc")
    
    local VU = game:GetService("VirtualUser")
    local Player = game:GetService("Players").LocalPlayer
    local WS = game:GetService("Workspace")
    local RS = game:GetService("ReplicatedStorage")
    --Variables
    local selectedEgg;
    local SelectedTeleport;
    local selectedRebirth;
    local Codes = {"Release", "Alien", "500Likes", "3kLikes", "BeastPet349", "BeastPet491", "BeastPet550"}
    
    
    -- Anti Afk
    Player.Idled:Connect(function()
        VU:Button2Down(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
        wait(1)
        VU:Button2Up(Vector2.new(0, 0), WS.CurrentCamera.CFrame)
    end)
    
    
    
    
    
    
    --functions
    
    function getRebirthButtons()
        local Rebirths = {}
    
        for _,v in pairs(Player.PlayerGui.Main.MainFrame.RebirthFrame.ScrollingFrame:GetChildren()) do
            if v:IsA("Frame") then 
                table.insert(Rebirths, v.Name)
            end
        end
        return Rebirths
    end
    
    
    function getEggs()
        local Eggs = {}
    
        for _,v in pairs(WS.Eggs:GetChildren()) do
            table.insert(Eggs, v.Name)
        end
        return Eggs
    end
    
    function getTeleport()
        local Teleport = {}
    
        for _,v in pairs(WS.Portal.Teleport:GetChildren()) do
                table.insert(Teleport, v.Name)    
        end
        return Teleport
    end
    
    
    --Main
    
    Main:CreateToggle("Auto Tap", true, function()
        WS.Events.AddClick:FireServer()
    end)
    
    Main:CreateDropdown("Select Rebirth",getRebirthButtons(), function(Rebirth)
        selectedRebirth = Rebirth
    end)
    
    Main:CreateToggle("Auto Rebirth", true, function()
        if selectedRebirth then
            player.PlayerGui.Main.MainFrame.Rebirths:FireServer(tonumber(selectedRebirth))
        end
    end)
    
    
    
    
    
    
    
    
    -- Teleport
    
    
    Teleport:CreateDropdown("Teleport", getTeleport(), function(Teleport)
        SelectedTeleport = Teleport;
        print(SelectedTeleport)
    end)
    
    Teleport:CreateButton("Teleport", function()
        if SelectedTeleport then
            local TeleportCFrame = WS.Portal.Teleport[SelectedTeleport].CFrame
            Player.Character.HumanoidRootPart.CFrame = TeleportCFrame
        end
    end)
    
    
    
    -- Eggs
    
    
    
    Egg:CreateDropdown("Select Egg",getEggs(), function(Eggs)
        selectedEgg = Eggs
    end)
    
    Egg:CreateToggle("Auto Egg", true, function()
        if selectedEgg then
            RS.RemoteEvents.EggOpened:InvokeServer(selectedEgg,'Single')
        end
    end)
    
    Egg:CreateToggle("Auto Triple Egg", true, function()
        if selectedEgg then
            RS.RemoteEvents.EggOpened:InvokeServer(selectedEgg,'Triple')
        end
    end)
    
    
    
    -- Misc
    
    
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
