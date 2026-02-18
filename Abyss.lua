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
    SelectedMutationsv1 = {},
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

    isTweeningOxygenV1 = false,
    OxygenThresholdV1 = 20,
    oxygenLabelV1 = nil,

    isSellingSellV1 = false,
    SellModev1 = "Sell Delay",
    SellDelayv1 = 30,
    lastSellTimev1 = 0,

    weightGuiV1 = nil,
    maxLabelV1 = nil,
    wghtLabelV1 = nil,

    cancelSafeZoneTweenV1 = false,
    activeSafeZoneTweenV1 = nil,

    WHITELIST_ZONESv1 = {
        ["The Forgotten Dome"] = true,
    },

    TweenSpeedToFishV1     = 0.4,
    TweenSpeedToSafeDistV1 = 0.4,
    TweenSpeedToSafeZoneV1 = 2.0,

    MutationsFolderv1 = nil,
    MutationNamesv1   = {},

    FishPresetsFolderv1  = nil,
    FishRarityMapv1      = {},
    RarityNamesv1        = {},
    SelectedRaritiesv1   = {},

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

	-- // Auto Equip Guns

    Servicesv4 = {
        ReplicatedStoragev4 = game:GetService("ReplicatedStorage"),
        Workspacev4 = workspace
    },

    Remotesv4 = {},
    AutoEquipv4 = false,
    Connectionsv4 = {}
}
local Window = Chloex:Window({
    Title = "Nexa | v1.0.0 |",
    Footer = "Beta",
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
[/] Fixed Equip Guns
	]]
})

Sec.Main1 = Tabs.Main:AddSection({
    Title = "LocalPlayer",
    Open = false
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

Sec.Main2 = Tabs.Main:AddSection({
    Title = "Fish Farm",
    Open = false
})

-- // Auto Shoot Fish

GameData.Playerv1 = GameData.Playersv1.LocalPlayer
GameData.Characterv1 = GameData.Playerv1.Character or GameData.Playerv1.CharacterAdded:Wait()

GameData.Playerv1.CharacterAdded:Connect(function(char)
    GameData.Characterv1 = char
end)

GameData.FishFolderv1 = GameData.ReplicatedStoragev1
    :WaitForChild("common")
    :WaitForChild("assets")
    :WaitForChild("fish")

for _, fish in ipairs(GameData.FishFolderv1:GetChildren()) do
    table.insert(GameData.Fishv1, fish.Name)
end

GameData.MutationsFolderv1 = GameData.ReplicatedStoragev1
    :WaitForChild("common")
    :WaitForChild("presets")
    :WaitForChild("fish")
    :WaitForChild("mutations")

for _, mutation in ipairs(GameData.MutationsFolderv1:GetChildren()) do
    table.insert(GameData.MutationNamesv1, mutation.Name)
end
table.sort(GameData.MutationNamesv1)

GameData.FishPresetsFolderv1 = GameData.ReplicatedStoragev1
    :WaitForChild("common")
    :WaitForChild("presets")
    :WaitForChild("items")
    :WaitForChild("fish")

local raritySet = {}
for _, folder in ipairs(GameData.FishPresetsFolderv1:GetChildren()) do
    if folder:IsA("Folder") then
        for _, module in ipairs(folder:GetChildren()) do
            if module:IsA("ModuleScript") then
                local success, data = pcall(require, module)
                if success and type(data) == "table" and data.rarity then
                    GameData.FishRarityMapv1[module.Name] = tostring(data.rarity)
                    raritySet[tostring(data.rarity)] = true
                end
            end
        end
    end
end
for rarityName in pairs(raritySet) do
    table.insert(GameData.RarityNamesv1, rarityName)
end
table.sort(GameData.RarityNamesv1)

GameData.CollectEventv1 = GameData.ReplicatedStoragev1
    :WaitForChild("common")
    :WaitForChild("packages")
    :WaitForChild("Knit")
    :WaitForChild("Services")
    :WaitForChild("FishService")
    :WaitForChild("RF")
    :WaitForChild("CollectFish")

GameData.StartCatchEventv1 = GameData.ReplicatedStoragev1
    :WaitForChild("common")
    :WaitForChild("packages")
    :WaitForChild("Knit")
    :WaitForChild("Services")
    :WaitForChild("HarpoonService")
    :WaitForChild("RF")
    :WaitForChild("StartCatching")

GameData.SellEventv1 = GameData.ReplicatedStoragev1
    :WaitForChild("common")
    :WaitForChild("packages")
    :WaitForChild("Knit")
    :WaitForChild("Services")
    :WaitForChild("SellService")
    :WaitForChild("RF")
    :WaitForChild("SellInventory")

GameData.oxygenLabelV1 = GameData.Playerv1.PlayerGui
    :WaitForChild("Main")
    :WaitForChild("Oxygen")
    :WaitForChild("CanvasGroup")
    :WaitForChild("Oxygen")

GameData.weightGuiV1 = GameData.Playerv1.PlayerGui.Main.Oxygen.RightStats.Frame.Weight
GameData.maxLabelV1  = GameData.weightGuiV1.Max
GameData.wghtLabelV1 = GameData.weightGuiV1.Wght

function GameData:IsInSafeZoneV1()
    local character = self.Characterv1
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return false, nil
    end

    local pos = character.HumanoidRootPart.Position

    for _, zone in pairs(workspace.Game.Regions.Locations:GetChildren()) do
        if zone:GetAttribute("breathable") then
            for _, part in ipairs(zone:GetDescendants()) do
                if part:IsA("BasePart") then
                    local relative = part.CFrame:PointToObjectSpace(pos)
                    local size = part.Size / 2
                    if math.abs(relative.X) <= size.X and
                       math.abs(relative.Y) <= size.Y and
                       math.abs(relative.Z) <= size.Z then
                        return true, zone.Name
                    end
                end
            end
        end
    end

    return false, nil
end

function GameData:WaitUntilInSafeZoneV1(timeout)
    timeout = timeout or 30
    local elapsed = 0

    while elapsed < timeout do
        local inZone, zoneName = self:IsInSafeZoneV1()
        if inZone then
            return true, zoneName
        end
        task.wait(0.2)
        elapsed = elapsed + 0.2

        if self.cancelSafeZoneTweenV1 then
            return false, nil
        end
    end

    return false, nil
end

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
    local hasFishFilter     = #self.SelectedFishv1 > 0
    local hasMutationFilter = #self.SelectedMutationsv1 > 0
    local hasRarityFilter   = #self.SelectedRaritiesv1 > 0

    if not hasFishFilter and not hasMutationFilter and not hasRarityFilter then return false end

    local head = model:FindFirstChild("Head")
    if not head then return false end
    local stats = head:FindFirstChild("stats")
    if not stats then return false end

    local fishPart = stats:FindFirstChild("Fish")
    local fishName = fishPart and fishPart.Text or nil

    local mutationPart = stats:FindFirstChild("Mutation")
    local labelPart    = mutationPart and mutationPart:FindFirstChild("Label")
    local mutationName = labelPart and labelPart.Text or nil

    local fishRarity = fishName and self.FishRarityMapv1[fishName] or nil

    local fishMatch = false
    if hasFishFilter and fishName then
        for _, name in ipairs(self.SelectedFishv1) do
            if fishName == name then fishMatch = true break end
        end
    end

    local mutationMatch = false
    if hasMutationFilter and mutationName then
        for _, name in ipairs(self.SelectedMutationsv1) do
            if mutationName == name then mutationMatch = true break end
        end
    end

    local rarityMatch = false
    if hasRarityFilter and fishRarity then
        for _, name in ipairs(self.SelectedRaritiesv1) do
            if fishRarity == name then rarityMatch = true break end
        end
    end

    if hasFishFilter and fishMatch then
        return true
    end

    if hasMutationFilter and hasRarityFilter then
        return mutationMatch and rarityMatch
    end

    if hasMutationFilter then
        return mutationMatch
    end

    if hasRarityFilter then
        return rarityMatch
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
        TweenInfo.new(self.TweenSpeedToFishV1, Enum.EasingStyle.Linear),
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
        TweenInfo.new(self.TweenSpeedToSafeDistV1, Enum.EasingStyle.Linear),
        {CFrame = CFrame.new(safePosition, torso.Position)}
    ):Play()
end

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

function GameData:TweenToSafeZoneAndWaitV1()
    local hrp = self.Characterv1 and self.Characterv1:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    local zone, part = self:GetNearestSafeZonev1()
    if not zone then
        warn("Zona aman tidak ditemukan / tidak ada zona di whitelist")
        return false
    end

    local targetPosition = part.Position + Vector3.new(0, 5, 0)

    self.cancelSafeZoneTweenV1 = false

    local tween = self.TweenServicev1:Create(
        hrp,
        TweenInfo.new(self.TweenSpeedToSafeZoneV1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {CFrame = CFrame.new(targetPosition)}
    )

    self.activeSafeZoneTweenV1 = tween
    tween:Play()
    tween.Completed:Wait()

    if self.cancelSafeZoneTweenV1 then
        self.activeSafeZoneTweenV1 = nil
        return false
    end

    self.activeSafeZoneTweenV1 = nil

    local success, zoneName = self:WaitUntilInSafeZoneV1(30)
    if success then
        return true, zoneName
    else
        warn("Timeout: Karakter tidak terdeteksi masuk zona aman")
        return false
    end
end

function GameData:CancelSafeZoneTweenV1()
    self.cancelSafeZoneTweenV1 = true
    if self.activeSafeZoneTweenV1 then
        self.activeSafeZoneTweenV1:Cancel()
        self.activeSafeZoneTweenV1 = nil
    end

    self.isTweeningOxygenV1 = false
    self.isSellingSellV1 = false
end

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

function GameData:AutoSellV1()
    if self.isSellingSellV1 then return end
    self.isSellingSellV1 = true

    self.CurrentTargetModelv1 = nil

    local tweenSuccess, zoneName = self:TweenToSafeZoneAndWaitV1()

    if not tweenSuccess then
        warn("Gagal sampai zona aman, sell dibatalkan")
        self.isSellingSellV1 = false
        return
    end

    print("Tween selesai, verifikasi posisi di zona aman...")
    local inZone, confirmedZone = self:WaitUntilInSafeZoneV1(10)

    if inZone then
        print("Terverifikasi di zona aman:", confirmedZone, "— mulai sell!")
        task.wait(0.3)
        pcall(function()
            GameData.SellEventv1:InvokeServer()
        end)
        print("Sell inventory berhasil dipanggil!")
    else
        warn("Karakter tidak terdeteksi di zona aman setelah tween, sell dibatalkan")
    end

    self.isSellingSellV1 = false
end

task.spawn(function()
    while task.wait(1) do
        if not GameData.AutoSafeZonev1 then continue end
        local oxygenValue = tonumber(GameData.oxygenLabelV1.Text)
        if oxygenValue and oxygenValue <= GameData.OxygenThresholdV1 then
            GameData:TweenToSafeZoneOxygenV1()
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if not GameData.AutoSellv1 then continue end
        if GameData.isSellingSellV1 then continue end

        local currentTime = tick()

        if GameData.SellModev1 == "Sell Delay" then
            if currentTime - GameData.lastSellTimev1 >= GameData.SellDelayv1 then
                print("Sell Delay tercapai (" .. GameData.SellDelayv1 .. "s), auto sell dimulai!")
                GameData.lastSellTimev1 = currentTime
                GameData:AutoSellV1()
            end

        elseif GameData.SellModev1 == "Backpack Full" then
            local maxText  = tonumber(GameData.maxLabelV1.Text:match("%d+"))
            local wghtText = tonumber(GameData.wghtLabelV1.Text:match("%d+"))

            if maxText and wghtText then
                if wghtText >= maxText then
                    print("Backpack Full (" .. wghtText .. "/" .. maxText .. "), auto sell dimulai!")
                    GameData:AutoSellV1()
                end
            end
        end
    end
end)

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

        local distance    = (hrp.Position - torso.Position).Magnitude
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

            local origin    = hrp.Position
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


Sec.Main2:AddSubSection("SHOOT FISH")

Sec.Main2:AddInput({
    Title = "Tween Speed",
    Content = "Set Tween Speed",
    Default = tostring(GameData.TweenSpeedToFishV1),
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            GameData.TweenSpeedToFishV1 = num
        end
    end
})

Sec.Main2:AddDropdown({
    Title = "Fish List",
    Content = "Select Fish (Multi)",
    Options = GameData.Fishv1,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.SelectedFishv1 = selectedTable
    end
})

Sec.Main2:AddDropdown({
    Title = "Mutation List",
    Content = "Select Mutation (Multi)",
    Options = GameData.MutationNamesv1,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.SelectedMutationsv1 = selectedTable
    end
})

Sec.Main2:AddDropdown({
    Title = "Rarity List",
    Content = "Select Rarity (Multi)",
    Options = GameData.RarityNamesv1,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.SelectedRaritiesv1 = selectedTable
    end
})

Sec.Main2:AddToggle({
    Title = "Auto Shoot Fish",
    Default = false,
    Callback = function(value)
        GameData.AutoShootv1 = value
    end
})

-- // Equip Guns

GameData.Remotesv4.BackpackRFv4 = GameData.Servicesv4.ReplicatedStoragev4
    :WaitForChild("common")
    :WaitForChild("packages")
    :WaitForChild("Knit")
    :WaitForChild("Services")
    :WaitForChild("BackpackService")
    :WaitForChild("RF")

function GameData:StartAutoEquipv4()
    task.spawn(function()
        while self.AutoEquipv4 do

            local debris = self.Servicesv4.Workspacev4:FindFirstChild("debris")
            local advanced = debris and debris:FindFirstChild("Advanced")

            if not (advanced and advanced:IsA("Model")) then
                local args = {"1"}

                self.Remotesv4.BackpackRFv4
                    :WaitForChild("Equip")
                    :InvokeServer(unpack(args))
            end

            task.wait(1)
        end
    end)
end

function GameData:StopAutoEquipv4()
    self.AutoEquipv4 = false

    local args = {"1"}

    self.Remotesv4.BackpackRFv4
        :WaitForChild("Unequip")
        :InvokeServer(unpack(args))
end


Sec.Main2:AddToggle({
    Title = "Auto Equip Gun",
    Default = false,
    Callback = function(value)
        GameData.AutoEquipv4 = value

        if value then
            Chloex:MakeNotify({
                Title = "Auto Equip",
                Description = "Enabled",
                Content = "Gun has been equip!",
                Color = Color3.fromRGB(0,255,0),
                Time = 0.5,
                Delay = 3
            })

            GameData:StartAutoEquipv4()

        else
            Chloex:MakeNotify({
                Title = "Auto Equip",
                Description = "Disabled",
                Content = "Gun has been unequipped!",
                Color = Color3.fromRGB(255,0,0),
                Time = 0.5,
                Delay = 3
            })

            GameData:StopAutoEquipv4()
        end
    end
})

Sec.Main2:AddSubSection("SAFE ZONE SETTINGS")

Sec.Main2:AddInput({
    Title = "Oxygen Threshold",
    Content = "Enter Safe Oxygen...",
    Default = tostring(GameData.OxygenThresholdV1),
    Callback = function(value)
        local num = tonumber(value)
        if num then
            GameData.OxygenThresholdV1 = num
        end
    end
})

Sec.Main2:AddToggle({
    Title = "Auto Safe Zone",
    Default = false,
    Callback = function(value)
        GameData.AutoSafeZonev1 = value
        if not value then
            GameData:CancelSafeZoneTweenV1()
        end
    end
})

Sec.Main2:AddSubSection("SELL MODE SETTINGS")

Sec.Main2:AddDropdown({
    Title = "Select Mode Sell",
    Content = "Select Sell Trigger Mode",
    Options = {
        "Sell Delay",
        "Backpack Full",
    },
    Multi = false,
    Default = "Sell Delay",
    Callback = function(value)
        GameData.SellModev1 = value
    end
})

Sec.Main2:AddInput({
    Title = "Sell Delay (detik)",
    Content = "Automatic sell interval (only for Sell Delay mode)",
    Default = tostring(GameData.SellDelayv1),
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            GameData.SellDelayv1 = num
        end
    end
})

Sec.Main2:AddToggle({
    Title = "Auto Sell Fish",
    Default = false,
    Callback = function(value)
        GameData.AutoSellv1 = value
        if not value then
            GameData:CancelSafeZoneTweenV1()
        end
    end
})


Sec.Main2:AddSubSection("CAST MODE SETTINGS")

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

Sec.Main2:AddToggle({
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

                        if GameData.CastModev2 == "Blatant" then
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

Sec.Main2:AddDropdown({
    Title = "Select Cast Mode",
    Content = "Choose fishing cast behavior",
    Options = {"Normal", "Blatant"},
    Multi = false,
    Default = "Normal",
    Callback = function(value)
        GameData.CastModev2 = value
    end
})
