local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Car Dealership Tycoon",
	LoadingTitle = "Rayfield Interface Suite",
	LoadingSubtitle = "by Sirius",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = false,
        	Invite = "sirius", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "Hello"
	}
})
repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
local Tab = Window:CreateTab("Updates", 4483362458) -- Title, Image
local Tab = Window:CreateTab("Game", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Fps")
local Button = Tab:CreateButton({
	Name = "Cap Fps To 10",
	Callback = function()
setfpscap(10)
	end,
})
local Button = Tab:CreateButton({
	Name = "Cap Fps To 20",
	Callback = function()
setfpscap(20)
	end,
})
local Button = Tab:CreateButton({
	Name = "Cap Fps To 30",
	Callback = function()
setfpscap(30)
	end,
})
local Button = Tab:CreateButton({
	Name = "Cap Fps To 60",
	Callback = function()
setfpscap(60)
	end,
})
local Button = Tab:CreateButton({
	Name = "Cap Fps To 120",
	Callback = function()
setfpscap(120)
	end,
})
local Button = Tab:CreateButton({
	Name = "Cap Fps To 240",
	Callback = function()
setfpscap(240)
	end,
})
local Section = Tab:CreateSection("Camera")
local Slider = Tab:CreateSlider({
	Name = "Camera Zoom",
	Range = {0, 10000},
	Increment = 1,
	Suffix = "Camera Zoom",
	CurrentValue = 70,
	Flag = "Camera Zoom", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
 game.Players.LocalPlayer.CameraMaxZoomDistance = Value 
	end,
})
local Slider = Tab:CreateSlider({
	Name = "Camera FOV",
	Range = {1, 120},
	Increment = 1,
	Suffix = "Camera FOV",
	CurrentValue = 70,
	Flag = "Camera FOV", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
 game.Workspace.Camera.FieldOfView = Value
	end,
})
local Tab = Window:CreateTab("Player", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Player")
local Slider = Tab:CreateSlider({
	Name = "Walk Speed",
	Range = {16, 500},
	Increment = 1,
	Suffix = "Walk Speed",
	CurrentValue = 16,
	Flag = "Walk Speed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})
local Slider = Tab:CreateSlider({
	Name = "Jump Power",
	Range = {50, 500},
	Increment = 1,
	Suffix = "Jump Power",
	CurrentValue = 50,
	Flag = "Jump Power", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end,
})
local Tab = Window:CreateTab("Farming", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Event Auto Races")
local Toggle = Tab:CreateToggle({
	Name = "Auto Christmas Race",
	CurrentValue = false,
	Flag = "Auto Christmas Race", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
if Value then
getgenv().Farm = true

local RaceLocation = Vector3.new(-2149.19897, 604.141235, 4077.59912, 0, -1, -0, -1, 0, -0, 0, 0, -1)

local check1 = Vector3.new(-2248.23584, 613.951416, 4471.0957, -1, 0, 0, 0, -1, 0, 0, 0, 1)

local check2 = Vector3.new(-2324.90527, 613.952209, 4919.6665, -0.707134247, -0, -0.707079291, 0, -1, 0, -0.707079291, 0, 0.707134247)

local check3 = Vector3.new(-2752.3147, 613.953735, 5105.5415, 0, 0, -1, 0, -1, -0, -1, 0, -0)

local check4 = Vector3.new(-3244.15479, 613.955078, 5024.40869, 0.642763317, 0, -0.766064942, 0, -1.00000048, -0, -0.766064942, 0, -0.642763734)

local check5 = Vector3.new(-3366.29077, 623.804749, 4502.98242, 0.996191859, 0, -0.0871884301, 0, -1, -0, -0.0871884301, 0, -0.996191859)

local check6 = Vector3.new(-3386.06982, 613.85376, 3758.72583, 1, 0, 0, 0, -1, 0, 0, 0, -1)

local check7 = Vector3.new(-3387.41772, 571.953308, 3456.82593, 1, 0, 0, 0, -1, 0, 0, 0, -1)

local check8 = Vector3.new(-3435.69653, 571.953247, 3240.37183, 0.573598742, 0, -0.81913656, 0, -1.00000048, -0, -0.81913656, 0, -0.573599219)

local check9 = Vector3.new(-3669.17773, 571.953735, 3085.44995, 0.819155693, 0, -0.573571265, 0, -1.00000024, -0, -0.573571265, 0, -0.819156051)

local check10 = Vector3.new(-3732.95459, 571.953857, 2897.69946, 0.965929627, 0, 0.258804798, 0, -1, 0, 0.258804798, 0, -0.965929747)

local check11 = Vector3.new(-3581.34961, 571.953125, 2714.98096, -0.0871315002, 0, 0.996196866, 0, -1, 0, 0.996196866, 0, 0.087131381)

local check12 = Vector3.new(-3387.96436, 571.952271, 2733.46777, -0.573599219, 0, 0.81913656, 0, -1.00000048, 0, 0.81913656, 0, 0.573598742)

local check13 = Vector3.new(-3285.68921, 571.952148, 2872.54248, -0.965929747, 0, 0.258804798, 0, -1, 0, 0.258804798, 0, 0.965929627)

local check14 = Vector3.new(-3130.6377, 571.952026, 3099.8623, -0.173624277, 0, 0.984811902, 0, -1, 0, 0.984811902, 0, 0.173624337)

local check15 = Vector3.new(-2894.52319, 571.951172, 3037.06592, 0.90629667, 0, 0.422642082, 0, -1, 0, 0.422642082, 0, -0.906296611)

local check16 = Vector3.new(-2763.93066, 571.9505, 2856.01831, 0.642763317, 0, 0.766064942, 0, -1.00000048, 0, 0.766064942, 0, -0.642763734)

local check17 = Vector3.new(-2554.81909, 571.949707, 2830.07104, -0.342042685, 0, 0.939684391, 0, -1, 0, 0.939684391, 0, 0.342042685)

local check18 = Vector3.new(-2413.54517, 571.949463, 2983.00708, -0.984812617, 0, 0.173621148, 0, -1, 0, 0.173621148, 0, 0.984812498)

local check19 = Vector3.new(-2373.17554, 571.949646, 3214.56494, -0.984812617, 0, 0.173621148, 0, -1, 0, 0.173621148, 0, 0.984812498)

local check20 = Vector3.new(-2270.03833, 613.850159, 3625.1709, -0.996191859, 0, 0.0871884301, 0, -1, 0, 0.0871884301, 0, 0.996191859)

local check21 = Vector3.new(-2251.05005, 606.974976, 4237.84961, 1, 0, 0, 0, 1, 0, 0, 0, 1)

local IsA = game.IsA
local function GetFromPlayerCar()
   for I,V in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
       if V.Name == "Owner" then
           if V.Value == game.Players.LocalPlayer.Name then
               return V.Parent.Parent
           end
       end
   end
   return "Not Find Car"
end

local function TpCar(Pos)
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if IsA(V,"BasePart") then
           if getgenv().Farm == true then
               local Tween = game:GetService("TweenService")
               Tween:create(V,TweenInfo.new(1),{CFrame = CFrame.new(Pos)}):Play()
           end
       end
   end
end


local function RaceFarm()
   for I,V in pairs(game:GetService("Workspace").Races.Xmas.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if game:GetService("Workspace").Races.Xmas.Script.RaceProgress.Value == true then
               if game:GetService("Workspace").Races.Xmas.GoalCheckpoint.IsActive.Value == true then
               TpCar(V.Parent.Parent.Parent:FindFirstChild("GoalCheckpoint").GoalCheckpoint.Position + Vector3.new(0,-50,0))
               elseif V.Value == true then
               TpCar(V.Parent:FindFirstChild("Checkpoint").Position + Vector3.new(0,-50,0))
               end
           end
       end
   end
end


local function StartRace()
   for I,V in pairs(game:GetService("Workspace").Races.Xmas.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if V.Value == true or game:GetService("Workspace").Races.Xmas.GoalCheckpoint.IsActive.Value == true then
               return true
           end
       end
   end
   return false
end


while getgenv().Farm == true do wait()
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if V.Name == "Engine" and IsA(V,"BasePart") then
           TpCar(RaceLocation)
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "Xmas"

workspace.Races.RaceHandler.StartLobby:FireServer(ohString1)

-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "5"
local ohString2 = "Vote"

workspace.Races.Xmas.Script.Vote:FireServer(ohString1, ohString2)

for I,V in pairs(GetFromPlayerCar():GetDescendants()) do 
       if V.Name == "Engine" and IsA(V,"BasePart") then 
           if StartRace() == true  then
           RaceFarm()
    wait(8)
	TpCar(check1)
	wait(1)
	TpCar(check2)
	wait(1)
	TpCar(check3)
	wait(1)
	TpCar(check4)
	wait(1)
	TpCar(check5)
	wait(1)
	TpCar(check6)
	wait(1)
	TpCar(check7)
	wait(1)
	TpCar(check8)
	wait(1)
	TpCar(check9)
	wait(1)
	TpCar(check10)
	wait(1)
	TpCar(check11)
	wait(1)
	TpCar(check12)
	wait(1)
	TpCar(check13)
	wait(1)
	TpCar(check14)
	wait(1)
	TpCar(check15)
	wait(1)
	TpCar(check16)
	wait(1)
	TpCar(check17)
	wait(1)
    TpCar(check18)
	wait(1)
	TpCar(check19)
	wait(1)
	TpCar(check20)
	wait(1)
	TpCar(check1)
	wait(1)
	TpCar(check2)
	wait(1)
	TpCar(check3)
	wait(1)
	TpCar(check4)
	wait(1)
	TpCar(check5)
	wait(1)
	TpCar(check6)
	wait(1)
	TpCar(check7)
	wait(1)
	TpCar(check8)
	wait(1)
	TpCar(check9)
	wait(1)
	TpCar(check10)
	wait(1)
	TpCar(check11)
	wait(1)
	TpCar(check12)
	wait(1)
	TpCar(check13)
	wait(1)
	TpCar(check14)
	wait(1)
	TpCar(check15)
	wait(1)
	TpCar(check16)
	wait(1)
	TpCar(check17)
	wait(1)
    TpCar(check18)
	wait(1)
	TpCar(check19)
	wait(1)
	TpCar(check20)
	wait(1)
	TpCar(check1)
	wait(1)
	TpCar(check2)
	wait(1)
	TpCar(check3)
	wait(1)
	TpCar(check4)
	wait(1)
	TpCar(check5)
	wait(1)
	TpCar(check6)
	wait(1)
	TpCar(check7)
	wait(1)
	TpCar(check8)
	wait(1)
	TpCar(check9)
	wait(1)
	TpCar(check10)
	wait(1)
	TpCar(check11)
	wait(1)
	TpCar(check12)
	wait(1)
	TpCar(check13)
	wait(1)
	TpCar(check14)
	wait(1)
	TpCar(check15)
	wait(1)
	TpCar(check16)
	wait(1)
	TpCar(check17)
	wait(1)
    TpCar(check18)
	wait(1)
	TpCar(check19)
	wait(1)
	TpCar(check20)
	wait(1)
	TpCar(check1)
	wait(1)
	TpCar(check2)
	wait(1)
	TpCar(check3)
	wait(1)
	TpCar(check4)
	wait(1)
	TpCar(check5)
	wait(1)
	TpCar(check6)
	wait(1)
	TpCar(check7)
	wait(1)
	TpCar(check8)
	wait(1)
	TpCar(check9)
	wait(1)
	TpCar(check10)
	wait(1)
	TpCar(check11)
	wait(1)
	TpCar(check12)
	wait(1)
	TpCar(check13)
	wait(1)
	TpCar(check14)
	wait(1)
	TpCar(check15)
	wait(1)
	TpCar(check16)
	wait(1)
	TpCar(check17)
	wait(1)
    TpCar(check18)
	wait(1)
	TpCar(check19)
	wait(1)
	TpCar(check20)
	wait(1)
	TpCar(check1)
	wait(1.4)
	TpCar(check2)
	wait(1.4)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
    TpCar(check18)
	wait(1.4)
	TpCar(check19)
	wait(1.4)
	TpCar(check20)
	wait(1.4)
    TpCar(check21)
	wait(2)

end
end
           end
       end
   end
end
else
getgenv().Farm = false

local RaceLocation = Vector3.new(-2149.19897, 604.141235, 4077.59912, 0, -1, -0, -1, 0, -0, 0, 0, -1)

local check1 = Vector3.new(-2248.23584, 613.951416, 4471.0957, -1, 0, 0, 0, -1, 0, 0, 0, 1)

local check2 = Vector3.new(-2324.90527, 613.952209, 4919.6665, -0.707134247, -0, -0.707079291, 0, -1, 0, -0.707079291, 0, 0.707134247)

local check3 = Vector3.new(-2752.3147, 613.953735, 5105.5415, 0, 0, -1, 0, -1, -0, -1, 0, -0)

local check4 = Vector3.new(-3244.15479, 613.955078, 5024.40869, 0.642763317, 0, -0.766064942, 0, -1.00000048, -0, -0.766064942, 0, -0.642763734)

local check5 = Vector3.new(-3366.29077, 623.804749, 4502.98242, 0.996191859, 0, -0.0871884301, 0, -1, -0, -0.0871884301, 0, -0.996191859)

local check6 = Vector3.new(-3386.06982, 613.85376, 3758.72583, 1, 0, 0, 0, -1, 0, 0, 0, -1)

local check7 = Vector3.new(-3387.41772, 571.953308, 3456.82593, 1, 0, 0, 0, -1, 0, 0, 0, -1)

local check8 = Vector3.new(-3435.69653, 571.953247, 3240.37183, 0.573598742, 0, -0.81913656, 0, -1.00000048, -0, -0.81913656, 0, -0.573599219)

local check9 = Vector3.new(-3669.17773, 571.953735, 3085.44995, 0.819155693, 0, -0.573571265, 0, -1.00000024, -0, -0.573571265, 0, -0.819156051)

local check10 = Vector3.new(-3732.95459, 571.953857, 2897.69946, 0.965929627, 0, 0.258804798, 0, -1, 0, 0.258804798, 0, -0.965929747)

local check11 = Vector3.new(-3581.34961, 571.953125, 2714.98096, -0.0871315002, 0, 0.996196866, 0, -1, 0, 0.996196866, 0, 0.087131381)

local check12 = Vector3.new(-3387.96436, 571.952271, 2733.46777, -0.573599219, 0, 0.81913656, 0, -1.00000048, 0, 0.81913656, 0, 0.573598742)

local check13 = Vector3.new(-3285.68921, 571.952148, 2872.54248, -0.965929747, 0, 0.258804798, 0, -1, 0, 0.258804798, 0, 0.965929627)

local check14 = Vector3.new(-3130.6377, 571.952026, 3099.8623, -0.173624277, 0, 0.984811902, 0, -1, 0, 0.984811902, 0, 0.173624337)

local check15 = Vector3.new(-2894.52319, 571.951172, 3037.06592, 0.90629667, 0, 0.422642082, 0, -1, 0, 0.422642082, 0, -0.906296611)

local check16 = Vector3.new(-2763.93066, 571.9505, 2856.01831, 0.642763317, 0, 0.766064942, 0, -1.00000048, 0, 0.766064942, 0, -0.642763734)

local check17 = Vector3.new(-2554.81909, 571.949707, 2830.07104, -0.342042685, 0, 0.939684391, 0, -1, 0, 0.939684391, 0, 0.342042685)

local check18 = Vector3.new(-2413.54517, 571.949463, 2983.00708, -0.984812617, 0, 0.173621148, 0, -1, 0, 0.173621148, 0, 0.984812498)

local check19 = Vector3.new(-2373.17554, 571.949646, 3214.56494, -0.984812617, 0, 0.173621148, 0, -1, 0, 0.173621148, 0, 0.984812498)

local check20 = Vector3.new(-2270.03833, 613.850159, 3625.1709, -0.996191859, 0, 0.0871884301, 0, -1, 0, 0.0871884301, 0, 0.996191859)

local check21 = Vector3.new(-2251.05005, 606.974976, 4237.84961, 1, 0, 0, 0, 1, 0, 0, 0, 1)

local IsA = game.IsA
local function GetFromPlayerCar()
   for I,V in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
       if V.Name == "Owner" then
           if V.Value == game.Players.LocalPlayer.Name then
               return V.Parent.Parent
           end
       end
   end
   return "Not Find Car"
end

local function TpCar(Pos)
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if IsA(V,"BasePart") then
           if getgenv().Farm == true then
               local Tween = game:GetService("TweenService")
               Tween:create(V,TweenInfo.new(1),{CFrame = CFrame.new(Pos)}):Play()
           end
       end
   end
end


local function RaceFarm()
   for I,V in pairs(game:GetService("Workspace").Races.Xmas.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if game:GetService("Workspace").Races.Xmas.Script.RaceProgress.Value == true then
               if game:GetService("Workspace").Races.Xmas.GoalCheckpoint.IsActive.Value == true then
               TpCar(V.Parent.Parent.Parent:FindFirstChild("GoalCheckpoint").GoalCheckpoint.Position + Vector3.new(0,-50,0))
               elseif V.Value == true then
               TpCar(V.Parent:FindFirstChild("Checkpoint").Position + Vector3.new(0,-50,0))
               end
           end
       end
   end
end


local function StartRace()
   for I,V in pairs(game:GetService("Workspace").Races.Xmas.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if V.Value == true or game:GetService("Workspace").Races.Xmas.GoalCheckpoint.IsActive.Value == true then
               return true
           end
       end
   end
   return false
end


while getgenv().Farm == true do wait()
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if V.Name == "Engine" and IsA(V,"BasePart") then
           TpCar(RaceLocation)
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "Xmas"

workspace.Races.RaceHandler.StartLobby:FireServer(ohString1)

-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "5"
local ohString2 = "Vote"

workspace.Races.Xmas.Script.Vote:FireServer(ohString1, ohString2)

for I,V in pairs(GetFromPlayerCar():GetDescendants()) do 
       if V.Name == "Engine" and IsA(V,"BasePart") then 
           if StartRace() == true  then
           RaceFarm()
    wait(8)
	TpCar(check1)
	wait(1)
	TpCar(check2)
	wait(1)
	TpCar(check3)
	wait(1)
	TpCar(check4)
	wait(1)
	TpCar(check5)
	wait(1)
	TpCar(check6)
	wait(1)
	TpCar(check7)
	wait(1)
	TpCar(check8)
	wait(1)
	TpCar(check9)
	wait(1)
	TpCar(check10)
	wait(1)
	TpCar(check11)
	wait(1)
	TpCar(check12)
	wait(1)
	TpCar(check13)
	wait(1)
	TpCar(check14)
	wait(1)
	TpCar(check15)
	wait(1)
	TpCar(check16)
	wait(1)
	TpCar(check17)
	wait(1)
    TpCar(check18)
	wait(1)
	TpCar(check19)
	wait(1)
	TpCar(check20)
	wait(1)
	TpCar(check1)
	wait(1)
	TpCar(check2)
	wait(1)
	TpCar(check3)
	wait(1)
	TpCar(check4)
	wait(1)
	TpCar(check5)
	wait(1)
	TpCar(check6)
	wait(1)
	TpCar(check7)
	wait(1)
	TpCar(check8)
	wait(1)
	TpCar(check9)
	wait(1)
	TpCar(check10)
	wait(1)
	TpCar(check11)
	wait(1)
	TpCar(check12)
	wait(1)
	TpCar(check13)
	wait(1)
	TpCar(check14)
	wait(1)
	TpCar(check15)
	wait(1)
	TpCar(check16)
	wait(1)
	TpCar(check17)
	wait(1)
    TpCar(check18)
	wait(1)
	TpCar(check19)
	wait(1)
	TpCar(check20)
	wait(1)
	TpCar(check1)
	wait(1)
	TpCar(check2)
	wait(1)
	TpCar(check3)
	wait(1)
	TpCar(check4)
	wait(1)
	TpCar(check5)
	wait(1)
	TpCar(check6)
	wait(1)
	TpCar(check7)
	wait(1)
	TpCar(check8)
	wait(1)
	TpCar(check9)
	wait(1)
	TpCar(check10)
	wait(1)
	TpCar(check11)
	wait(1)
	TpCar(check12)
	wait(1)
	TpCar(check13)
	wait(1)
	TpCar(check14)
	wait(1)
	TpCar(check15)
	wait(1)
	TpCar(check16)
	wait(1)
	TpCar(check17)
	wait(1)
    TpCar(check18)
	wait(1)
	TpCar(check19)
	wait(1)
	TpCar(check20)
	wait(1)
	TpCar(check1)
	wait(1)
	TpCar(check2)
	wait(1)
	TpCar(check3)
	wait(1)
	TpCar(check4)
	wait(1)
	TpCar(check5)
	wait(1)
	TpCar(check6)
	wait(1)
	TpCar(check7)
	wait(1)
	TpCar(check8)
	wait(1)
	TpCar(check9)
	wait(1)
	TpCar(check10)
	wait(1)
	TpCar(check11)
	wait(1)
	TpCar(check12)
	wait(1)
	TpCar(check13)
	wait(1)
	TpCar(check14)
	wait(1)
	TpCar(check15)
	wait(1)
	TpCar(check16)
	wait(1)
	TpCar(check17)
	wait(1)
    TpCar(check18)
	wait(1)
	TpCar(check19)
	wait(1)
	TpCar(check20)
	wait(1)
	TpCar(check1)
	wait(1.4)
	TpCar(check2)
	wait(1.4)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
    TpCar(check18)
	wait(1.4)
	TpCar(check19)
	wait(1.4)
	TpCar(check20)
	wait(1.4)
    TpCar(check21)
	wait(2)

end
end
           end
       end
   end
end
end
	end,
})
local Toggle = Tab:CreateToggle({
	Name = "Auto Ice Race",
	CurrentValue = false,
	Flag = "Auto Ice Race", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
if Value then
getgenv().Farm = true

local RaceLocation = Vector3.new(-854.070923, 590.520081, 818.21875, -4.26769257e-05, -0.906304121, 0.422626197, -1, 4.2617321e-05, -9.46223736e-06, -9.46223736e-06, -0.422626197, -0.906304121)

local check1 = Vector3.new(-843.614502, 602.992981, 1361.86609, -0.766061664, 0, 0.642767608, 0, -1.00000048, 0, 0.642767608, 0, 0.766061246)

local check2 = Vector3.new(-350.482361, 602.991699, 1451.21106, 0.996191859, 0, -0.0871884301, 0, -1, -0, -0.0871884301, 0, -0.996191859)

local check3 = Vector3.new(-355.732056, 608.216125, 1052.70203, -0.965929747, 0, -0.258804798, 0, 1, 0, 0.258804798, 0, -0.965929747)

local check4 = Vector3.new(67.5246887, 602.989502, 758.235229, 0.819155693, 0, -0.573571265, 0, -1.00000024, -0, -0.573571265, 0, -0.819156051)

local check5 = Vector3.new(-498.75592, 602.990967, 490.426788, -0.819156051, -0, -0.573571265, 0, -1.00000024, 0, -0.573571265, 0, 0.819155693)

local check6 = Vector3.new(-794.720825, 599.375, 988.132996, 0.90629667, -0, -0.422642082, 0, 1, -0, 0.422642082, 0, 0.90629667)

local IsA = game.IsA
local function GetFromPlayerCar()
   for I,V in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
       if V.Name == "Owner" then
           if V.Value == game.Players.LocalPlayer.Name then
               return V.Parent.Parent
           end
       end
   end
   return "Not Find Car"
end

local function TpCar(Pos)
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if IsA(V,"BasePart") then
           if getgenv().Farm == true then
               local Tween = game:GetService("TweenService")
               Tween:create(V,TweenInfo.new(1),{CFrame = CFrame.new(Pos)}):Play()
           end
       end
   end
end


local function RaceFarm()
   for I,V in pairs(game:GetService("Workspace").Races.Ice.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if game:GetService("Workspace").Races.Ice.Script.RaceProgress.Value == true then
               if game:GetService("Workspace").Races.Ice.GoalCheckpoint.IsActive.Value == true then
               TpCar(V.Parent.Parent.Parent:FindFirstChild("GoalCheckpoint").GoalCheckpoint.Position + Vector3.new(0,-50,0))
               elseif V.Value == true then
               TpCar(V.Parent:FindFirstChild("Checkpoint").Position + Vector3.new(0,-50,0))
               end
           end
       end
   end
end


local function StartRace()
   for I,V in pairs(game:GetService("Workspace").Races.Ice.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if V.Value == true or game:GetService("Workspace").Races.Ice.GoalCheckpoint.IsActive.Value == true then
               return true
           end
       end
   end
   return false
end


while getgenv().Farm == true do wait()
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if V.Name == "Engine" and IsA(V,"BasePart") then
           TpCar(RaceLocation)
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "Ice"

workspace.Races.RaceHandler.StartLobby:FireServer(ohString1)

-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "5"
local ohString2 = "Vote"

workspace.Races.Ice.Script.Vote:FireServer(ohString1, ohString2)

for I,V in pairs(GetFromPlayerCar():GetDescendants()) do 
       if V.Name == "Engine" and IsA(V,"BasePart") then 
           if StartRace() == true  then
           RaceFarm()
    wait(8)
	TpCar(check1)
	wait(4)
	TpCar(check2)
	wait(4)
	TpCar(check3)
	wait(4)
	TpCar(check4)
	wait(4)
	TpCar(check5)
	wait(4)
	TpCar(check1)
	wait(4)
	TpCar(check2)
	wait(4)
	TpCar(check3)
	wait(4)
	TpCar(check4)
	wait(4)
	TpCar(check5)
	wait(4)
	TpCar(check1)
	wait(4)
	TpCar(check2)
	wait(4)
	TpCar(check3)
	wait(4)
	TpCar(check4)
	wait(4)
	TpCar(check5)
	wait(4)
	TpCar(check1)
	wait(4)
	TpCar(check2)
	wait(4)
	TpCar(check3)
	wait(4)
	TpCar(check4)
	wait(4)
	TpCar(check5)
	wait(4)
	TpCar(check1)
	wait(2)
	TpCar(check2)
	wait(2)
	TpCar(check3)
	wait(2)
	TpCar(check4)
	wait(2)
	TpCar(check5)
	wait(2)
	TpCar(check1)
	wait(2)
	TpCar(check2)
	wait(2)
	TpCar(check3)
	wait(2)
	TpCar(check4)
	wait(2)
	TpCar(check5)
	wait(2)
	TpCar(check1)
	wait(2)
	TpCar(check2)
	wait(2)
	TpCar(check3)
	wait(2)
	TpCar(check4)
	wait(2)
	TpCar(check5)
	wait(2)
	TpCar(check1)
	wait(1.7)
	TpCar(check2)
	wait(1.7)
	TpCar(check3)
	wait(1.7)
	TpCar(check4)
	wait(1.7)
	TpCar(check5)
	wait(1.7)
	TpCar(check6)
	wait(2)
end
end
           end
       end
   end
end
else
getgenv().Farm = false

local RaceLocation = Vector3.new(-854.070923, 590.520081, 818.21875, -4.26769257e-05, -0.906304121, 0.422626197, -1, 4.2617321e-05, -9.46223736e-06, -9.46223736e-06, -0.422626197, -0.906304121)

local check1 = Vector3.new(-843.614502, 602.992981, 1361.86609, -0.766061664, 0, 0.642767608, 0, -1.00000048, 0, 0.642767608, 0, 0.766061246)

local check2 = Vector3.new(-350.482361, 602.991699, 1451.21106, 0.996191859, 0, -0.0871884301, 0, -1, -0, -0.0871884301, 0, -0.996191859)

local check3 = Vector3.new(-355.732056, 608.216125, 1052.70203, -0.965929747, 0, -0.258804798, 0, 1, 0, 0.258804798, 0, -0.965929747)

local check4 = Vector3.new(67.5246887, 602.989502, 758.235229, 0.819155693, 0, -0.573571265, 0, -1.00000024, -0, -0.573571265, 0, -0.819156051)

local check5 = Vector3.new(-498.75592, 602.990967, 490.426788, -0.819156051, -0, -0.573571265, 0, -1.00000024, 0, -0.573571265, 0, 0.819155693)

local check6 = Vector3.new(-794.720825, 599.375, 988.132996, 0.90629667, -0, -0.422642082, 0, 1, -0, 0.422642082, 0, 0.90629667)

local IsA = game.IsA
local function GetFromPlayerCar()
   for I,V in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
       if V.Name == "Owner" then
           if V.Value == game.Players.LocalPlayer.Name then
               return V.Parent.Parent
           end
       end
   end
   return "Not Find Car"
end

local function TpCar(Pos)
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if IsA(V,"BasePart") then
           if getgenv().Farm == true then
               local Tween = game:GetService("TweenService")
               Tween:create(V,TweenInfo.new(1),{CFrame = CFrame.new(Pos)}):Play()
           end
       end
   end
end


local function RaceFarm()
   for I,V in pairs(game:GetService("Workspace").Races.Ice.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if game:GetService("Workspace").Races.Ice.Script.RaceProgress.Value == true then
               if game:GetService("Workspace").Races.Ice.GoalCheckpoint.IsActive.Value == true then
               TpCar(V.Parent.Parent.Parent:FindFirstChild("GoalCheckpoint").GoalCheckpoint.Position + Vector3.new(0,-50,0))
               elseif V.Value == true then
               TpCar(V.Parent:FindFirstChild("Checkpoint").Position + Vector3.new(0,-50,0))
               end
           end
       end
   end
end


local function StartRace()
   for I,V in pairs(game:GetService("Workspace").Races.Ice.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if V.Value == true or game:GetService("Workspace").Races.Ice.GoalCheckpoint.IsActive.Value == true then
               return true
           end
       end
   end
   return false
end


while getgenv().Farm == true do wait()
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if V.Name == "Engine" and IsA(V,"BasePart") then
           TpCar(RaceLocation)
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "Ice"

workspace.Races.RaceHandler.StartLobby:FireServer(ohString1)

-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "5"
local ohString2 = "Vote"

workspace.Races.Ice.Script.Vote:FireServer(ohString1, ohString2)

for I,V in pairs(GetFromPlayerCar():GetDescendants()) do 
       if V.Name == "Engine" and IsA(V,"BasePart") then 
           if StartRace() == true  then
           RaceFarm()
    wait(8)
	TpCar(check1)
	wait(4)
	TpCar(check2)
	wait(4)
	TpCar(check3)
	wait(4)
	TpCar(check4)
	wait(4)
	TpCar(check5)
	wait(4)
	TpCar(check1)
	wait(4)
	TpCar(check2)
	wait(4)
	TpCar(check3)
	wait(4)
	TpCar(check4)
	wait(4)
	TpCar(check5)
	wait(4)
	TpCar(check1)
	wait(4)
	TpCar(check2)
	wait(4)
	TpCar(check3)
	wait(4)
	TpCar(check4)
	wait(4)
	TpCar(check5)
	wait(4)
	TpCar(check1)
	wait(4)
	TpCar(check2)
	wait(4)
	TpCar(check3)
	wait(4)
	TpCar(check4)
	wait(4)
	TpCar(check5)
	wait(4)
	TpCar(check1)
	wait(2)
	TpCar(check2)
	wait(2)
	TpCar(check3)
	wait(2)
	TpCar(check4)
	wait(2)
	TpCar(check5)
	wait(2)
	TpCar(check1)
	wait(2)
	TpCar(check2)
	wait(2)
	TpCar(check3)
	wait(2)
	TpCar(check4)
	wait(2)
	TpCar(check5)
	wait(2)
	TpCar(check1)
	wait(2)
	TpCar(check2)
	wait(2)
	TpCar(check3)
	wait(2)
	TpCar(check4)
	wait(2)
	TpCar(check5)
	wait(2)
	TpCar(check1)
	wait(1.7)
	TpCar(check2)
	wait(1.7)
	TpCar(check3)
	wait(1.7)
	TpCar(check4)
	wait(1.7)
	TpCar(check5)
	wait(1.7)
	TpCar(check6)
	wait(2)
end
end
           end
       end
   end
end
end
	end,
})
local Section = Tab:CreateSection("Non Event Auto Races")
local Toggle = Tab:CreateToggle({
	Name = "Auto Circuit Race",
	CurrentValue = false,
	Flag = "Auto Circuit Race", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
if Value then
getgenv().Farm = true

local RaceLocation = Vector3.new(1028.77893, 604.030396, 3290.41528, -4.76837158e-05, -0.996190667, 0.0872024298, -1, 4.76837158e-05, -2.08243728e-06, -2.08243728e-06, -0.0872024298, -0.996190667)

local check1 = Vector3.new(993.607788, 613.93927, 2834.5564, 0.984812498, 0, -0.173621148, 0, -1, -0, -0.173621148, 0, -0.984812617)

local check2 = Vector3.new(959.691528, 612.545654, 2321.07373, 0.342042685, 0, 0.939684391, 0, -1, 0, 0.939684391, 0, -0.342042685)

local check3 = Vector3.new(1218.95142, 612.545654, 2219.48096, 0.573598742, 0, -0.81913656, 0, -1.00000048, -0, -0.81913656, 0, -0.573599219)

local check4 = Vector3.new(972.210327, 612.545654, 2115.95557, 0.965929627, 0, 0.258804798, 0, -1, 0, 0.258804798, 0, -0.965929747)

local check5 = Vector3.new(1139.71387, 612.545654, 1662.82983, 0.766061246, 0, -0.642767608, 0, -1.00000048, -0, -0.642767608, 0, -0.766061664)

local check6 = Vector3.new(912.953247, 612.545654, 1703.40369, -0.984812617, -0, -0.173621148, 0, -1, 0, -0.173621148, 0, 0.984812498)

local check7 = Vector3.new(820.178833, 612.545654, 2183.95166, 0, 0, -1, 0, -1, -0, -1, 0, -0)

local check8 = Vector3.new(648.9505, 612.545654, 2070.87061, 0.342042685, 0, -0.939684391, 0, -1, -0, -0.939684391, 0, -0.342042685)

local check9 = Vector3.new(464.134003, 612.545654, 2088.44092, -0.939700961, -0, -0.341998369, 0, -1.00000048, 0, -0.341998369, 0, 0.939700544)

local check10 = Vector3.new(339.97934, 612.545654, 2479.58081, -0.707134247, 0, 0.707079291, 0, -1, 0, 0.707079291, 0, 0.707134247)

local check11 = Vector3.new(601.259277, 612.545654, 2768.18311, -0.996191859, -0, -0.0871884301, 0, -1, 0, -0.0871884301, 0, 0.996191859)

local check12 = Vector3.new(511.471558, 612.545654, 3057.80859, -0.906296611, -0, -0.422642082, 0, -1, 0, -0.422642082, 0, 0.90629667)

local check13 = Vector3.new(472.056824, 612.545654, 3414.33789, -0.866007447, 0, 0.500031412, 0, -1.00000024, 0, 0.500031412, 0, 0.866007268)

local check14 = Vector3.new(606.209167, 612.545654, 3813.88354, -0.996191859, -0, -0.0871884301, 0, -1, 0, -0.0871884301, 0, 0.996191859)

local check15 = Vector3.new(630.312378, 612.545654, 4231.8501, 0.642763317, 0, 0.766064942, 0, -1.00000048, 0, 0.766064942, 0, -0.642763734)

local check16 = Vector3.new(791.331482, 612.545654, 3915.24097, 0.573598742, 0, 0.81913656, 0, -1.00000048, 0, 0.81913656, 0, -0.573599219)

local check17 = Vector3.new(925.219055, 613.93927, 3614.23682, 0.996191859, 0, 0.0871884301, 0, -1, 0, 0.0871884301, 0, -0.996191859)

local check18 = Vector3.new(966.2005, 603.548218, 3005.2605, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)


local IsA = game.IsA
local function GetFromPlayerCar()
   for I,V in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
       if V.Name == "Owner" then
           if V.Value == game.Players.LocalPlayer.Name then
               return V.Parent.Parent
           end
       end
   end
   return "Not Find Car"
end

local function TpCar(Pos)
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if IsA(V,"BasePart") then
           if getgenv().Farm == true then
               local Tween = game:GetService("TweenService")
               Tween:create(V,TweenInfo.new(1),{CFrame = CFrame.new(Pos)}):Play()
           end
       end
   end
end


local function RaceFarm()
   for I,V in pairs(game:GetService("Workspace").Races.Race.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if game:GetService("Workspace").Races.Race.Script.RaceProgress.Value == true then
               if game:GetService("Workspace").Races.Race.GoalCheckpoint.IsActive.Value == true then
               TpCar(V.Parent.Parent.Parent:FindFirstChild("GoalCheckpoint").GoalCheckpoint.Position + Vector3.new(0,-50,0))
               elseif V.Value == true then
               TpCar(V.Parent:FindFirstChild("Checkpoint").Position + Vector3.new(0,-50,0))
               end
           end
       end
   end
end


local function StartRace()
   for I,V in pairs(game:GetService("Workspace").Races.Race.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if V.Value == true or game:GetService("Workspace").Races.Race.GoalCheckpoint.IsActive.Value == true then
               return true
           end
       end
   end
   return false
end


while getgenv().Farm == true do wait()
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if V.Name == "Engine" and IsA(V,"BasePart") then
           TpCar(RaceLocation)
local ohString1 = "Race"

workspace.Races.RaceHandler.StartLobby:FireServer(ohString1)

local ohString1 = "5"
local ohString2 = "Vote"

workspace.Races.Race.Script.Vote:FireServer(ohString1, ohString2)

for I,V in pairs(GetFromPlayerCar():GetDescendants()) do 
       if V.Name == "Engine" and IsA(V,"BasePart") then 
           if StartRace() == true  then
           RaceFarm()
    wait(8)
	TpCar(check1)
	wait(1)
	TpCar(check2)
	wait(1)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
	TpCar(check1)
	wait(1.4)
	TpCar(check2)
	wait(1.4)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
	TpCar(check1)
	wait(1.4)
	TpCar(check2)
	wait(1.4)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
	TpCar(check1)
	wait(1.4)
	TpCar(check2)
	wait(1.4)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
	TpCar(check1)
	wait(1.4)
	TpCar(check2)
	wait(1.4)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
    TpCar(check18)
	wait(2)
end
end
           end
       end
   end
end
else
getgenv().Farm = false

local RaceLocation = Vector3.new(1028.77893, 604.030396, 3290.41528, -4.76837158e-05, -0.996190667, 0.0872024298, -1, 4.76837158e-05, -2.08243728e-06, -2.08243728e-06, -0.0872024298, -0.996190667)

local check1 = Vector3.new(993.607788, 613.93927, 2834.5564, 0.984812498, 0, -0.173621148, 0, -1, -0, -0.173621148, 0, -0.984812617)

local check2 = Vector3.new(959.691528, 612.545654, 2321.07373, 0.342042685, 0, 0.939684391, 0, -1, 0, 0.939684391, 0, -0.342042685)

local check3 = Vector3.new(1218.95142, 612.545654, 2219.48096, 0.573598742, 0, -0.81913656, 0, -1.00000048, -0, -0.81913656, 0, -0.573599219)

local check4 = Vector3.new(972.210327, 612.545654, 2115.95557, 0.965929627, 0, 0.258804798, 0, -1, 0, 0.258804798, 0, -0.965929747)

local check5 = Vector3.new(1139.71387, 612.545654, 1662.82983, 0.766061246, 0, -0.642767608, 0, -1.00000048, -0, -0.642767608, 0, -0.766061664)

local check6 = Vector3.new(912.953247, 612.545654, 1703.40369, -0.984812617, -0, -0.173621148, 0, -1, 0, -0.173621148, 0, 0.984812498)

local check7 = Vector3.new(820.178833, 612.545654, 2183.95166, 0, 0, -1, 0, -1, -0, -1, 0, -0)

local check8 = Vector3.new(648.9505, 612.545654, 2070.87061, 0.342042685, 0, -0.939684391, 0, -1, -0, -0.939684391, 0, -0.342042685)

local check9 = Vector3.new(464.134003, 612.545654, 2088.44092, -0.939700961, -0, -0.341998369, 0, -1.00000048, 0, -0.341998369, 0, 0.939700544)

local check10 = Vector3.new(339.97934, 612.545654, 2479.58081, -0.707134247, 0, 0.707079291, 0, -1, 0, 0.707079291, 0, 0.707134247)

local check11 = Vector3.new(601.259277, 612.545654, 2768.18311, -0.996191859, -0, -0.0871884301, 0, -1, 0, -0.0871884301, 0, 0.996191859)

local check12 = Vector3.new(511.471558, 612.545654, 3057.80859, -0.906296611, -0, -0.422642082, 0, -1, 0, -0.422642082, 0, 0.90629667)

local check13 = Vector3.new(472.056824, 612.545654, 3414.33789, -0.866007447, 0, 0.500031412, 0, -1.00000024, 0, 0.500031412, 0, 0.866007268)

local check14 = Vector3.new(606.209167, 612.545654, 3813.88354, -0.996191859, -0, -0.0871884301, 0, -1, 0, -0.0871884301, 0, 0.996191859)

local check15 = Vector3.new(630.312378, 612.545654, 4231.8501, 0.642763317, 0, 0.766064942, 0, -1.00000048, 0, 0.766064942, 0, -0.642763734)

local check16 = Vector3.new(791.331482, 612.545654, 3915.24097, 0.573598742, 0, 0.81913656, 0, -1.00000048, 0, 0.81913656, 0, -0.573599219)

local check17 = Vector3.new(925.219055, 613.93927, 3614.23682, 0.996191859, 0, 0.0871884301, 0, -1, 0, 0.0871884301, 0, -0.996191859)

local check18 = Vector3.new(966.2005, 603.548218, 3005.2605, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)


local IsA = game.IsA
local function GetFromPlayerCar()
   for I,V in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
       if V.Name == "Owner" then
           if V.Value == game.Players.LocalPlayer.Name then
               return V.Parent.Parent
           end
       end
   end
   return "Not Find Car"
end

local function TpCar(Pos)
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if IsA(V,"BasePart") then
           if getgenv().Farm == true then
               local Tween = game:GetService("TweenService")
               Tween:create(V,TweenInfo.new(1),{CFrame = CFrame.new(Pos)}):Play()
           end
       end
   end
end


local function RaceFarm()
   for I,V in pairs(game:GetService("Workspace").Races.Race.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if game:GetService("Workspace").Races.Race.Script.RaceProgress.Value == true then
               if game:GetService("Workspace").Races.Race.GoalCheckpoint.IsActive.Value == true then
               TpCar(V.Parent.Parent.Parent:FindFirstChild("GoalCheckpoint").GoalCheckpoint.Position + Vector3.new(0,-50,0))
               elseif V.Value == true then
               TpCar(V.Parent:FindFirstChild("Checkpoint").Position + Vector3.new(0,-50,0))
               end
           end
       end
   end
end


local function StartRace()
   for I,V in pairs(game:GetService("Workspace").Races.Race.Checkpoints:GetDescendants()) do
       if V.Name == "IsActive" then
           if V.Value == true or game:GetService("Workspace").Races.Race.GoalCheckpoint.IsActive.Value == true then
               return true
           end
       end
   end
   return false
end


while getgenv().Farm == true do wait()
   for I,V in pairs(GetFromPlayerCar():GetDescendants()) do
       if V.Name == "Engine" and IsA(V,"BasePart") then
           TpCar(RaceLocation)
local ohString1 = "Race"

workspace.Races.RaceHandler.StartLobby:FireServer(ohString1)

local ohString1 = "5"
local ohString2 = "Vote"

workspace.Races.Race.Script.Vote:FireServer(ohString1, ohString2)

for I,V in pairs(GetFromPlayerCar():GetDescendants()) do 
       if V.Name == "Engine" and IsA(V,"BasePart") then 
           if StartRace() == true  then
           RaceFarm()
    wait(8)
	TpCar(check1)
	wait(1)
	TpCar(check2)
	wait(1)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
	TpCar(check1)
	wait(1.4)
	TpCar(check2)
	wait(1.4)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
	TpCar(check1)
	wait(1.4)
	TpCar(check2)
	wait(1.4)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
	TpCar(check1)
	wait(1.4)
	TpCar(check2)
	wait(1.4)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
	TpCar(check1)
	wait(1.4)
	TpCar(check2)
	wait(1.4)
	TpCar(check3)
	wait(1.4)
	TpCar(check4)
	wait(1.4)
	TpCar(check5)
	wait(1.4)
	TpCar(check6)
	wait(1.4)
	TpCar(check7)
	wait(1.4)
	TpCar(check8)
	wait(1.4)
	TpCar(check9)
	wait(1.4)
	TpCar(check10)
	wait(1.4)
	TpCar(check11)
	wait(1.4)
	TpCar(check12)
	wait(1.4)
	TpCar(check13)
	wait(1.4)
	TpCar(check14)
	wait(1.4)
	TpCar(check15)
	wait(1.4)
	TpCar(check16)
	wait(1.4)
	TpCar(check17)
	wait(1.4)
    TpCar(check18)
	wait(2)
end
end
           end
       end
   end
end end
	end,
})
local Tab = Window:CreateTab("Candy", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Auto Collect Free Candy")
local Toggle = Tab:CreateToggle({
	Name = "Auto Collect Free Candy",
	CurrentValue = false,
	Flag = "Auto Collect Free Candy", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
if Value then
getgenv().AutoFarm = true
while getgenv().AutoFarm == true do wait()
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohTable1 = {
	["Action"] = "ClaimCurrency",
	["AdName"] = "CandyEvent"
}

game:GetService("ReplicatedStorage").Remotes.AdTechEvent:FireServer(ohTable1)
end 
else
getgenv().AutoFarm = false
while getgenv().AutoFarm == true do wait()
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohTable1 = {
	["Action"] = "ClaimCurrency",
	["AdName"] = "CandyEvent"
}

game:GetService("ReplicatedStorage").Remotes.AdTechEvent:FireServer(ohTable1)
end end 
	end,
})
local Tab = Window:CreateTab("Event Cars", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Auto Buy Event Cars")
local Button = Tab:CreateButton({
	Name = "Buy Event Cars",
	Callback = function()
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "CandyEvent"
local ohString2 = "Car1"

game:GetService("ReplicatedStorage").Remotes.EventController.TryToPurchaseEventShopItem:FireServer(ohString1, ohString2)
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "CandyEvent"
local ohString2 = "Car2"

game:GetService("ReplicatedStorage").Remotes.EventController.TryToPurchaseEventShopItem:FireServer(ohString1, ohString2)
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "CandyEvent"
local ohString2 = "Car3"

game:GetService("ReplicatedStorage").Remotes.EventController.TryToPurchaseEventShopItem:FireServer(ohString1, ohString2)
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "CandyEvent"
local ohString2 = "Car4"

game:GetService("ReplicatedStorage").Remotes.EventController.TryToPurchaseEventShopItem:FireServer(ohString1, ohString2)
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "CandyEvent"
local ohString2 = "Car5"

game:GetService("ReplicatedStorage").Remotes.EventController.TryToPurchaseEventShopItem:FireServer(ohString1, ohString2)
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "CandyEvent"
local ohString2 = "Car6"

game:GetService("ReplicatedStorage").Remotes.EventController.TryToPurchaseEventShopItem:FireServer(ohString1, ohString2)
  		end,
})
local Tab = Window:CreateTab("Gui", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Gui")
local Button = Tab:CreateButton({
	Name = "Destroy Gui",
	Callback = function()
Rayfield:Destroy()
	end,
})
local Tab = Window:CreateTab("Credits", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Credits")
local Section = Tab:CreateSection("Script Developed By GOLDGAMER#9088")
