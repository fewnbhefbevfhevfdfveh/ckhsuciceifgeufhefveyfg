local Chloex = loadstring(game:HttpGet("https://raw.githubusercontent.com/Gato290/ui/refs/heads/main/main.lua"))()

local GameData = {

    -- // Auto Harvest

    Servicesv1 = {
        ReplicatedStoragev1 = game:GetService("ReplicatedStorage"),
        Playersv1 = game:GetService("Players")
    },

    Playerv1 = {
        LocalPlayerv1 = game:GetService("Players").LocalPlayer,
        Characterv1 = nil,
        Plotv1 = nil
    },

    Plantsv1 = {
        Modelsv1 = nil,
        MutationDatav1 = nil,
        WeatherDatav1 = nil,
        PlantDatav1 = nil,
        RarityDatav1 = nil,
        VariantFolderv1 = nil,

        PlantOptionsv1 = {},
        MutationOptionsv1 = {},
        VariantOptionsv1 = {},
        WeatherOptionsv1 = {},
        RarityOptionsv1 = {},

        SelectedPlantsv1 = {},
        SelectedMutationsv1 = {},
        SelectedVariantsv1 = {},
        SelectedWeathersv1 = {},
        SelectedRaritiesv1 = {},

        HarvestLoopv1 = nil
    },

    Worldv1 = {
        ClientPlantsv1 = workspace:WaitForChild("ClientPlants"),
        PlotsFolderv1 = workspace:WaitForChild("Plots")
    },

    Functionsv1 = {
        FindPlayerPlotv1 = nil,
        TeleportTov1 = nil,
        ShouldHarvestTargetv1 = nil,
        GetPlantBaseNamev1 = nil,
        IsPlantSelectedv1 = nil,
    },
    -- // Auto Buy Seed

    Servicesv2 = {
        ReplicatedStoragev2 = game:GetService("ReplicatedStorage"),
        PlayerServicev2 = game:GetService("Players")
    },

    SeedShopv2 = {
        Datav2 = nil,
        Eventv2 = nil,
        GetShopDatav2 = nil,
        PlantDefinitionsv2 = nil,

        SelectedSeedsv2 = {},
        SeedOptionsv2 = {},

        SelectedRaritiesv2 = {},
        RarityOptionsv2 = {},

        AutoBuyv2 = false
    },

    Plotv2 = {
        PlotsFolderv2 = workspace:WaitForChild("Plots"),
        PlayerPlotv2 = nil
    },

    Teleportv2 = {
        SeedsTeleportv2 = workspace.MapPhysical.Teleports.SeedsTeleport
    },

    Fnv2 = {
        FindPlayerPlot = nil,
        CheckSeedStock = nil,
        TeleportToShop = nil,
        TeleportToPlot = nil,
        GetSeedsByRarity = nil,
        ResolveSeedList = nil,
        StartAutoBuy = nil,
    },


    -- // Auto Buy Gear

    Servicesv3 = {
        ReplicatedStoragev3 = game:GetService("ReplicatedStorage"),
        PlayerServicev3 = game:GetService("Players")
    },

    GearShopv3 = {
        Datav3 = nil,
        Eventv3 = nil,
        GetShopDatav3 = nil,

        SelectedGearsv3 = {},
        GearOptionsv3 = {},

        AutoBuyv3 = false
    },

    Plotv3 = {
        PlotsFolderv3 = workspace:WaitForChild("Plots"),
        PlayerPlotv3 = nil
    },

    Teleportv3 = {
        GearNPCv3 = workspace.MapPhysical.Shops["Gear Shop"].GearNPC
    },

    -- // Auto Favorite

    Servicesv4 = {
        ReplicatedStoragev4 = game:GetService("ReplicatedStorage"),
        Playersv4 = game:GetService("Players")
    },

    FavoriteSystemv4 = {

        PlantsModelsv4 = nil,
        Playerv4 = nil,
        RemoteEventv4 = nil,

        MutationDatav4 = nil,

        PlantOptionsv4 = {},
        MutationOptionsv4 = {},

        SelectedPlantsv4 = {},
        SelectedMutationsv4 = {},

        AutoFavoriteEnabledv4 = false,
        AutoFavoriteLoopv4 = nil,

        AutoUnfavoriteEnabledv4 = false,
        AutoUnfavoriteLoopv4 = nil
    },

    -- // Info Stock Seed

    Servicesv5 = {
        ReplicatedStoragev5 = game:GetService("ReplicatedStorage")
    },

    SeedStockv5 = {
        RemoteEventsv5 = nil,
        GetShopDatav5 = nil,
        Paragraphv5 = nil
    },

    -- // Info Stock Gear

    Servicesv6 = {
        ReplicatedStoragev6 = game:GetService("ReplicatedStorage")
    },

    GearStockv6 = {
        RemoteEventsv6 = nil,
        GetShopDatav6 = nil,
        Paragraphv6 = nil
    },

    -- // Use Watering Can

    Servicesv7 = {
        ReplicatedStoragev7 = game:GetService("ReplicatedStorage"),
        Workspacev7 = game:GetService("Workspace")
    },

    AutoWaterv7 = {
        Eventv7 = nil,
        ModelsFolderv7 = nil,
        PlantNamesv7 = {},
        SelectedPlantv7 = nil,
        Enabledv7 = false
    },

    -- // Remove Plant

    Servicesv8 = {
        ReplicatedStoragev8 = game:GetService("ReplicatedStorage"),
        Workspacev8 = game:GetService("Workspace")
    },

    RemoveSystemv8 = {
        Eventv8 = nil,
        ModelsFolderv8 = nil,

        PlantNamesv8 = {},
        MutationDatav8 = nil,
        MutationNamesv8 = {},
        PlantDatav8 = nil,
        RarityDefinitionsv8 = nil,
        RarityListv8 = {},

        SelectedPlantv8 = "",
        SelectedModev8 = "Fruit",
        SelectedMutationsv8 = {},
        SelectedRaritiesv8 = {},
        MinFruitWeightv8 = nil,
        MaxFruitWeightv8 = nil,

        RemovedUuidsv8 = {},

        IsRunningv8 = false
    },

    -- // Auto Sell

    Playerv9 = game:GetService("Players").LocalPlayer,
    ReplicatedStoragev9 = game:GetService("ReplicatedStorage"),
    Backpackv9 = nil,
    Characterv9 = nil,

    SellEventv9 = nil,
    ModelsFolderv9 = nil,

    MutationDatav9 = nil,
    MutationNamesv9 = {},

    PlantDatav9 = nil,
    PlantRarityMapv9 = {},

    RarityDefinitionsv9 = nil,
    RarityListv9 = {},

    SelectedPlantsv9 = {},
    SelectedMutationsv9 = {},
    SelectedRaritiesv9 = {},
    AutoSellv9 = false,
    SellDelayv9 = 5,
    SellModev9 = "SellAll",

    PlantOptionsv9 = {},

    -- // Auto Plant

    ReplicatedStorage = game:GetService("ReplicatedStorage"),
    Players = game:GetService("Players"),

    SeedsFolder = nil,
    PlotsFolder = nil,

    Player = nil,

    PlantDelay = 0.01,
    TpDelay = 0.01,

    SeedNames = {},
    SelectedSeed = nil,
    IsPlanting = false,
    SelectedPlantMode = "Character Position",
}

local MarketplaceService = game:GetService("MarketplaceService")

local Window = Chloex:Window({
    Title = "Nexa | v0.0.1 |",
    Footer = "Premium",
    Content = MarketplaceService:GetProductInfo(game.PlaceId).Name,  -- otomatis isi nama game
    Color = "Default",
    Version = 1.0,
    ["Tab Width"] = 120,
    Image = "70884221600423",
    Configname = "Nexa",
    Uitransparent = 0.20,
    ShowUser = true,
    Search = true,  
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

    Backpack = Window:AddTab({
        Name = "Backpack",
        Icon = "lucide:backpack",
    }),

    Shop = Window:AddTab({
        Name = "Shop",
        Icon = "lucide:store",
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
[+] Added Auto Harvers
  [+] Dropdown Select Plant
  [+] Dropdown Select Rarity
  [+] Dropdown Select Mutations
  [+] Dropdown Select Variant
  [+] Dropdown Select Weather
[+] Added Watering Can
  [+] Dropdown Select Plant
[+] Added Remove Plant
  [+] Dropdown Select Mode (Fruit, Plant)
  [+] Dropdown Select Rarity
  [+] Dropdown Select Mutations
  [+] Input Min Fruit Weight
  [+] Input Max Fruit Weight
[+] Added Auto Plant
 [+] Dropdown Select Seed
 [+] Dropdown Select Plant Position
[+] Added Auto Favorite
  [+] Dropdown Select Seed
  [+] Dropdown Select Mutations
  [+] Toggle Unfavorite All
[+] Added Auto Sell
  [+] Dropdown Select Sell Mode (SellAll, Single Sell)
  [+] Dropdown Select Seed (Single Sell Only)
  [+] Dropdown Select Rarity (Single Sell Only)
  [+] Dropdown Select Mutations (Single Sell Only)
  [+] Input Sell Delay (SellAll only)
[+] Added Auto Buy Seed
  [+] Dropdown Select Rarity
  [+] Dropdown Select Seed
[+] Added Auto Buy Gear
	]]
})

Sec.Home1:AddParagraph({
    Title = "NexaHub Official Discord",
    Content = "Join the official NexaHub community to stay updated with the latest features, announcements, and exclusive news. Connect with other members and get direct support from our team!",
    Icon = "rbxassetid://94434236999817",
    ButtonText = "Copy Discord Link",
    ButtonCallback = function()
        setclipboard("discord.gg/ECxQFc97F5")
    end,
})

Sec.Main1 = Tabs.Main:AddSection({
    Title = "Harvest",
    Open = false
})

GameData.Plantsv1.Modelsv1 =
    GameData.Servicesv1.ReplicatedStoragev1.Plants.Models

GameData.Plantsv1.MutationDatav1 = require(
    GameData.Servicesv1.ReplicatedStoragev1
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("MutationDataDefinitions")
)

GameData.Plantsv1.WeatherDatav1 = require(
    GameData.Servicesv1.ReplicatedStoragev1
        :WaitForChild("Weather")
        :WaitForChild("WeatherDataDefinitions")
)

GameData.Plantsv1.PlantDatav1 = require(
    GameData.Servicesv1.ReplicatedStoragev1
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("PlantDataDefinitions")
)

GameData.Plantsv1.RarityDatav1 = require(
    GameData.Servicesv1.ReplicatedStoragev1
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("RarityDefinitions")
)

GameData.Plantsv1.VariantFolderv1 =
    GameData.Servicesv1.ReplicatedStoragev1:WaitForChild("VariantEffects")

-- Plant options
table.insert(GameData.Plantsv1.PlantOptionsv1, "All Plant")
for _, model in pairs(GameData.Plantsv1.Modelsv1:GetChildren()) do
    table.insert(GameData.Plantsv1.PlantOptionsv1, model.Name)
end

-- Mutation options
table.insert(GameData.Plantsv1.MutationOptionsv1, "All Mutations")
for name, _ in pairs(GameData.Plantsv1.MutationDatav1) do
    table.insert(GameData.Plantsv1.MutationOptionsv1, name)
end

-- Variant options
table.insert(GameData.Plantsv1.VariantOptionsv1, "All Variants")
for _, variant in pairs(GameData.Plantsv1.VariantFolderv1:GetChildren()) do
    table.insert(GameData.Plantsv1.VariantOptionsv1, variant.Name)
end
table.sort(GameData.Plantsv1.VariantOptionsv1)

-- Weather options
table.insert(GameData.Plantsv1.WeatherOptionsv1, "All Weather")
for _, data in pairs(GameData.Plantsv1.WeatherDatav1) do
    if type(data) == "table" and data.Name then
        table.insert(GameData.Plantsv1.WeatherOptionsv1, data.Name)
    end
end
table.sort(GameData.Plantsv1.WeatherOptionsv1)

-- Rarity options
table.insert(GameData.Plantsv1.RarityOptionsv1, "All Rarity")
for rarityName, _ in pairs(GameData.Plantsv1.RarityDatav1) do
    table.insert(GameData.Plantsv1.RarityOptionsv1, rarityName)
end
table.sort(GameData.Plantsv1.RarityOptionsv1)

-- Functions
GameData.Functionsv1.FindPlayerPlotv1 = function()
    for _, plot in pairs(GameData.Worldv1.PlotsFolderv1:GetChildren()) do
        if plot:FindFirstChild("Owner") then
            local ownerIdv1 = plot:GetAttribute("Owner")
            if ownerIdv1 == GameData.Playerv1.LocalPlayerv1.UserId then
                return plot
            end
        end
    end
    return nil
end

GameData.Functionsv1.TeleportTov1 = function(position)
    GameData.Playerv1.Characterv1 = GameData.Playerv1.LocalPlayerv1.Character
    if GameData.Playerv1.Characterv1 and GameData.Playerv1.Characterv1:FindFirstChild("HumanoidRootPart") then
        GameData.Playerv1.Characterv1.HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 5, 0))
    end
end

GameData.Functionsv1.GetPlantBaseNamev1 = function(plantNamev1)
    return plantNamev1:match("^(%a+)%d*$")
end

GameData.Functionsv1.IsPlantSelectedv1 = function(plantv1, hasPlantv1, hasRarityv1, allPlantv1, allRarityv1)
    -- Rarity diprioritaskan kalau dipilih
    if hasRarityv1 then
        if allRarityv1 then return true end
        local baseNamev1 = GameData.Functionsv1.GetPlantBaseNamev1(plantv1.Name)
        local plantDatav1 = GameData.Plantsv1.PlantDatav1[baseNamev1]
        if not plantDatav1 then return false end
        for _, selectedRar in pairs(GameData.Plantsv1.SelectedRaritiesv1) do
            if plantDatav1.Rarity == selectedRar then
                return true
            end
        end
        return false
    end

    -- Kalau hanya Plant dipilih
    if hasPlantv1 then
        if allPlantv1 then return true end
        for _, selectedName in pairs(GameData.Plantsv1.SelectedPlantsv1) do
            if plantv1.Name:match("^" .. selectedName .. "%d*$") then
                return true
            end
        end
        return false
    end

    return false
end

GameData.Functionsv1.ShouldHarvestTargetv1 = function(targetv1, hasMutationv1, hasVariantv1, hasWeatherv1, allMutationv1, allVariantv1, allWeatherv1)
    local mutationv1 = targetv1:GetAttribute("Mutation")
    local variantv1 = targetv1:GetAttribute("Variant")
    local weatherv1 = targetv1:GetAttribute("Weather")

    if not mutationv1 and hasMutationv1 then return false end
    if not variantv1 and hasVariantv1 then return false end
    if not weatherv1 and hasWeatherv1 then return false end

    local mutationMatchv1 = allMutationv1
    if not mutationMatchv1 and hasMutationv1 then
        for _, selectedMut in pairs(GameData.Plantsv1.SelectedMutationsv1) do
            if mutationv1 == selectedMut then
                mutationMatchv1 = true
                break
            end
        end
    end

    local variantMatchv1 = allVariantv1
    if not variantMatchv1 and hasVariantv1 then
        for _, selectedVar in pairs(GameData.Plantsv1.SelectedVariantsv1) do
            if variantv1 == selectedVar then
                variantMatchv1 = true
                break
            end
        end
    end

    local weatherMatchv1 = allWeatherv1
    if not weatherMatchv1 and hasWeatherv1 then
        for _, selectedWea in pairs(GameData.Plantsv1.SelectedWeathersv1) do
            if weatherv1 == selectedWea then
                weatherMatchv1 = true
                break
            end
        end
    end

    if not hasMutationv1 and not hasVariantv1 and not hasWeatherv1 then
        return true
    end

    if hasMutationv1 and not mutationMatchv1 then return false end
    if hasVariantv1 and not variantMatchv1 then return false end
    if hasWeatherv1 and not weatherMatchv1 then return false end

    return true
end

-- UI
Sec.Main1:AddDropdown({
    Title = "Select Plant (Harvest)",
    Content = "Select the plants you want to harvest",
    Options = GameData.Plantsv1.PlantOptionsv1,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.Plantsv1.SelectedPlantsv1 = selectedTable
    end
})

Sec.Main1:AddDropdown({
    Title = "Select Rarity (Harvest)",
    Content = "Rarity takes priority over Plant if both selected",
    Options = GameData.Plantsv1.RarityOptionsv1,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.Plantsv1.SelectedRaritiesv1 = selectedTable
    end
})

Sec.Main1:AddDropdown({
    Title = "Select Mutation (Harvest)",
    Content = "Select the mutation you want to harvest",
    Options = GameData.Plantsv1.MutationOptionsv1,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.Plantsv1.SelectedMutationsv1 = selectedTable
    end
})

Sec.Main1:AddDropdown({
    Title = "Select Variant (Harvest)",
    Content = "Select the variant you want to harvest",
    Options = GameData.Plantsv1.VariantOptionsv1,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.Plantsv1.SelectedVariantsv1 = selectedTable
    end
})

Sec.Main1:AddDropdown({
    Title = "Select Weather (Harvest)",
    Content = "Select the weather you want to harvest",
    Options = GameData.Plantsv1.WeatherOptionsv1,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.Plantsv1.SelectedWeathersv1 = selectedTable
    end
})

Sec.Main1:AddToggle({
    Title = "Auto Harvest",
    Default = false,
    Callback = function(value)

        if value then
            Chloex:MakeNotify({
                Title = "Auto Harvest",
                Description = "Enabled",
                Content = "Auto Harvest has been activated!",
                Color = "Green",
                Time = 0.5,
                Delay = 5,
                Icon = ""
            })

            GameData.Plantsv1.HarvestLoopv1 = task.spawn(function()

                while value do

                    GameData.Playerv1.Plotv1 = GameData.Functionsv1.FindPlayerPlotv1()
                    if not GameData.Playerv1.Plotv1 then
                        Chloex:MakeNotify({
                            Title = "Auto Harvest",
                            Description = "Error",
                            Content = "Player plot not found!",
                            Color = "Red",
                            Time = 0.5,
                            Delay = 3,
                            Icon = ""
                        })
                        task.wait(3)
                        continue
                    end

                    GameData.Functionsv1.TeleportTov1(GameData.Playerv1.Plotv1:GetPivot().Position)
                    task.wait(0.5)

                    local hasPlantv1 = #GameData.Plantsv1.SelectedPlantsv1 > 0
                    local hasRarityv1 = #GameData.Plantsv1.SelectedRaritiesv1 > 0
                    local hasMutationv1 = #GameData.Plantsv1.SelectedMutationsv1 > 0
                    local hasVariantv1 = #GameData.Plantsv1.SelectedVariantsv1 > 0
                    local hasWeatherv1 = #GameData.Plantsv1.SelectedWeathersv1 > 0

                    -- Kalau semua kosong skip
                    if not hasPlantv1 and not hasRarityv1 and not hasMutationv1 and not hasVariantv1 and not hasWeatherv1 then
                        task.wait(0.5)
                        continue
                    end

                    local allPlantv1 = false
                    for _, selectedName in pairs(GameData.Plantsv1.SelectedPlantsv1) do
                        if selectedName == "All Plant" then
                            allPlantv1 = true
                            break
                        end
                    end

                    local allRarityv1 = false
                    for _, selectedRar in pairs(GameData.Plantsv1.SelectedRaritiesv1) do
                        if selectedRar == "All Rarity" then
                            allRarityv1 = true
                            break
                        end
                    end

                    local allMutationv1 = false
                    for _, selectedMut in pairs(GameData.Plantsv1.SelectedMutationsv1) do
                        if selectedMut == "All Mutations" then
                            allMutationv1 = true
                            break
                        end
                    end

                    local allVariantv1 = false
                    for _, selectedVar in pairs(GameData.Plantsv1.SelectedVariantsv1) do
                        if selectedVar == "All Variants" then
                            allVariantv1 = true
                            break
                        end
                    end

                    local allWeatherv1 = false
                    for _, selectedWea in pairs(GameData.Plantsv1.SelectedWeathersv1) do
                        if selectedWea == "All Weather" then
                            allWeatherv1 = true
                            break
                        end
                    end

                    for _, plant in pairs(GameData.Worldv1.ClientPlantsv1:GetChildren()) do

                        if not GameData.Functionsv1.IsPlantSelectedv1(plant, hasPlantv1, hasRarityv1, allPlantv1, allRarityv1) then
                            continue
                        end

                        local hasFruitsv1 = false
                        for _, child in pairs(plant:GetChildren()) do
                            if child.Name:match("^Fruit%d+$") then
                                hasFruitsv1 = true
                                break
                            end
                        end

                        if hasFruitsv1 then
                            -- Case 1: Plant punya Fruit (Corn, dll)
                            for _, fruit in pairs(plant:GetChildren()) do
                                if fruit.Name:match("^Fruit%d+$") then
                                    if GameData.Functionsv1.ShouldHarvestTargetv1(fruit, hasMutationv1, hasVariantv1, hasWeatherv1, allMutationv1, allVariantv1, allWeatherv1) then
                                        GameData.Functionsv1.TeleportTov1(fruit:GetPivot().Position)
                                        task.wait(0.3)

                                        local promptv1 = fruit:FindFirstChild("HarvestPrompt", true)
                                        if promptv1 and promptv1:IsA("ProximityPrompt") then
                                            fireproximityprompt(promptv1)
                                            task.wait(0.2)
                                        end
                                    end
                                end
                            end
                        else
                            -- Case 2: Plant tidak punya Fruit (Carrot, dll)
                            if GameData.Functionsv1.ShouldHarvestTargetv1(plant, hasMutationv1, hasVariantv1, hasWeatherv1, allMutationv1, allVariantv1, allWeatherv1) then
                                GameData.Functionsv1.TeleportTov1(plant:GetPivot().Position)
                                task.wait(0.3)

                                local harvestPartv1 = plant:FindFirstChild("HarvestBoundingPart")
                                if harvestPartv1 then
                                    local promptv1 = harvestPartv1:FindFirstChild("HarvestPrompt")
                                    if promptv1 and promptv1:IsA("ProximityPrompt") then
                                        fireproximityprompt(promptv1)
                                        task.wait(0.2)
                                    end
                                end
                            end
                        end
                    end

                    task.wait(0.5)
                end

            end)

        else
            Chloex:MakeNotify({
                Title = "Auto Harvest",
                Description = "Disabled",
                Content = "Auto Harvest has been deactivated!",
                Color = "Red",
                Time = 0.5,
                Delay = 5,
                Icon = ""
            })

            if GameData.Plantsv1.HarvestLoopv1 then
                task.cancel(GameData.Plantsv1.HarvestLoopv1)
                GameData.Plantsv1.HarvestLoopv1 = nil
            end
        end
    end
})

Sec.Main2 = Tabs.Main:AddSection({
    Title = "Water",
    Open = false
})

GameData.AutoWaterv7.Eventv7 =
    GameData.Servicesv7.ReplicatedStoragev7
        :WaitForChild("RemoteEvents")
        :WaitForChild("UseGear")

GameData.AutoWaterv7.ModelsFolderv7 =
    GameData.Servicesv7.ReplicatedStoragev7
        :WaitForChild("Plants")
        :WaitForChild("Models")

for _, itemv7 in pairs(GameData.AutoWaterv7.ModelsFolderv7:GetChildren()) do
    if itemv7:IsA("Folder") then
        table.insert(GameData.AutoWaterv7.PlantNamesv7, itemv7.Name)
    end
end

table.sort(GameData.AutoWaterv7.PlantNamesv7)

GameData.AutoWaterv7.SelectedPlantv7 =
    GameData.AutoWaterv7.PlantNamesv7[1]

Sec.Main2:AddDropdown({
    Title = "Select Plant",
    Options = GameData.AutoWaterv7.PlantNamesv7,
    Multi = false,
    Default = GameData.AutoWaterv7.PlantNamesv7[1],
    Callback = function(value)
        GameData.AutoWaterv7.SelectedPlantv7 = value
        print("Selected plant:", value)
    end
})

Sec.Main2:AddToggle({
    Title = "Auto Watering Can",
    Default = false,
    Callback = function(value)
        GameData.AutoWaterv7.Enabledv7 = value
        if value then
            Notify("Auto Watering enabled!", 2)
            task.spawn(function()
                while GameData.AutoWaterv7.Enabledv7 do
                    for _, plantv7 in pairs(
                        GameData.Servicesv7.Workspacev7
                            .ClientPlants
                            :GetChildren()
                    ) do
                        if not GameData.AutoWaterv7.Enabledv7 then
                            break
                        end
                        if plantv7.Name:lower():match(
                            "^" .. GameData.AutoWaterv7.SelectedPlantv7:lower()
                        ) then
                            if plantv7.PrimaryPart then
                                GameData.AutoWaterv7.Eventv7:FireServer(
                                    "Watering Can",
                                    {
                                        position =
                                            plantv7.PrimaryPart.Position
                                    }
                                )
                                task.wait(0.01)
                            end
                        end
                    end
                    task.wait(0.01)
                end
            end)
        else

            Notify("Auto Watering disabled!", 2)

        end
    end
})

Sec.Main3 = Tabs.Main:AddSection({
    Title = "Shovel",
    Open = false
})

GameData.RemoveSystemv8.Eventv8 =
    GameData.Servicesv8.ReplicatedStoragev8
        :WaitForChild("RemoteEvents")
        :WaitForChild("RemovePlant")

GameData.RemoveSystemv8.ModelsFolderv8 =
    GameData.Servicesv8.ReplicatedStoragev8
        :WaitForChild("Plants")
        :WaitForChild("Models")

for _, itemv8 in pairs(GameData.RemoveSystemv8.ModelsFolderv8:GetChildren()) do
    if itemv8:IsA("Folder") then
        table.insert(GameData.RemoveSystemv8.PlantNamesv8, itemv8.Name)
    end
end

table.sort(GameData.RemoveSystemv8.PlantNamesv8)

GameData.RemoveSystemv8.MutationDatav8 = require(
    GameData.Servicesv8.ReplicatedStoragev8
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("MutationDataDefinitions")
)

GameData.RemoveSystemv8.MutationNamesv8 = {"None"}

for mutationNamev8, _ in pairs(GameData.RemoveSystemv8.MutationDatav8) do
    table.insert(GameData.RemoveSystemv8.MutationNamesv8, mutationNamev8)
end

table.sort(GameData.RemoveSystemv8.MutationNamesv8)

GameData.RemoveSystemv8.PlantDatav8 = require(
    GameData.Servicesv8.ReplicatedStoragev8
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("PlantDataDefinitions")
)

GameData.RemoveSystemv8.RarityDefinitionsv8 = require(
    GameData.Servicesv8.ReplicatedStoragev8
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("RarityDefinitions")
)

for rarityNamev8, _ in pairs(GameData.RemoveSystemv8.RarityDefinitionsv8) do
    table.insert(GameData.RemoveSystemv8.RarityListv8, rarityNamev8)
end
table.sort(GameData.RemoveSystemv8.RarityListv8)

GameData.RemoveSystemv8.IsPlantMatchRarityv8 = function(plantNamev8)
    if #GameData.RemoveSystemv8.SelectedRaritiesv8 == 0 then
        return false
    end

    local cleanNamev8 = plantNamev8:gsub("%d+$", "")
    local plantInfov8 = GameData.RemoveSystemv8.PlantDatav8[cleanNamev8]
    if not plantInfov8 then return false end

    for _, rv8 in ipairs(GameData.RemoveSystemv8.SelectedRaritiesv8) do
        if rv8 == plantInfov8["Rarity"] then
            return true
        end
    end
    return false
end

GameData.RemoveSystemv8.IsMatchMutationv8 = function(targetv8)
    if #GameData.RemoveSystemv8.SelectedMutationsv8 == 0 then
        return true
    end

    local mutationv8 = targetv8:GetAttribute("Mutation") or "None"
    for _, mv8 in ipairs(GameData.RemoveSystemv8.SelectedMutationsv8) do
        if mv8 == mutationv8 then
            return true
        end
    end
    return false
end

GameData.RemoveSystemv8.IsMatchWeightv8 = function(fruitv8)
    local weightv8 = fruitv8:GetAttribute("FruitWeight")

    if weightv8 == nil then
        return true
    end

    if GameData.RemoveSystemv8.MaxFruitWeightv8 ~= nil then
        if weightv8 > GameData.RemoveSystemv8.MaxFruitWeightv8 then
            return true
        end
    end

    if GameData.RemoveSystemv8.MinFruitWeightv8 ~= nil then
        if weightv8 < GameData.RemoveSystemv8.MinFruitWeightv8 then
            return true
        end
    end

    if GameData.RemoveSystemv8.MinFruitWeightv8 ~= nil
        or GameData.RemoveSystemv8.MaxFruitWeightv8 ~= nil then
        return false
    end

    return true
end

GameData.RemoveSystemv8.IsAlreadyRemovedv8 = function(uuidv8)
    return GameData.RemoveSystemv8.RemovedUuidsv8[uuidv8] == true
end

GameData.RemoveSystemv8.MarkRemovedv8 = function(uuidv8)
    GameData.RemoveSystemv8.RemovedUuidsv8[uuidv8] = true
end

GameData.RemoveSystemv8.ResetRemovedUuidsv8 = function()
    GameData.RemoveSystemv8.RemovedUuidsv8 = {}
end

Sec.Main3:AddDropdown({
    Title = "Select Plant (Plant)",
    Options = GameData.RemoveSystemv8.PlantNamesv8,
    Multi = false,
    Default = "",
    Callback = function(value)
        GameData.RemoveSystemv8.SelectedPlantv8 = value or ""
    end
})

Sec.Main3:AddDropdown({
    Title = "Select Mode",
    Options = {"Fruit", "Plant"},
    Multi = false,
    Default = "Fruit",
    Callback = function(value)
        GameData.RemoveSystemv8.SelectedModev8 = value
    end
})

Sec.Main3:AddDropdown({
    Title = "Select Mutation",
    Options = GameData.RemoveSystemv8.MutationNamesv8,
    Multi = true,
    Default = {},
    Callback = function(selected)
        GameData.RemoveSystemv8.SelectedMutationsv8 = selected
    end
})

Sec.Main3:AddDropdown({
    Title = "Select Rarity (Filter)",
    Options = GameData.RemoveSystemv8.RarityListv8,
    Multi = true,
    Default = {},
    Callback = function(selected)
        GameData.RemoveSystemv8.SelectedRaritiesv8 = selected
    end
})

Sec.Main3:AddInput({
    Title = "Min Fruit Weight",
    Content = "Example: 0.10 — fruit < min will be removed",
    Default = "",
    Callback = function(value)
        if value ~= "" then
            local numv8 = tonumber(value)
            if numv8 then
                GameData.RemoveSystemv8.MinFruitWeightv8 = numv8
            else
                GameData.RemoveSystemv8.MinFruitWeightv8 = nil
            end
        else
            GameData.RemoveSystemv8.MinFruitWeightv8 = nil
        end
    end
})

Sec.Main3:AddInput({
    Title = "Max Fruit Weight",
    Content = "Example: 0.18 — fruit > max will be removed",
    Default = "",
    Callback = function(value)
        if value ~= "" then
            local numv8 = tonumber(value)
            if numv8 then
                GameData.RemoveSystemv8.MaxFruitWeightv8 = numv8
            else
                GameData.RemoveSystemv8.MaxFruitWeightv8 = nil
            end
        else
            GameData.RemoveSystemv8.MaxFruitWeightv8 = nil
        end
    end
})

Sec.Main3:AddToggle({
    Title = "Remove Plant",
    Default = false,
    Callback = function(value)
        GameData.RemoveSystemv8.IsRunningv8 = value

        if value then
            Notify("Remove " .. GameData.RemoveSystemv8.SelectedModev8 .. " started!", 3)

            task.spawn(function()
                while GameData.RemoveSystemv8.IsRunningv8 do

                    for _, plantv8 in ipairs(GameData.Servicesv8.Workspacev8.ClientPlants:GetChildren()) do
                        if not GameData.RemoveSystemv8.IsRunningv8 then break end

                        local hasRarityv8 = #GameData.RemoveSystemv8.SelectedRaritiesv8 > 0
                        local plantBasev8 = plantv8.Name:gsub("%d+$", "")

                        local passFilterv8 = false

                        if hasRarityv8 then
                            passFilterv8 = GameData.RemoveSystemv8.IsPlantMatchRarityv8(plantv8.Name)
                        else
                            if GameData.RemoveSystemv8.SelectedPlantv8 == "" then
                                passFilterv8 = true
                            else
                                passFilterv8 = (plantBasev8 == GameData.RemoveSystemv8.SelectedPlantv8)
                            end
                        end

                        if passFilterv8 then
                            if GameData.RemoveSystemv8.SelectedModev8 == "Plant" then

                                local rawUuidv8 = plantv8:GetAttribute("Uuid")

                                if rawUuidv8 and GameData.RemoveSystemv8.IsMatchMutationv8(plantv8) then
                                    local uuidKeyv8 = rawUuidv8:split(":")[1]

                                    if not GameData.RemoveSystemv8.IsAlreadyRemovedv8(uuidKeyv8) then
                                        GameData.RemoveSystemv8.MarkRemovedv8(uuidKeyv8)
                                        GameData.RemoveSystemv8.Eventv8:FireServer(
                                            uuidKeyv8, nil
                                        )
                                        task.wait(0.5)
                                    end
                                end

                            elseif GameData.RemoveSystemv8.SelectedModev8 == "Fruit" then

                                for _, fruitv8 in ipairs(plantv8:GetChildren()) do
                                    if not GameData.RemoveSystemv8.IsRunningv8 then break end

                                    if fruitv8.Name:gsub("%d+$", "") == "Fruit" then
                                        local rawUuidv8 = fruitv8:GetAttribute("Uuid")

                                        if rawUuidv8
                                            and GameData.RemoveSystemv8.IsMatchMutationv8(fruitv8)
                                            and GameData.RemoveSystemv8.IsMatchWeightv8(fruitv8) then

                                            local uuidKeyv8 = rawUuidv8:split(":")[1]

                                            if not GameData.RemoveSystemv8.IsAlreadyRemovedv8(uuidKeyv8) then
                                                GameData.RemoveSystemv8.MarkRemovedv8(uuidKeyv8)
                                                GameData.RemoveSystemv8.Eventv8:FireServer(
                                                    uuidKeyv8, 1
                                                )
                                                task.wait(0.5)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end

                    task.wait(1)
                    GameData.RemoveSystemv8.ResetRemovedUuidsv8()

                end

                Notify("Remove " .. GameData.RemoveSystemv8.SelectedModev8 .. " stopped!", 2)
            end)
        end
    end
})

Sec.Main4 = Tabs.Main:AddSection({
    Title = "Plant",
    Open = false
})

GameData.SeedsFolder = GameData.ReplicatedStorage.Plants.Tools.Seeds
GameData.PlotsFolder = workspace:WaitForChild("Plots")
GameData.Player = GameData.Players.LocalPlayer

function GameData:FindPlayerPlot(p)
    for _, plot in pairs(self.PlotsFolder:GetChildren()) do
        if plot:GetAttribute("Owner") == p.UserId then
            return plot
        end
    end
end

for _, seed in pairs(GameData.SeedsFolder:GetChildren()) do
    table.insert(GameData.SeedNames, seed.Name)
end

GameData.SelectedSeed = GameData.SeedNames[1]

function GameData:GetSeedItemName(seedName)
    return string.gsub(seedName, " Seed", "")
end

function GameData:GetToolFromBackpack(seedName)
    local backpack = self.Player.Backpack
    for _, tool in pairs(backpack:GetChildren()) do
        if string.find(tool.Name, seedName) then
            return tool
        end
    end
end

function GameData:GetToolFromCharacter(seedName)
    local char = self.Player.Character
    if char then
        for _, tool in pairs(char:GetChildren()) do
            if string.find(tool.Name, seedName) then
                return tool
            end
        end
    end
end

function GameData:EquipTool(tool)
    local char = self.Player.Character
    if char and tool then
        tool.Parent = char
        task.wait(0.3)
    end
end

function GameData:ScanPart(targetPart, seedName)
    local character = self.Player.Character or self.Player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    local Event = self.ReplicatedStorage.RemoteEvents.PlantSeed

    local size = targetPart.Size
    local step = 2

    local axes = {
        {value = size.X, vector = Vector3.new(1,0,0)},
        {value = size.Y, vector = Vector3.new(0,1,0)},
        {value = size.Z, vector = Vector3.new(0,0,1)},
    }

    table.sort(axes, function(a,b)
        return a.value > b.value
    end)

    self.axis1 = axes[1]
    self.axis2 = axes[2]
    self.thinAxis = axes[3]
    self.goingRight = true

    for a = -self.axis1.value/2, self.axis1.value/2, step do
        if not self.IsPlanting or self.SelectedPlantMode ~= "Random Plant" then break end

        if self.goingRight then
            for b = -self.axis2.value/2, self.axis2.value/2, step do
                if not self.IsPlanting or self.SelectedPlantMode ~= "Random Plant" then break end

                local offset =
                    self.axis1.vector * a +
                    self.axis2.vector * b +
                    self.thinAxis.vector * 3

                local worldPos = (targetPart.CFrame * CFrame.new(offset)).Position
                worldPos = worldPos + Vector3.new(0,5,0)

                hrp.CFrame = CFrame.new(worldPos)
                task.wait(self.TpDelay)

                Event:InvokeServer(seedName, hrp.Position)
                task.wait(self.PlantDelay)
            end
        else
            for b = self.axis2.value/2, -self.axis2.value/2, -step do
                if not self.IsPlanting or self.SelectedPlantMode ~= "Random Plant" then break end

                local offset =
                    self.axis1.vector * a +
                    self.axis2.vector * b +
                    self.thinAxis.vector * 3

                local worldPos = (targetPart.CFrame * CFrame.new(offset)).Position
                worldPos = worldPos + Vector3.new(0,5,0)

                hrp.CFrame = CFrame.new(worldPos)
                task.wait(self.TpDelay)

                Event:InvokeServer(seedName, hrp.Position)
                task.wait(self.PlantDelay)
            end
        end

        self.goingRight = not self.goingRight
    end
end

Sec.Main4:AddDropdown({
    Title = "Select a Seed",
    Content = "Choose a seed from the list",
    Options = GameData.SeedNames,
    Multi = false,
    Default = GameData.SeedNames[1],
    Callback = function(value)
        GameData.SelectedSeed = value
    end
})

Sec.Main4:AddDropdown({
    Title = "Select Plant Position",
    Content = "Choose where to plant the seed",
    Options = {"Character Position", "Random Plant"},
    Multi = false,
    Default = "Character Position",
    Callback = function(value)
        GameData.SelectedPlantMode = value
    end
})

Sec.Main4:AddToggle({
    Title = "Auto Plant Seed",
    Default = false,
    Callback = function(value)
        GameData.IsPlanting = value

        if value then
            task.spawn(function()
                while GameData.IsPlanting do

                    local heldTool = GameData:GetToolFromCharacter(GameData.SelectedSeed)
                    if not heldTool then
                        local tool = GameData:GetToolFromBackpack(GameData.SelectedSeed)
                        if tool then
                            GameData:EquipTool(tool)
                            task.wait(0.2)
                        else
                            task.wait(1)
                            continue
                        end
                    end

                    if GameData.SelectedPlantMode == "Character Position" then
                        local char = GameData.Player.Character
                        if char then
                            local hrp = char:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                GameData.ReplicatedStorage.RemoteEvents.PlantSeed:InvokeServer(
                                    GameData:GetSeedItemName(GameData.SelectedSeed),
                                    hrp.Position
                                )
                            end
                        end
                        task.wait(GameData.PlantDelay)

                    elseif GameData.SelectedPlantMode == "Random Plant" then
                        local myPlot = GameData:FindPlayerPlot(GameData.Player)
                        if not myPlot then
                            task.wait(2)
                            continue
                        end

                        local plantableArea = myPlot:FindFirstChild("PlantableArea")
                        if not plantableArea then
                            task.wait(2)
                            continue
                        end

                        for _, obj in pairs(plantableArea:GetChildren()) do
                            if not GameData.IsPlanting then break end
                            if obj:IsA("BasePart") then
                                GameData:ScanPart(obj, GameData:GetSeedItemName(GameData.SelectedSeed))
                            end
                        end
                    end
                end
            end)
        end
    end
})

Sec.Sell1 = Tabs.Backpack:AddSection({
    Title = "Sell Features",
    Open = false
})

GameData.Backpackv9 = GameData.Playerv9:WaitForChild("Backpack")
GameData.Characterv9 = GameData.Playerv9.Character or GameData.Playerv9.CharacterAdded:Wait()

GameData.SellEventv9 = GameData.ReplicatedStoragev9.RemoteEvents.SellItems
GameData.ModelsFolderv9 = GameData.ReplicatedStoragev9.Plants.Models

GameData.MutationDatav9 = require(
    GameData.ReplicatedStoragev9
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("MutationDataDefinitions")
)

GameData.PlantDatav9 = require(
    GameData.ReplicatedStoragev9
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("PlantDataDefinitions")
)

GameData.RarityDefinitionsv9 = require(
    GameData.ReplicatedStoragev9
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("RarityDefinitions")
)

for mutationNamev9, _ in pairs(GameData.MutationDatav9) do
    table.insert(GameData.MutationNamesv9, mutationNamev9)
end
table.sort(GameData.MutationNamesv9)

for rarityNamev9, _ in pairs(GameData.RarityDefinitionsv9) do
    table.insert(GameData.RarityListv9, rarityNamev9)
end
table.sort(GameData.RarityListv9)

for plantNamev9, plantInfov9 in pairs(GameData.PlantDatav9) do
    if plantInfov9.Rarity then
        GameData.PlantRarityMapv9[plantNamev9] = plantInfov9.Rarity
    end
end

for _, plantv9 in pairs(GameData.ModelsFolderv9:GetChildren()) do
    table.insert(GameData.PlantOptionsv9, plantv9.Name)
end

function GameData:GetMutationsv9(toolv9)
    local mutationsv9 = {}

    local mutationAttrv9 = toolv9:GetAttribute("Mutation") or toolv9:GetAttribute("Mutasi")
    if mutationAttrv9 then
        for mutationv9 in string.gmatch(tostring(mutationAttrv9), "[^,|]+") do
            table.insert(mutationsv9, mutationv9:match("^%s*(.-)%s*$"))
        end
    end

    local iv9 = 1
    while true do
        local attrv9 = toolv9:GetAttribute("Mutation" .. iv9) or toolv9:GetAttribute("Mutasi" .. iv9)
        if attrv9 then
            table.insert(mutationsv9, tostring(attrv9))
            iv9 += 1
        else
            break
        end
    end

    return mutationsv9
end

function GameData:GetPlantRarityv9(toolNamev9)
    for plantNamev9, rarityv9 in pairs(self.PlantRarityMapv9) do
        if string.find(toolNamev9, plantNamev9) then
            return rarityv9
        end
    end
    return nil
end

function GameData:GetPlantToolv9()
    local hasPlantv9 = #self.SelectedPlantsv9 > 0
    local hasMutationv9 = #self.SelectedMutationsv9 > 0
    local hasRarityv9 = #self.SelectedRaritiesv9 > 0

    if not hasPlantv9 and not hasMutationv9 and not hasRarityv9 then
        return nil
    end

    for _, containerv9 in pairs({self.Backpackv9, self.Characterv9}) do
        if containerv9 then
            for _, toolv9 in pairs(containerv9:GetChildren()) do
                if toolv9:IsA("Tool") then

                    if string.find(toolv9.Name, "Seed") then
                        continue
                    end

                    local toolMutationsv9 = self:GetMutationsv9(toolv9)
                    local toolRarityv9 = self:GetPlantRarityv9(toolv9.Name)

                    local rarityMatchv9 = false
                    local plantMatchv9 = false
                    local mutationMatchv9 = false

                    if hasRarityv9 then
                        for _, selectedv9 in ipairs(self.SelectedRaritiesv9) do
                            if toolRarityv9 == selectedv9 then
                                rarityMatchv9 = true
                                break
                            end
                        end
                    end

                    if hasPlantv9 then
                        for _, selectedv9 in ipairs(self.SelectedPlantsv9) do
                            if string.find(toolv9.Name, selectedv9) then
                                plantMatchv9 = true
                                break
                            end
                        end
                    end

                    if hasMutationv9 then
                        for _, selectedv9 in ipairs(self.SelectedMutationsv9) do
                            for _, toolMutv9 in ipairs(toolMutationsv9) do
                                if toolMutv9 == selectedv9 then
                                    mutationMatchv9 = true
                                    break
                                end
                            end
                            if mutationMatchv9 then break end
                        end
                    end

                    if hasRarityv9 then
                        if hasMutationv9 then
                            if rarityMatchv9 and mutationMatchv9 then
                                return toolv9
                            end
                        else
                            if rarityMatchv9 then
                                return toolv9
                            end
                        end
                    elseif hasPlantv9 and hasMutationv9 then
                        if plantMatchv9 and mutationMatchv9 then
                            return toolv9
                        end
                    elseif hasPlantv9 and not hasMutationv9 then
                        if plantMatchv9 then
                            return toolv9
                        end
                    elseif not hasPlantv9 and hasMutationv9 then
                        if mutationMatchv9 then
                            return toolv9
                        end
                    end
                end
            end
        end
    end

    return nil
end

Sec.Sell1:AddDropdown({
    Title = "Sell Mode",
    Content = "Choose sell mode",
    Options = {"SellAll", "Single Sell"},
    Multi = false,
    Default = GameData.SellModev9,
    Callback = function(selectedv9)
        GameData.SellModev9 = selectedv9
        GameData.SelectedPlantsv9 = {}
        GameData.SelectedMutationsv9 = {}
        GameData.SelectedRaritiesv9 = {}
    end
})

Sec.Sell1:AddDropdown({
    Title = "Select Seed To Sell",
    Content = "Select plants to sell (Single Sell only)",
    Options = GameData.PlantOptionsv9,
    Multi = true,
    Default = {},
    Callback = function(selectedTablev9)
        if GameData.SellModev9 == "Single Sell" then
            GameData.SelectedPlantsv9 = selectedTablev9
        end
    end
})

Sec.Sell1:AddDropdown({
    Title = "Select Rarity To Sell",
    Content = "Choose plant rarity (Single Sell only, overrides Plant filter)",
    Options = GameData.RarityListv9,
    Multi = true,
    Default = {},
    Callback = function(selectedTablev9)
        if GameData.SellModev9 == "Single Sell" then
            GameData.SelectedRaritiesv9 = selectedTablev9
        end
    end
})

Sec.Sell1:AddDropdown({
    Title = "Select Mutation To Sell",
    Content = "(Single Sell only)",
    Options = GameData.MutationNamesv9,
    Multi = true,
    Default = {"Sandy"},
    Callback = function(selectedv9)
        if GameData.SellModev9 == "Single Sell" then
            GameData.SelectedMutationsv9 = selectedv9
        end
    end
})

Sec.Sell1:AddInput({
    Title = "Sell Delay",
    Content = "(SellAll only)",
    Default = tostring(GameData.SellDelayv9),
    Callback = function(valuev9)
        if GameData.SellModev9 == "SellAll" then
            local numv9 = tonumber(valuev9)
            if numv9 then
                GameData.SellDelayv9 = numv9
            end
        end
    end
})

Sec.Sell1:AddToggle({
    Title = "Auto Sell",
    Default = false,
    Callback = function(valuev9)
        GameData.AutoSellv9 = valuev9

        if valuev9 then
            Notify("Auto Sell Enabled! Mode: " .. GameData.SellModev9, 2)

            task.spawn(function()
                while GameData.AutoSellv9 do
                    GameData.Characterv9 = GameData.Playerv9.Character or GameData.Playerv9.CharacterAdded:Wait()
                    local hrpv9 = GameData.Characterv9:WaitForChild("HumanoidRootPart")
                    local sellTeleportv9 = workspace.MapPhysical.Teleports.SellTeleport

                    if GameData.SellModev9 == "SellAll" then
                        local savedCFramev9 = hrpv9.CFrame
                        hrpv9.CFrame = sellTeleportv9.CFrame
                        task.wait(0.5)

                        GameData.SellEventv9:InvokeServer("SellAll")
                        task.wait(0.5)

                        hrpv9.CFrame = savedCFramev9
                        task.wait(GameData.SellDelayv9)

                    elseif GameData.SellModev9 == "Single Sell" then
                        local hasPlantv9 = #GameData.SelectedPlantsv9 > 0
                        local hasMutationv9 = #GameData.SelectedMutationsv9 > 0
                        local hasRarityv9 = #GameData.SelectedRaritiesv9 > 0

                        if not hasPlantv9 and not hasMutationv9 and not hasRarityv9 then
                            task.wait(0.1)
                            continue
                        end

                        local toolv9 = GameData:GetPlantToolv9()

                        if toolv9 then
                            local savedCFramev9 = hrpv9.CFrame
                            hrpv9.CFrame = sellTeleportv9.CFrame
                            task.wait(0.3)

                            while GameData.AutoSellv9 do
                                local currentToolv9 = GameData:GetPlantToolv9()

                                if currentToolv9 then
                                    GameData.Characterv9.Humanoid:EquipTool(currentToolv9)
                                    task.wait(0.5)
                                    GameData.SellEventv9:InvokeServer("SellSingle")
                                    task.wait(0.01)
                                else
                                    hrpv9.CFrame = savedCFramev9
                                    Notify("Fruit empty, waiting for new fruit...", 2)
                                    break
                                end
                            end
                        else
                            task.wait(0.1)
                        end
                    end
                end
            end)
        else
            Notify("Auto Sell Disabled!", 2)
        end
    end
})

Sec.Favorite1 = Tabs.Backpack:AddSection({
    Title = "Favorite",
    Open = false
})

GameData.FavoriteSystemv4.PlantsModelsv4 =
    GameData.Servicesv4.ReplicatedStoragev4.Plants.Models

GameData.FavoriteSystemv4.Playerv4 =
    GameData.Servicesv4.Playersv4.LocalPlayer

GameData.FavoriteSystemv4.RemoteEventv4 =
    GameData.Servicesv4.ReplicatedStoragev4
        :WaitForChild("RemoteEvents")
        :WaitForChild("ToggleFavorite")

GameData.FavoriteSystemv4.MutationDatav4 = require(
    GameData.Servicesv4.ReplicatedStoragev4
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("MutationDataDefinitions")
)

for _, model in ipairs(GameData.FavoriteSystemv4.PlantsModelsv4:GetChildren()) do
    table.insert(GameData.FavoriteSystemv4.PlantOptionsv4, model.Name)
end

for key, _ in pairs(GameData.FavoriteSystemv4.MutationDatav4) do
    table.insert(GameData.FavoriteSystemv4.MutationOptionsv4, key)
end

table.sort(GameData.FavoriteSystemv4.MutationOptionsv4)

function GameData.FavoriteSystemv4.GetMutationv4(tool)

    local mutationv4 = tool:GetAttribute("Mutation")

    if not mutationv4 then
        local mutationValuev4 = tool:FindFirstChild("Mutation")
        if mutationValuev4 then
            mutationv4 = mutationValuev4.Value
        end
    end

    if not mutationv4 or mutationv4 == "" then
        mutationv4 = "None"
    end

    return mutationv4
end

function GameData.FavoriteSystemv4.IsAlreadyFavoritedv4(tool)
    return tool:GetAttribute("Favorited") == true
end

function GameData.FavoriteSystemv4.IsMatchv4(tool)

    if not tool:IsA("Tool") then
        return false
    end

    local hasPlantFilterv4 =
        #GameData.FavoriteSystemv4.SelectedPlantsv4 > 0

    local hasMutationFilterv4 =
        #GameData.FavoriteSystemv4.SelectedMutationsv4 > 0

    local toolMutationv4 =
        GameData.FavoriteSystemv4.GetMutationv4(tool)

    local nameMatchv4 = false
    for _, plantName in ipairs(GameData.FavoriteSystemv4.SelectedPlantsv4) do
        if string.find(tool.Name, plantName, 1, true) then
            nameMatchv4 = true
            break
        end
    end

    local mutationMatchv4 = false
    for _, mut in ipairs(GameData.FavoriteSystemv4.SelectedMutationsv4) do
        if toolMutationv4 == mut then
            mutationMatchv4 = true
            break
        end
    end

    if hasPlantFilterv4 and hasMutationFilterv4 then
        return nameMatchv4 and mutationMatchv4
    elseif hasMutationFilterv4 and not hasPlantFilterv4 then
        return mutationMatchv4
    elseif hasPlantFilterv4 and not hasMutationFilterv4 then
        return nameMatchv4
    else
        return false
    end
end

function GameData.FavoriteSystemv4.ScanContainersv4(callback)

    local containersv4 = {
        GameData.FavoriteSystemv4.Playerv4.Backpack,
        GameData.FavoriteSystemv4.Playerv4.Character
    }

    for _, containerv4 in ipairs(containersv4) do
        if containerv4 then
            for _, tool in pairs(containerv4:GetChildren()) do
                callback(tool)
            end
        end
    end
end

function GameData.FavoriteSystemv4.FavoritePlantsv4()

    GameData.FavoriteSystemv4.ScanContainersv4(function(tool)
        if GameData.FavoriteSystemv4.IsMatchv4(tool)
        and not GameData.FavoriteSystemv4.IsAlreadyFavoritedv4(tool) then

            GameData.FavoriteSystemv4.RemoteEventv4:FireServer(tool)

            print("Favorited: "
                .. tool.Name
                .. " | Mutation: "
                .. GameData.FavoriteSystemv4.GetMutationv4(tool))
        end
    end)
end

function GameData.FavoriteSystemv4.UnfavoritePlantsv4()

    GameData.FavoriteSystemv4.ScanContainersv4(function(tool)
        if GameData.FavoriteSystemv4.IsMatchv4(tool)
        and GameData.FavoriteSystemv4.IsAlreadyFavoritedv4(tool) then

            GameData.FavoriteSystemv4.RemoteEventv4:FireServer(tool)

            print("Unfavorited: "
                .. tool.Name
                .. " | Mutation: "
                .. GameData.FavoriteSystemv4.GetMutationv4(tool))
        end
    end)
end

function GameData.FavoriteSystemv4.UnfavoriteAllPlantsv4()

    local foundv4 = false

    GameData.FavoriteSystemv4.ScanContainersv4(function(tool)
        if tool:IsA("Tool")
        and GameData.FavoriteSystemv4.IsAlreadyFavoritedv4(tool) then

            GameData.FavoriteSystemv4.RemoteEventv4:FireServer(tool)

            print("Unfavorited All: "
                .. tool.Name
                .. " | Mutation: "
                .. GameData.FavoriteSystemv4.GetMutationv4(tool))

            foundv4 = true
        end
    end)

    if not foundv4 then
        print("No favorited tools found.")
    end
end

Sec.Favorite1:AddDropdown({
    Title = "Select Seed (Favorite)",
    Options = GameData.FavoriteSystemv4.PlantOptionsv4,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.FavoriteSystemv4.SelectedPlantsv4 = selectedTable
    end
})

-- BAGIAN YANG DIUBAH
Sec.Favorite1:AddDropdown({
    Title = "Select Mutation (Favorite)",
    Options = GameData.FavoriteSystemv4.MutationOptionsv4,
    Multi = true,
    Default = {"Sandy"},
    Callback = function(selectedTable)
        GameData.FavoriteSystemv4.SelectedMutationsv4 = selectedTable
        print("Mutation selected:")
        for _, mutation in ipairs(selectedTable) do
            print("-", mutation)
        end
    end
})

Sec.Favorite1:AddToggle({
    Title = "Auto Favorite",
    Default = false,
    Callback = function(value)

        GameData.FavoriteSystemv4.AutoFavoriteEnabledv4 = value

        if value then

            GameData.FavoriteSystemv4.AutoUnfavoriteEnabledv4 = false

            if GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4 then
                task.cancel(GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4)
                GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4 = nil
            end

            Notify("Auto Favorite Enabled!", 2)

            GameData.FavoriteSystemv4.AutoFavoriteLoopv4 =
                task.spawn(function()

                    while GameData.FavoriteSystemv4.AutoFavoriteEnabledv4 do
                        GameData.FavoriteSystemv4.FavoritePlantsv4()
                        task.wait(1)
                    end

                end)
        else

            Notify("Auto Favorite Disabled!", 2)

            if GameData.FavoriteSystemv4.AutoFavoriteLoopv4 then
                task.cancel(GameData.FavoriteSystemv4.AutoFavoriteLoopv4)
                GameData.FavoriteSystemv4.AutoFavoriteLoopv4 = nil
            end
        end
    end
})

Sec.Favorite1:AddToggle({
    Title = "Auto Unfavorite",
    Default = false,
    Callback = function(value)

        GameData.FavoriteSystemv4.AutoUnfavoriteEnabledv4 = value

        if value then

            GameData.FavoriteSystemv4.AutoFavoriteEnabledv4 = false

            if GameData.FavoriteSystemv4.AutoFavoriteLoopv4 then
                task.cancel(GameData.FavoriteSystemv4.AutoFavoriteLoopv4)
                GameData.FavoriteSystemv4.AutoFavoriteLoopv4 = nil
            end

            Notify("Auto Unfavorite Selected Enabled!", 2)

            GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4 =
                task.spawn(function()

                    while GameData.FavoriteSystemv4.AutoUnfavoriteEnabledv4 do
                        GameData.FavoriteSystemv4.UnfavoritePlantsv4()
                        task.wait(1)
                    end

                end)
        else

            Notify("Auto Unfavorite Selected Disabled!", 2)

            if GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4 then
                task.cancel(GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4)
                GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4 = nil
            end
        end
    end
})

Sec.Favorite1:AddToggle({
    Title = "Auto Unfavorite All",
    Default = false,
    Callback = function(value)

        if value then

            GameData.FavoriteSystemv4.AutoFavoriteEnabledv4 = false

            if GameData.FavoriteSystemv4.AutoFavoriteLoopv4 then
                task.cancel(GameData.FavoriteSystemv4.AutoFavoriteLoopv4)
                GameData.FavoriteSystemv4.AutoFavoriteLoopv4 = nil
            end

            Notify("Auto Unfavorite All Enabled!", 2)

            GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4 =
                task.spawn(function()

                    while value do
                        GameData.FavoriteSystemv4.UnfavoriteAllPlantsv4()
                        task.wait(1)
                    end

                end)
        else

            Notify("Auto Unfavorite All Disabled!", 2)

            if GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4 then
                task.cancel(GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4)
                GameData.FavoriteSystemv4.AutoUnfavoriteLoopv4 = nil
            end
        end
    end
})

Sec.Seed1 = Tabs.Shop:AddSection({
    Title = "Seed",
    Open = false
})

-- // Info Stock Seed

GameData.SeedStockv5.RemoteEventsv5 =
    GameData.Servicesv5.ReplicatedStoragev5:WaitForChild("RemoteEvents")

GameData.SeedStockv5.GetShopDatav5 =
    GameData.SeedStockv5.RemoteEventsv5:FindFirstChild("GetShopData")

GameData.SeedStockv5.Paragraphv5 =
    Sec.Seed1:AddParagraph({
        Title = "Seed Shop Stock",
        Content = "Loading seed stock..."
    })
if not (
    GameData.SeedStockv5.GetShopDatav5
    and GameData.SeedStockv5.GetShopDatav5:IsA("RemoteFunction")
) then
    GameData.SeedStockv5.Paragraphv5:SetContent(
        "Remote GetShopData tidak ditemukan"
    )
else
    task.spawn(function()
        while task.wait(1) do
            local successv5, datav5 = pcall(function()
                return GameData.SeedStockv5.GetShopDatav5:InvokeServer("SeedShop")
            end)
            if successv5 and datav5 and datav5.Items then
                local textv5 = ""
                for itemNamev5, itemDatav5 in pairs(datav5.Items) do
                    textv5 ..= itemNamev5
                        .. " = "
                        .. itemDatav5.Amount
                        .. "x\n"
                end
                if textv5 == "" then
                    textv5 = "Semua seed habis!"
                end
                GameData.SeedStockv5.Paragraphv5:SetContent(textv5)
            else
                GameData.SeedStockv5.Paragraphv5:SetContent(
                    "Gagal ambil data SeedShop"
                )
            end
        end
    end)
end

-- // Auto Buy Seed

GameData.SeedShopv2.Datav2 = require(
    GameData.Servicesv2.ReplicatedStoragev2
        .Shop
        .ShopData
        .SeedShopData
)

GameData.SeedShopv2.PlantDefinitionsv2 = require(
    GameData.Servicesv2.ReplicatedStoragev2
        :WaitForChild("Plants")
        :WaitForChild("Definitions")
        :WaitForChild("PlantDataDefinitions")
)

GameData.SeedShopv2.Eventv2 =
    GameData.Servicesv2.ReplicatedStoragev2
        .RemoteEvents
        .PurchaseShopItem

GameData.SeedShopv2.GetShopDatav2 =
    GameData.Servicesv2.ReplicatedStoragev2
        .RemoteEvents
        :WaitForChild("GetShopData")

for _, info in pairs(GameData.SeedShopv2.Datav2.ShopData) do
    if info.Name then
        table.insert(GameData.SeedShopv2.SeedOptionsv2, info.Name)
    end
end

do
    local raritySet = {}
    for _, plantData in pairs(GameData.SeedShopv2.PlantDefinitionsv2) do
        local rarity = plantData.Rarity
        if rarity and not raritySet[rarity] then
            raritySet[rarity] = true
            table.insert(GameData.SeedShopv2.RarityOptionsv2, rarity)
        end
    end
    table.sort(GameData.SeedShopv2.RarityOptionsv2)
end

GameData.Fnv2.FindPlayerPlot = function()
    local player = GameData.Servicesv2.PlayerServicev2.LocalPlayer
    for _, plot in pairs(GameData.Plotv2.PlotsFolderv2:GetChildren()) do
        if plot:IsA("Model") and plot:GetAttribute("Owner") == player.UserId then
            return plot
        end
    end
    return nil
end

GameData.Fnv2.CheckSeedStock = function(seedName)
    if not (GameData.SeedShopv2.GetShopDatav2 and GameData.SeedShopv2.GetShopDatav2:IsA("RemoteFunction")) then
        return 0
    end
    local success, data = pcall(function()
        return GameData.SeedShopv2.GetShopDatav2:InvokeServer("SeedShop")
    end)
    if success and data and data.Items then
        for itemName, itemData in pairs(data.Items) do
            if itemName == seedName then
                return itemData.Amount
            end
        end
    end
    return 0
end

GameData.Fnv2.TeleportToShop = function()
    local character = GameData.Servicesv2.PlayerServicev2.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local seedTP = GameData.Teleportv2.SeedsTeleportv2
        character.HumanoidRootPart.CFrame = CFrame.new(seedTP.Position + Vector3.new(0, 3, 0))
        task.wait(0.5)
    end
end

GameData.Fnv2.TeleportToPlot = function()
    local character = GameData.Servicesv2.PlayerServicev2.LocalPlayer.Character
    local plot = GameData.Plotv2.PlayerPlotv2
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    if not plot or not plot:IsA("Model") then return end
    local targetCFrame
    if plot.PrimaryPart then
        targetCFrame = plot.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
    else
        local cf, size = plot:GetBoundingBox()
        targetCFrame = cf + Vector3.new(0, size.Y / 2 + 3, 0)
    end
    character.HumanoidRootPart.CFrame = targetCFrame
    task.wait(0.5)
end

GameData.Fnv2.GetSeedsByRarity = function(selectedRarities)
    local result = {}
    local rarityLookup = {}
    for _, r in ipairs(selectedRarities) do
        rarityLookup[r] = true
    end
    for plantName, plantData in pairs(GameData.SeedShopv2.PlantDefinitionsv2) do
        if plantData.Rarity and rarityLookup[plantData.Rarity] then
            local seedName = plantName .. " Seed"
            for _, shopInfo in pairs(GameData.SeedShopv2.Datav2.ShopData) do
                if shopInfo.Name and shopInfo.Name == seedName then
                    table.insert(result, shopInfo.Name)
                    break
                end
            end
        end
    end
    return result
end

GameData.Fnv2.ResolveSeedList = function()
    local hasRarity = #GameData.SeedShopv2.SelectedRaritiesv2 > 0
    local hasSeed = #GameData.SeedShopv2.SelectedSeedsv2 > 0
    if hasRarity then
        return GameData.Fnv2.GetSeedsByRarity(GameData.SeedShopv2.SelectedRaritiesv2)
    elseif hasSeed then
        return GameData.SeedShopv2.SelectedSeedsv2
    end
    return {}
end

GameData.Fnv2.StartAutoBuy = function()
    GameData.Plotv2.PlayerPlotv2 = GameData.Fnv2.FindPlayerPlot()
    task.spawn(function()
        local atShop = false
        while GameData.SeedShopv2.AutoBuyv2 do
            local seedList = GameData.Fnv2.ResolveSeedList()
            if #seedList == 0 then
                task.wait(2)
                continue
            end
            local anyStockFound = false
            for _, seedName in ipairs(seedList) do
                local stock = GameData.Fnv2.CheckSeedStock(seedName)
                if stock > 0 then
                    anyStockFound = true
                    if not atShop then
                        GameData.Fnv2.TeleportToShop()
                        atShop = true
                    end
                    GameData.SeedShopv2.Eventv2:InvokeServer("SeedShop", seedName)
                    task.wait(0.3)
                end
            end
            if not anyStockFound and atShop then
                GameData.Fnv2.TeleportToPlot()
                atShop = false
            end
            task.wait(1)
        end
        if atShop then
            GameData.Fnv2.TeleportToPlot()
        end
    end)
end

Sec.Seed1:AddDropdown({
    Title = "Select Rarity",
    Content = "Filter seeds by rarity (overrides seed selection)",
    Options = GameData.SeedShopv2.RarityOptionsv2,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.SeedShopv2.SelectedRaritiesv2 = selectedTable
    end
})

Sec.Seed1:AddDropdown({
    Title = "Select Seeds",
    Content = "Choose seeds manually (used only if no rarity selected)",
    Options = GameData.SeedShopv2.SeedOptionsv2,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.SeedShopv2.SelectedSeedsv2 = selectedTable
    end
})

Sec.Seed1:AddToggle({
    Title = "Auto Buy Seed",
    Default = false,
    Callback = function(value)
        GameData.SeedShopv2.AutoBuyv2 = value
        if value then
            Notify("Auto Buy Enabled!", 2)
            GameData.Fnv2.StartAutoBuy()
        else
            Notify("Auto Buy Disabled!", 2)
        end
    end
})

Sec.Gear1 = Tabs.Shop:AddSection({
    Title = "Gear",
    Open = false
})

-- // Info Stock Gear

GameData.GearStockv6.RemoteEventsv6 =
    GameData.Servicesv6.ReplicatedStoragev6:WaitForChild("RemoteEvents")

GameData.GearStockv6.GetShopDatav6 =
    GameData.GearStockv6.RemoteEventsv6:FindFirstChild("GetShopData")

GameData.GearStockv6.Paragraphv6 =
    Sec.Gear1:AddParagraph({
        Title = "Gear Shop Stock",
        Content = "Loading stock..."
    })
if not (
    GameData.GearStockv6.GetShopDatav6
    and GameData.GearStockv6.GetShopDatav6:IsA("RemoteFunction")
) then
    GameData.GearStockv6.Paragraphv6:SetContent(
        "Remote GetShopData tidak ditemukan"
    )

else
    task.spawn(function()
        while task.wait(1) do
            local successv6, datav6 = pcall(function()
                return GameData.GearStockv6.GetShopDatav6:InvokeServer("GearShop")
            end)
            if successv6 and datav6 and datav6.Items then
                local textv6 = ""
                for itemNamev6, itemDatav6 in pairs(datav6.Items) do
                    textv6 ..= itemNamev6
                        .. " = "
                        .. itemDatav6.Amount
                        .. "x\n"
                end
                GameData.GearStockv6.Paragraphv6:SetContent(textv6)
            else
                GameData.GearStockv6.Paragraphv6:SetContent(
                    "Gagal ambil data shop"
                )
            end
        end
    end)
end

-- // Auto Buy Gear

GameData.GearShopv3.Datav3 = require(
    GameData.Servicesv3.ReplicatedStoragev3
        .Shop
        .ShopData
        .GearShopData
)

GameData.GearShopv3.Eventv3 =
    GameData.Servicesv3.ReplicatedStoragev3
        .RemoteEvents
        .PurchaseShopItem

GameData.GearShopv3.GetShopDatav3 =
    GameData.Servicesv3.ReplicatedStoragev3
        .RemoteEvents
        :WaitForChild("GetShopData")

for _, info in pairs(GameData.GearShopv3.Datav3.ShopData) do
    table.insert(GameData.GearShopv3.GearOptionsv3, info.Name)
end

local function FindPlayerPlot()
    local player = GameData.Servicesv3.PlayerServicev3.LocalPlayer
    for _, plot in pairs(GameData.Plotv3.PlotsFolderv3:GetChildren()) do
        if plot:IsA("Model") and plot:GetAttribute("Owner") == player.UserId then
            print("[Plot] Plot ditemukan:", plot.Name)
            return plot
        end
    end
    warn("[Plot] Plot tidak ditemukan!")
    return nil
end

local function CheckGearStock(gearName)
    if not (GameData.GearShopv3.GetShopDatav3 and GameData.GearShopv3.GetShopDatav3:IsA("RemoteFunction")) then
        warn("[Stock] Remote GetShopData tidak valid")
        return 0
    end

    local success, data = pcall(function()
        return GameData.GearShopv3.GetShopDatav3:InvokeServer("GearShop")
    end)

    if success and data and data.Items then
        for itemName, itemData in pairs(data.Items) do
            if itemName == gearName then
                print("[Stock]", gearName, "=", itemData.Amount, "x")
                return itemData.Amount
            end
        end
    else
        warn("[Stock] Gagal ambil data GearShop")
    end

    return 0
end

-- Teleport ke GearNPC
local function TeleportToShop()
    local character = GameData.Servicesv3.PlayerServicev3.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local gearNPC = GameData.Teleportv3.GearNPCv3
        character.HumanoidRootPart.CFrame = CFrame.new(gearNPC.Position + Vector3.new(0, 3, 0))
        print("[TP] Teleport ke GearNPC")
        task.wait(0.5)
    end
end

local function TeleportToPlot()
    local character = GameData.Servicesv3.PlayerServicev3.LocalPlayer.Character
    local plot = GameData.Plotv3.PlayerPlotv3

    if not character or not character:FindFirstChild("HumanoidRootPart") then
        warn("[TP] Character tidak ditemukan")
        return
    end

    if not plot or not plot:IsA("Model") then
        warn("[TP] Plot model tidak valid")
        return
    end

    local targetCFrame

    -- Prioritas 1: PrimaryPart
    if plot.PrimaryPart then
        targetCFrame = plot.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
        print("[TP] Menggunakan PrimaryPart:", plot.PrimaryPart.Name)

    else
        local cf, size = plot:GetBoundingBox()
        targetCFrame = cf + Vector3.new(0, size.Y / 2 + 3, 0)
        print("[TP] Menggunakan BoundingBox model")
    end

    character.HumanoidRootPart.CFrame = targetCFrame
    print("[TP] Kembali ke plot:", plot.Name)
    task.wait(0.5)
end

local function StartAutoBuy()
    GameData.Plotv3.PlayerPlotv3 = FindPlayerPlot()

    task.spawn(function()
        local atShop = false

        while GameData.GearShopv3.AutoBuyv3 do
            local anyStockFound = false

            for _, gearName in ipairs(GameData.GearShopv3.SelectedGearsv3) do
                local stock = CheckGearStock(gearName)

                if stock > 0 then
                    anyStockFound = true

                    if not atShop then
                        TeleportToShop()
                        atShop = true
                    end

                    GameData.GearShopv3.Eventv3:InvokeServer("GearShop", gearName)
                    print("[Buy] Membeli:", gearName)
                    task.wait(0.3)
                else
                    print("[Stock] Stock habis untuk:", gearName)
                end
            end

            if not anyStockFound and atShop then
                print("[Info] Semua stock habis, kembali ke plot")
                TeleportToPlot()
                atShop = false
            end

            task.wait(1)
        end

        if atShop then
            TeleportToPlot()
        end
    end)
end

-- ===== UI =====
Sec.Gear1:AddDropdown({
    Title = "Select Gear",
    Content = "Choose gears to auto buy",
    Options = GameData.GearShopv3.GearOptionsv3,
    Multi = true,
    Default = {},
    Callback = function(selectedTable)
        GameData.GearShopv3.SelectedGearsv3 = selectedTable
        print("[Dropdown] Gears dipilih:")
        for _, gear in ipairs(GameData.GearShopv3.SelectedGearsv3) do
            print("-", gear)
        end
    end
})

Sec.Gear1:AddToggle({
    Title = "Auto Buy Gear",
    Default = false,
    Callback = function(value)
        GameData.GearShopv3.AutoBuyv3 = value
        print("[Toggle] Auto Buy Gear:", value)

        if value then
            Notify("Auto Buy Gear Enabled!", 2)
            StartAutoBuy()
        else
            Notify("Auto Buy Gear Disabled!", 2)
        end
    end
})
