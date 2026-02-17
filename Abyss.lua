local Chloex = loadstring(game:HttpGet("https://raw.githubusercontent.com/Gato290/ui/refs/heads/main/ChloeX%20V2"))()

local GameData = {
	-- // Auto Shoot Fish, Safe Oxygen, Sell Fish

    Playersv1 = game:GetService("Players"),
    ReplicatedStoragev1 = game:GetService("ReplicatedStorage"),
    TweenServicev1 = game:GetService("TweenService"),

    Playerv1 = nil,
    Characterv1 = nil,

    AutoShootv1 = false,
    AutoSellv1 = false,
    AutoSafeZonev1 = false,
    SelectedFishv1 = {},
    CurrentTargetModelv1 = nil,

    SAFE_DISTANCEv1 = 1,
    COLLECT_DISTANCEv1 = 4,

    FishFolderv1 = nil,
    Fishv1 = {},

    CollectEventv1 = nil,
    StartCatchEventv1 = nil,
    SellEventv1 = nil,

    shootCooldownv1 = 0.001,
    catchCooldownv1 = 0.001,

    lastShootv1 = 0,
    lastCatchv1 = 0,

    -- // Oxygen
    isTweeningOxygenV1 = false,
    OxygenThresholdV1 = 20,

    -- // Auto Sell
    isSellingSellV1 = false,

    -- // Whitelist Safe Zone (isi nama zona yang boleh dikunjungi)
    WHITELIST_ZONESv1 = {
        ["The Forgotten Dome"] = true,
    },

	-- // Cast Mode

    Servicesv2 = {
        Playersv2 = game:GetService("Players"),
        ReplicatedStoragev2 = game:GetService("ReplicatedStorage"),
    },

    Playerv2 = nil,

    UIv2 = {
        Greenv2 = nil,
        Gradientv2 = nil,
    },

    AutoCastv2 = false,
    LoopThreadv2 = nil,
    CastModev2 = "Normal",

    Remotesv2 = {
        CancelMinigamev2 = nil,
    },

	--// Auto Respawn

    Servicesv3 = {
        ReplicatedStoragev3 = game:GetService("ReplicatedStorage"),
    },

    AutoRespawnv3 = false,

    Remotesv3 = {
        Respawnv3 = nil,
    },
}
local Window = Chloex:Window({
    Title = "Nexa | v0.0.0 |",
    Footer = "Premium",
    Content = "Abyss",
    Color = "Default",
    Version = 1.0,
    ["Tab Width"] = 120,
    Image = "70884221600423",
    Configname = "Nexa",
    Uitransparent = 0.20,
    ShowUser = true,
    Config = {
        AutoSave = true,
        AutoLoad = true, 
    }
})

local Tabs = {
    Home = Window:AddTab({
        Name = "Home",
        Icon = "lucide:house",
    }),

    Main = Window:AddTab({
        Name = "Main",
        Icon = "lucide:swords",
    }),
}

local Sec = {}

Sec.Home1 = Tabs.Home:AddSection({
    Title = "Update Log",
    Open = false
})

Sec.Home1:AddParagraph({
    Title = "Whats New?",
    Content = [[
[+] Added Shoot Fish
[+] Added Cast Mode (Normal, Fast)
[+] Added Auto Respawn
	]]
})


Sec.Main1 = Tabs.Main:AddSection({
    Title = "Fish Farm",
    Open = false
})

-- // Auto Shoot Fish
GGameData.Playerv1 = GameData.Playersv1.LocalPlayer
GameData.Characterv1 = GameData.Playerv1.Character or GameData.Playerv1.CharacterAdded:Wait()

GameData.Playerv1.CharacterAdded:Connect(function(char)
    GameData.Characterv1 = char
end)

-- Fish Folder
GameData.FishFolderv1 = GameData.ReplicatedStoragev1:WaitForChild("common")
    :WaitForChild("assets")
    :WaitForChild("fish")

for _, fish in ipairs(GameData.FishFolderv1:GetChildren()) do
    table.insert(GameData.Fishv1, fish.Name)
end

-- Remotes
GameData.CollectEventv1 = GameData.ReplicatedStoragev1:WaitForChild("common")
    :WaitForChild("packages")
    :WaitForChild("Knit")
    :WaitForChild("Services")
    :WaitForChild("FishService")
    :WaitForChild("RF")
    :WaitForChild("CollectFish")

GameData.StartCatchEventv1 = GameData.ReplicatedStoragev1:WaitForChild("common")
    :WaitForChild("packages")
    :WaitForChild("Knit")
    :WaitForChild("Services")
    :WaitForChild("HarpoonService")
    :WaitForChild("RF")
    :WaitForChild("StartCatching")

GameData.SellEventv1 = GameData.ReplicatedStoragev1:WaitForChild("common")
    :WaitForChild("packages")
    :WaitForChild("Knit")
    :WaitForChild("Services")
    :WaitForChild("SellService")
    :WaitForChild("RF")
    :WaitForChild("SellInventory")

-- GUI Labels
local oxygenLabel = GameData.Playerv1.PlayerGui
    :WaitForChild("Main")
    :WaitForChild("Oxygen")
    :WaitForChild("CanvasGroup")
    :WaitForChild("Oxygen")

local weightGui = GameData.Playerv1.PlayerGui.Main.Oxygen.RightStats.Frame.Weight
local maxLabel = weightGui.Max
local wghtLabel = weightGui.Wght

-- ============================================================
-- FUNCTIONS
-- ============================================================

function GameData:IsDeadv1(model)
    if not model or not model.Parent then return true end
    local head = model:FindFirstChild("Head")
    if not head then return true end
    local stats = head:FindFirstChild("stats")
    if not stats then return true end
    local health = stats:FindFirstChild("Health")
    if not health then return true end
    local amount = health:FindFirstChild("Amount")
    if not amount then return true end

    local current = amount.Text:match("^(%d+)/")
    return current and tonumber(current) == 0
end

function GameData:IsSelectedFishv1(model)
    if #self.SelectedFishv1 == 0 then return false end

    local head = model:FindFirstChild("Head")
    if not head then return false end
    local stats = head:FindFirstChild("stats")
    if not stats then return false end
    local fish = stats:FindFirstChild("Fish")
    if not fish then return false end

    for _, name in ipairs(self.SelectedFishv1) do
        if fish.Text == name then
            return true
        end
    end

    return false
end

function GameData:GetNearestTargetv1()
    if not self.Characterv1 or not self.Characterv1:FindFirstChild("HumanoidRootPart") then
        return nil
    end

    local nearest
    local shortestDistance = math.huge
    local origin = self.Characterv1.HumanoidRootPart.Position

    for _, model in pairs(workspace.Game.Fish.client:GetChildren()) do
        if model:IsA("Model") and self:IsSelectedFishv1(model) then
            local torso = model:FindFirstChild("UpperTorso")
            if torso then
                local distance = (torso.Position - origin).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    nearest = model
                end
            end
        end
    end

    return nearest
end

function GameData:TweenToPositionv1(position)
    if not self.Characterv1 then return end
    local hrp = self.Characterv1:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    self.TweenServicev1:Create(
        hrp,
        TweenInfo.new(0.4, Enum.EasingStyle.Linear),
        {CFrame = CFrame.new(position)}
    ):Play()
end

function GameData:TweenToSafeDistancev1(model)
    if not self.Characterv1 then return end
    local hrp = self.Characterv1:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local torso = model:FindFirstChild("UpperTorso")
    if not torso then return end

    local direction = (hrp.Position - torso.Position).Unit
    local safePosition = torso.Position + (direction * self.SAFE_DISTANCEv1)

    self.TweenServicev1:Create(
        hrp,
        TweenInfo.new(0.4, Enum.EasingStyle.Linear),
        {CFrame = CFrame.new(safePosition, torso.Position)}
    ):Play()
end

-- // Cari zona aman terdekat (pakai WHITELIST)
function GameData:GetNearestSafeZonev1()
    if not self.Characterv1 then return nil, nil end
    local hrp = self.Characterv1:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil, nil end

    local nearestZone = nil
    local nearestPart = nil
    local shortestDistance = math.huge

    for _, zone in pairs(workspace.Game.Regions.Locations:GetChildren()) do
        if zone:GetAttribute("breathable") and self.WHITELIST_ZONESv1[zone.Name] then
            for _, part in ipairs(zone:GetDescendants()) do
                if part:IsA("BasePart") then
                    local distance = (hrp.Position - part.Position).Magnitude
                    if distance < shortestDistance then
                        shortestDistance = distance
                        nearestZone = zone
                        nearestPart = part
                    end
                end
            end
        end
    end

    return nearestZone, nearestPart
end

-- // Tween ke safe zone (dipakai oleh oxygen maupun auto sell)
function GameData:TweenToSafeZoneAndWaitV1()
    local hrp = self.Characterv1 and self.Characterv1:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    local zone, part = self:GetNearestSafeZonev1()
    if not zone then
        warn("Zona aman tidak ditemukan / tidak ada zona di whitelist")
        return false
    end

    local targetPosition = part.Position + Vector3.new(0, 5, 0)
    hrp.Anchored = true

    local tween = self.TweenServicev1:Create(
        hrp,
        TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {CFrame = CFrame.new(targetPosition)}
    )

    tween:Play()
    tween.Completed:Wait()

    -- ✅ Diam di safe zone selama 2 detik sebelum lanjut
    task.wait(2)

    hrp.Anchored = false
    return true, zone.Name
end

-- // Oxygen: Tween ke zona aman, reset target ikan
function GameData:TweenToSafeZoneOxygenV1()
    if self.isTweeningOxygenV1 then return end
    self.isTweeningOxygenV1 = true

    self.CurrentTargetModelv1 = nil

    local success, zoneName = self:TweenToSafeZoneAndWaitV1()
    if success then
        print("Auto ke zona aman (oxygen):", zoneName)
    end

    self.isTweeningOxygenV1 = false
end

-- // Auto Sell: Tween ke safe zone lalu invoke sell remote
function GameData:AutoSellV1()
    if self.isSellingSellV1 then return end
    self.isSellingSellV1 = true

    self.CurrentTargetModelv1 = nil

    local success, zoneName = self:TweenToSafeZoneAndWaitV1()
    if success then
        print("Sampai zona aman, mulai sell...", zoneName)
        task.wait(0.3)
        pcall(function()
            GameData.SellEventv1:InvokeServer()
        end)
        print("Sell inventory berhasil dipanggil!")
    end

    self.isSellingSellV1 = false
end

-- ============================================================
-- LOOPS
-- ============================================================

-- // Loop Oxygen Check
task.spawn(function()
    while task.wait(1) do
        if not GameData.AutoSafeZonev1 then continue end
        local oxygenValue = tonumber(oxygenLabel.Text)
        if oxygenValue and oxygenValue <= GameData.OxygenThresholdV1 then
            GameData:TweenToSafeZoneOxygenV1()
        end
    end
end)

-- // Loop Weight / Auto Sell Check
task.spawn(function()
    while task.wait(1) do
        if not GameData.AutoSellv1 then continue end
        if GameData.isSellingSellV1 then continue end

        local maxText = tonumber(maxLabel.Text:match("%d+"))
        local wghtText = tonumber(wghtLabel.Text:match("%d+"))

        if maxText and wghtText then
            if wghtText >= maxText then
                print("Wght mencapai Max (" .. wghtText .. "/" .. maxText .. "), auto sell dimulai!")
                GameData:AutoSellV1()
            end
        end
    end
end)

-- // Loop Auto Shoot Fish
task.spawn(function()
    while task.wait(0.05) do

        if GameData.isTweeningOxygenV1 or GameData.isSellingSellV1 then continue end

        if not GameData.AutoShootv1 then
            GameData.CurrentTargetModelv1 = nil
            continue
        end

        if not GameData.Characterv1 then continue end
        local hrp = GameData.Characterv1:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end

        local tool = GameData.Characterv1:FindFirstChildOfClass("Tool")
        if not tool then continue end

        local event = tool:FindFirstChild("Event")
        if not event then continue end

        if not GameData.CurrentTargetModelv1 or not GameData.CurrentTargetModelv1.Parent then
            GameData.CurrentTargetModelv1 = GameData:GetNearestTargetv1()
        end

        if not GameData.CurrentTargetModelv1 then continue end

        local torso = GameData.CurrentTargetModelv1:FindFirstChild("UpperTorso")
        if not torso then
            GameData.CurrentTargetModelv1 = nil
            continue
        end

        local distance = (hrp.Position - torso.Position).Magnitude
        local currentTime = tick()

        if GameData:IsDeadv1(GameData.CurrentTargetModelv1) then
            if distance > GameData.COLLECT_DISTANCEv1 then
                GameData:TweenToPositionv1(torso.Position)
            else
                pcall(function()
                    GameData.CollectEventv1:InvokeServer(GameData.CurrentTargetModelv1.Name)
                end)

                GameData.CurrentTargetModelv1 = nil
                task.wait(0.2)
            end
        else
            GameData:TweenToSafeDistancev1(GameData.CurrentTargetModelv1)

            local origin = hrp.Position
            local targetPos = torso.Position
            local direction = (targetPos - origin).Unit

            if currentTime - GameData.lastShootv1 >= GameData.shootCooldownv1 then
                event:FireServer("use", targetPos, direction)
                GameData.lastShootv1 = currentTime
            end

            if currentTime - GameData.lastCatchv1 >= GameData.catchCooldownv1 then
                pcall(function()
                    GameData.StartCatchEventv1:InvokeServer(GameData.CurrentTargetModelv1.Name)
                end)
                GameData.lastCatchv1 = currentTime
            end
        end
    end
end)

-- ============================================================
-- UI
-- ============================================================

Sec.Main1:AddDropdown({
    Title = "Fish List",
    Content = "Select Fish (Multi)",
    Options = GameData.Fishv1,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.SelectedFishv1 = selectedTable
    end
})

Sec.Main1:AddToggle({
    Title = "Auto Shoot Fish",
    Default = false,
    Callback = function(value)
        GameData.AutoShootv1 = value
    end
})

Sec.Main1:AddInput({
    Title = "Safe Oxygen",
    Content = "Enter Safe Oxygen...",
    Default = tostring(GameData.OxygenThresholdV1),
    Callback = function(value)
        local num = tonumber(value)
        if num then
            GameData.OxygenThresholdV1 = num
        end
    end
})

Sec.Main1:AddToggle({
    Title = "Auto Safe Zone",
    Default = false,
    Callback = function(value)
        GameData.AutoSafeZonev1 = value
    end
})

Sec.Main1:AddToggle({
    Title = "Auto Sell Fish",
    Default = false,
    Callback = function(value)
        GameData.AutoSellv1 = value
    end
})

-- // Auto Respawn
GameData.Remotesv3.Respawnv3 = GameData.Servicesv3.ReplicatedStoragev3
    .common.packages.Knit.Services.MovementService.RF.Respawn

Sec.Main1:AddToggle({
    Title = "Auto Respawn",
    Default = false,
    Callback = function(v)
        GameData.AutoRespawnv3 = v
    end
})

task.spawn(function()
    while true do
        if GameData.AutoRespawnv3 then
            GameData.Remotesv3.Respawnv3:InvokeServer("free")
        end
        task.wait(1)
    end
end)

Sec.Main1:AddSubSection("Cast Mode")

-- // Cast Mode
GameData.Playerv2 = GameData.Servicesv2.Playersv2.LocalPlayer

GameData.UIv2.Greenv2 = GameData.Playerv2.PlayerGui.Main
    .CatchingBar.Frame.Bar.Catch.Green

GameData.UIv2.Gradientv2 = GameData.Playerv2.PlayerGui.Main
    .CatchingBar.Frame.Bar.Catch.Gradient

GameData.Remotesv2.CancelMinigamev2 = GameData.Servicesv2.ReplicatedStoragev2
    :WaitForChild("common")
    :WaitForChild("packages")
    :WaitForChild("Knit")
    :WaitForChild("Services")
    :WaitForChild("MinigameService")
    :WaitForChild("RF")
    :WaitForChild("CancelMinigame")

Sec.Main1:AddToggle({
    Title = "Auto Cast",
    Default = false,
    Callback = function(value)
        GameData.AutoCastv2 = value

        if value then
            if not GameData.LoopThreadv2 then
                GameData.LoopThreadv2 = task.spawn(function()
                    while GameData.AutoCastv2 do

                        if GameData.UIv2.Greenv2 and GameData.UIv2.Gradientv2 then
                            GameData.UIv2.Greenv2.Size = GameData.UIv2.Gradientv2.Size
                        end

                        if GameData.CastModev2 == "Fast" then
                            GameData.Remotesv2.CancelMinigamev2:InvokeServer()
                        end

                        task.wait(0.001)
                    end

                    GameData.LoopThreadv2 = nil
                end)
            end
        else
            GameData.AutoCastv2 = false
        end
    end
})

Sec.Main1:AddDropdown({
    Title = "Select Cast Mode",
    Content = "Choose fishing cast behavior",
    Options = {"Normal", "Fast"},
    Multi = false,
    Default = "Normal",
    Callback = function(value)
        GameData.CastModev2 = value
    end
})

