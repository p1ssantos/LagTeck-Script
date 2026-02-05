-- ═══════════════════════════════════════════════════════════════
-- PARTE 2: AUTO 600 MASTERY + BOSSES + ITEMS
-- ═══════════════════════════════════════════════════════════════

-- Variáveis para Mastery
_G.Settings.AutoFarmMastery = {
    Enabled = false,
    TargetMastery = 600,
    SelectedWeapon = "Combat",
    Mode = "Quest" -- "Quest" ou "Nearest"
}

-- Variáveis para Bosses
_G.Settings.AutoBoss = {
    Enabled = false,
    SelectedBoss = "",
    AutoFarmAllBoss = false
}

-- Variáveis para Items
_G.Settings.AutoItem = {
    FarmBone = false,
    FarmCake = false,
    FarmEctoplasm = false,
    FarmDoughKingKey = false
}

-- Lista de Bosses por World
_G.BossList = {}

if _G.World1 then
    _G.BossList = {
        "The Gorilla King",
        "Bobby",
        "Yeti",
        "Mob Leader",
        "Vice Admiral",
        "Warden",
        "Chief Warden",
        "Swan",
        "Magma Admiral",
        "Fishman Lord",
        "Wysper",
        "Thunder God",
        "Cyborg"
    }
elseif _G.World2 then
    _G.BossList = {
        "Diamond",
        "Jeremy",
        "Fajita",
        "Don Swan",
        "Smoke Admiral",
        "Cursed Captain",
        "Darkbeard",
        "Order",
        "Awakened Ice Admiral",
        "Tide Keeper"
    }
elseif _G.World3 then
    _G.BossList = {
        "Stone",
        "Island Empress",
        "Kilo Admiral",
        "Captain Elephant",
        "Beautiful Pirate",
        "rip_indra True Form",
        "Longma",
        "Soul Reaper",
        "Cake Queen",
        "Dough King"
    }
end

-- ═══════════════════════════════════════════════════════════════
-- TAB: MASTERY
-- ═══════════════════════════════════════════════════════════════

local MasteryTab = Window:AddTab({ Title = "🎯 Mastery", Icon = "target" })

MasteryTab:AddSection("🎯 Farm Mastery Automático")

-- Seleção de Arma para Mastery
local MasteryWeaponDropdown = MasteryTab:AddDropdown("MasteryWeapon", {
    Title = "Selecionar Arma para Mastery",
    Values = GetWeaponsByCategory()["Luta"],
    Default = "Combat",
    Callback = function(Value)
        _G.Settings.AutoFarmMastery.SelectedWeapon = Value
    end
})

-- Slider de Target Mastery
local MasteryTargetSlider = MasteryTab:AddSlider("MasteryTarget", {
    Title = "Mastery Alvo",
    Min = 100,
    Max = 600,
    Default = 600,
    Rounding = 50,
    Callback = function(Value)
        _G.Settings.AutoFarmMastery.TargetMastery = Value
    end
})

-- Toggle Auto Farm Mastery
local AutoMasteryToggle = MasteryTab:AddToggle("AutoMastery", {
    Title = "🎯 Auto Farm Mastery",
    Description = "Farma até atingir o mastery desejado",
    Default = false,
    Callback = function(Value)
        _G.Settings.AutoFarmMastery.Enabled = Value
    end
})

-- Modo de Farm Mastery
local MasteryModeDropdown = MasteryTab:AddDropdown("MasteryMode", {
    Title = "Modo de Farm",
    Values = {"Quest", "Nearest"},
    Default = "Quest",
    Callback = function(Value)
        _G.Settings.AutoFarmMastery.Mode = Value
    end
})

-- Função para verificar Mastery
function GetWeaponMastery(WeaponName)
    local success, result = pcall(function()
        return ReplicatedStorage.Remotes.CommF_:InvokeServer("WeaponMastery", WeaponName)
    end)
    if success then
        return result or 0
    end
    return 0
end

-- Mostrar Mastery Atual
local CurrentMasteryLabel = MasteryTab:AddParagraph({
    Title = "📊 Mastery Atual",
    Content = "Selecione uma arma para ver o mastery"
})

task.spawn(function()
    while task.wait(2) do
        if _G.Settings.AutoFarmMastery.SelectedWeapon then
            local currentMastery = GetWeaponMastery(_G.Settings.AutoFarmMastery.SelectedWeapon)
            CurrentMasteryLabel:SetDesc(string.format("⭐ %d / %d", currentMastery, _G.Settings.AutoFarmMastery.TargetMastery))
        end
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- TAB: BOSSES
-- ═══════════════════════════════════════════════════════════════

local BossTab = Window:AddTab({ Title = "👹 Bosses", Icon = "skull" })

BossTab:AddSection("👹 Farm de Bosses")

-- Seleção de Boss
local BossDropdown = BossTab:AddDropdown("BossSelect", {
    Title = "Selecionar Boss",
    Values = _G.BossList,
    Default = _G.BossList[1] or "",
    Callback = function(Value)
        _G.Settings.AutoBoss.SelectedBoss = Value
    end
})

-- Toggle Auto Farm Boss
local AutoBossToggle = BossTab:AddToggle("AutoBoss", {
    Title = "👹 Auto Farm Boss Selecionado",
    Description = "Farma o boss selecionado automaticamente",
    Default = false,
    Callback = function(Value)
        _G.Settings.AutoBoss.Enabled = Value
    end
})

-- Toggle Farm All Bosses
local AutoAllBossToggle = BossTab:AddToggle("AutoAllBoss", {
    Title = "🔥 Auto Farm Todos os Bosses",
    Description = "Farma todos os bosses disponíveis",
    Default = false,
    Callback = function(Value)
        _G.Settings.AutoBoss.AutoFarmAllBoss = Value
    end
})

-- Função para encontrar Boss
function FindBoss(bossName)
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == bossName and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    
    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if v.Name == bossName then
            return v
        end
    end
    
    return nil
end

-- Função para pegar Boss Positions
function GetBossPosition(bossName)
    local BossPositions = {
        -- World 1
        ["The Gorilla King"] = CFrame.new(-1129.88367, 40.4635468, -525.423706),
        ["Bobby"] = CFrame.new(-1147.46289, 13.2039595, 4086.11572),
        ["Yeti"] = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625),
        ["Mob Leader"] = CFrame.new(-2844.7307, 7.4180684, 5356.6353),
        ["Vice Admiral"] = CFrame.new(-5020.49219, 28.6520386, 4324.50293),
        ["Warden"] = CFrame.new(5278.04932, 2.89587474, 747.071533),
        ["Chief Warden"] = CFrame.new(5206.92578, 0.836054921, 814.520691),
        ["Swan"] = CFrame.new(5348.92773, 604.870605, 199.059906),
        ["Magma Admiral"] = CFrame.new(-5530.12207, 22.8769703, 8449.96582),
        ["Fishman Lord"] = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734),
        ["Wysper"] = CFrame.new(-7925.48389, 5550.76074, -636.178345),
        ["Thunder God"] = CFrame.new(-7749.69043, 5607.58984, -2305.42456),
        ["Cyborg"] = CFrame.new(6041.82617, 52.7112198, -1374.26489),
        
        -- World 2
        ["Diamond"] = CFrame.new(-1576.7003173828, 198.59265136719, -3.0251293182373),
        ["Jeremy"] = CFrame.new(2194.47217, 448.931641, 853.302002),
        ["Fajita"] = CFrame.new(-2085.27295, 73.0055847, -4208.41602),
        ["Don Swan"] = CFrame.new(2288.802, 15.1870775, 863.034607),
        ["Smoke Admiral"] = CFrame.new(-5115.72754, 23.7664986, -5338.2207),
        ["Cursed Captain"] = CFrame.new(916.928589, 181.092773, 33422),
        ["Darkbeard"] = CFrame.new(3677.08203, 62.751937866211, -3144.8332519531),
        ["Order"] = CFrame.new(-6217.2021484375, 52.187705993652344, -4864.451171875),
        ["Awakened Ice Admiral"] = CFrame.new(6407.33936, 340.223785, -6892.521),
        ["Tide Keeper"] = CFrame.new(-3570.18652, 123.328949, -11555.9072),
        
        -- World 3
        ["Stone"] = CFrame.new(-1049.25, 40.0495033, -4748.47266),
        ["Island Empress"] = CFrame.new(5713.98877, 601.922974, 202.751251),
        ["Kilo Admiral"] = CFrame.new(2889.35986, 423.503174, -7230.17529),
        ["Captain Elephant"] = CFrame.new(-13485.0283, 331.709259, -8012.4873),
        ["Beautiful Pirate"] = CFrame.new(5283.609375, 22.56223487854, -11.817522048950195),
        ["rip_indra True Form"] = CFrame.new(-5415.42383, 313.9888, -2823.41479),
        ["Longma"] = CFrame.new(-10238.875, 389.7912902832, -9549.7939453125),
        ["Soul Reaper"] = CFrame.new(-9515.62109, 315.925537, 6691.12012),
        ["Cake Queen"] = CFrame.new(-821.66284179688, 64.520835876465, -12319.46484375),
        ["Dough King"] = CFrame.new(-2151.82153, 149.315704, -12404.9053)
    }
    
    return BossPositions[bossName] or CFrame.new(0, 50, 0)
end

-- ═══════════════════════════════════════════════════════════════
-- TAB: ITEMS
-- ═══════════════════════════════════════════════════════════════

local ItemTab = Window:AddTab({ Title = "💎 Items", Icon = "package" })

ItemTab:AddSection("💎 Farm de Items Raros")

-- Auto Farm Bone
local AutoBoneToggle = ItemTab:AddToggle("AutoBone", {
    Title = "🦴 Auto Farm Bone",
    Description = "Farma ossos automaticamente",
    Default = false,
    Callback = function(Value)
        _G.Settings.AutoItem.FarmBone = Value
    end
})

-- Auto Farm Cake
local AutoCakeToggle = ItemTab:AddToggle("AutoCake", {
    Title = "🍰 Auto Farm Cake Prince",
    Description = "Farma Cake Prince automaticamente",
    Default = false,
    Callback = function(Value)
        _G.Settings.AutoItem.FarmCake = Value
    end
})

-- Auto Farm Ectoplasm
local AutoEctoToggle = ItemTab:AddToggle("AutoEcto", {
    Title = "👻 Auto Farm Ectoplasm",
    Description = "Farma ectoplasma automaticamente",
    Default = false,
    Callback = function(Value)
        _G.Settings.AutoItem.FarmEctoplasm = Value
    end
})

-- Status de Items
local ItemStatusSection = ItemTab:AddSection("📊 Status de Items")

local ItemLabels = {
    Bone = ItemTab:AddParagraph({Title = "🦴 Bone", Content = "Carregando..."}),
    Ectoplasm = ItemTab:AddParagraph({Title = "👻 Ectoplasm", Content = "Carregando..."}),
}

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local Bone = LocalPlayer.Backpack:FindFirstChild("Bone") or LocalPlayer.Character:FindFirstChild("Bone")
            local Ecto = LocalPlayer.Backpack:FindFirstChild("Ectoplasm") or LocalPlayer.Character:FindFirstChild("Ectoplasm")
            
            ItemLabels.Bone:SetDesc(Bone and "✅ Possui" or "❌ Não possui")
            ItemLabels.Ectoplasm:SetDesc(Ecto and "✅ Possui" or "❌ Não possui")
        end)
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- LOOPS: MASTERY, BOSSES, ITEMS
-- ═══════════════════════════════════════════════════════════════

-- Loop Auto Farm Mastery
task.spawn(function()
    while task.wait() do
        if _G.Settings.AutoFarmMastery.Enabled then
            pcall(function()
                local currentMastery = GetWeaponMastery(_G.Settings.AutoFarmMastery.SelectedWeapon)
                
                if currentMastery >= _G.Settings.AutoFarmMastery.TargetMastery then
                    Fluent:Notify({
                        Title = "✅ Mastery Completo!",
                        Content = string.format("%s atingiu %d de mastery!", 
                            _G.Settings.AutoFarmMastery.SelectedWeapon, 
                            _G.Settings.AutoFarmMastery.TargetMastery),
                        Duration = 5
                    })
                    _G.Settings.AutoFarmMastery.Enabled = false
                    return
                end
                
                if _G.Settings.AutoFarmMastery.Mode == "Quest" then
                    CheckQuest()
                    
                    local QuestActive = LocalPlayer.PlayerGui.Main.Quest.Visible
                    
                    if not QuestActive then
                        topos(CFrameQuest)
                        if (CFrameQuest.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1)
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        end
                    else
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == Mon and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    if _G.Settings.AutoHaki then AutoHaki() end
                                    EquipWeapon(_G.Settings.AutoFarmMastery.SelectedWeapon)
                                    
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    _G.PosMon = v.HumanoidRootPart.CFrame
                                    _G.StartMagnet = true
                                    
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                until not _G.Settings.AutoFarmMastery.Enabled or not v.Parent or v.Humanoid.Health <= 0
                                
                                _G.StartMagnet = false
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Loop Auto Farm Boss
task.spawn(function()
    while task.wait() do
        if _G.Settings.AutoBoss.Enabled and _G.Settings.AutoBoss.SelectedBoss ~= "" then
            pcall(function()
                local boss = FindBoss(_G.Settings.AutoBoss.SelectedBoss)
                
                if boss and boss:FindFirstChild("Humanoid") and boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 then
                    repeat task.wait()
                        if _G.Settings.AutoHaki then AutoHaki() end
                        EquipWeapon(_G.Settings.SelectWeapon)
                        
                        boss.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        boss.HumanoidRootPart.CanCollide = false
                        boss.Humanoid.WalkSpeed = 0
                        
                        topos(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    until not _G.Settings.AutoBoss.Enabled or not boss.Parent or boss.Humanoid.Health <= 0
                else
                    -- Boss não encontrado, ir para spawn
                    local bossPos = GetBossPosition(_G.Settings.AutoBoss.SelectedBoss)
                    topos(bossPos)
                end
            end)
        end
    end
end)

-- Loop Auto Farm All Bosses
task.spawn(function()
    while task.wait() do
        if _G.Settings.AutoBoss.AutoFarmAllBoss then
            pcall(function()
                for _, bossName in pairs(_G.BossList) do
                    local boss = FindBoss(bossName)
                    
                    if boss and boss:FindFirstChild("Humanoid") and boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 then
                        _G.Settings.AutoBoss.SelectedBoss = bossName
                        
                        repeat task.wait()
                            if _G.Settings.AutoHaki then AutoHaki() end
                            EquipWeapon(_G.Settings.SelectWeapon)
                            
                            boss.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            boss.HumanoidRootPart.CanCollide = false
                            boss.Humanoid.WalkSpeed = 0
                            
                            topos(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        until not _G.Settings.AutoBoss.AutoFarmAllBoss or not boss.Parent or boss.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

-- Loop Auto Farm Bone
task.spawn(function()
    while task.wait() do
        if _G.Settings.AutoItem.FarmBone then
            pcall(function()
                local BoneMobs = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                
                for _, mobName in pairs(BoneMobs) do
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == mobName and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                if _G.Settings.AutoHaki then AutoHaki() end
                                EquipWeapon(_G.Settings.SelectWeapon)
                                
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                _G.PosMon = v.HumanoidRootPart.CFrame
                                _G.StartMagnet = true
                                
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                            until not _G.Settings.AutoItem.FarmBone or not v.Parent or v.Humanoid.Health <= 0
                            
                            _G.StartMagnet = false
                        end
                    end
                end
            end)
        end
    end
end)

-- Loop Auto Farm Ectoplasm
task.spawn(function()
    while task.wait() do
        if _G.Settings.AutoItem.FarmEctoplasm then
            pcall(function()
                local EctoMobs = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
                
                for _, mobName in pairs(EctoMobs) do
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == mobName and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                if _G.Settings.AutoHaki then AutoHaki() end
                                EquipWeapon(_G.Settings.SelectWeapon)
                                
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                _G.PosMon = v.HumanoidRootPart.CFrame
                                _G.StartMagnet = true
                                
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                            until not _G.Settings.AutoItem.FarmEctoplasm or not v.Parent or v.Humanoid.Health <= 0
                            
                            _G.StartMagnet = false
                        end
                    end
                end
            end)
        end
    end
end)
