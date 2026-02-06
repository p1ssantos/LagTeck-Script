--[[===================================================
    LagTeck Hub - v1.2 CORRIGIDO
    Sistema completo de Farm + TP funcionando
    Blox Fruits | Mobile + PC
=====================================================]]--

-- =========================
-- SERVIÇOS
-- =========================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

-- =========================
-- VARIÁVEIS GLOBAIS
-- =========================
_G.Settings = {
    AutoFarmLevel = false,
    AutoFarmBoss = false,
    SelectedBoss = "All",
    AutoChest = false,
    FastAttack = false,
    AutoHaki = false,
    AutoFruitSniper = false,
    AutoStoreFruit = false,
    AutoBuyFruit = false,
    SelectedFruit = "Leopard-Leopard",
    AutoRandomFruit = false
}

-- =========================
-- DETECÇÃO DO SEA
-- =========================
local function GetCurrentSea()
    if game.PlaceId == 2753915549 then
        return 1
    elseif game.PlaceId == 4442272183 then
        return 2
    elseif game.PlaceId == 7449423635 then
        return 3
    end
    return 1
end

local Sea = GetCurrentSea()

-- =========================
-- CONFIGURAÇÕES HUB
-- =========================
local Config = {
    Aberto = false,
    Tema = {
        Fundo = Color3.fromRGB(18,18,18),
        Secundario = Color3.fromRGB(25,25,25),
        Botao = Color3.fromRGB(35,35,35),
        Ativo = Color3.fromRGB(0,170,0),
        Texto = Color3.fromRGB(255,255,255)
    }
}

-- =========================
-- LISTAS DE BOSSES POR SEA
-- =========================
local BossListSea1 = {
    "All",
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

local BossListSea2 = {
    "All",
    "Diamond",
    "Jeremy",
    "Fajita",
    "Don Swan",
    "Smoke Admiral",
    "Cursed Captain",
    "Darkbeard",
    "Order",
    "Awakened Ice Admiral"
}

local BossListSea3 = {
    "All",
    "Stone",
    "Island Empress",
    "Kilo Admiral",
    "Captain Elephant",
    "Beautiful Pirate",
    "rip_indra True Form",
    "Longma",
    "Soul Reaper",
    "Cake Queen"
}

local BossList = Sea == 1 and BossListSea1 or Sea == 2 and BossListSea2 or BossListSea3

-- =========================
-- LISTA DE FRUTAS
-- =========================
local FruitList = {
    "Leopard-Leopard",
    "Dragon-Dragon", 
    "Dough-Dough",
    "Shadow-Shadow",
    "Venom-Venom",
    "Control-Control",
    "Spirit-Spirit",
    "Soul-Soul",
    "Gravity-Gravity",
    "Rumble-Rumble",
    "Buddha-Buddha",
    "Light-Light",
    "Dark-Dark",
    "Magma-Magma",
    "Ice-Ice",
    "Quake-Quake",
    "Flame-Flame",
    "Phoenix-Phoenix"
}

-- =========================
-- COORDENADAS DAS ILHAS
-- =========================
local IslandPositions = {
    -- SEA 1
    ["Pirate Starter"] = CFrame.new(1071, 16, 1426),
    ["Marine Starter"] = CFrame.new(-2573, 73, 2046),
    ["Jungle"] = CFrame.new(-1612, 37, 149),
    ["Pirate Village"] = CFrame.new(-1114, 5, 3738),
    ["Desert"] = CFrame.new(945, 7, 4470),
    ["Frozen Village"] = CFrame.new(1200, 105, -1318),
    ["Marine Fortress"] = CFrame.new(-2994, 73, -3125),
    ["Sky Island 1"] = CFrame.new(-4970, 718, -2667),
    ["Sky Island 2"] = CFrame.new(-4813, 718, -2792),
    ["Sky Island 3"] = CFrame.new(-7925, 5545, -380),
    ["Prison"] = CFrame.new(4875, 6, 734),
    ["Colosseum"] = CFrame.new(-1427, 7, -2926),
    ["Magma Village"] = CFrame.new(-5247, 12, 8504),
    ["Underwater City"] = CFrame.new(61164, 5, 1819),
    ["Upper Skylands"] = CFrame.new(-7894, 5547, -379),
    ["Fountain City"] = CFrame.new(-380, 38, 297),
    
    -- SEA 2
    ["Kingdom of Rose"] = CFrame.new(-288, 7, 5579),
    ["Cafe"] = CFrame.new(-377, 73, 298),
    ["Mansion"] = CFrame.new(-12471, 374, -7551),
    ["Graveyard"] = CFrame.new(-5560, 314, -2733),
    ["Snow Mountain"] = CFrame.new(753, 408, -5274),
    ["Hot and Cold"] = CFrame.new(-6100, 16, -5167),
    ["Cursed Ship"] = CFrame.new(923, 125, 32885),
    ["Ice Castle"] = CFrame.new(5665, 88, -6155),
    ["Forgotten Island"] = CFrame.new(-3053, 240, -10145),
    ["Dark Arena"] = CFrame.new(3777, 91, -3000),
    
    -- SEA 3
    ["Port Town"] = CFrame.new(-290, 44, 5343),
    ["Hydra Island"] = CFrame.new(5749, 612, -276),
    ["Great Tree"] = CFrame.new(2681, 1682, -7190),
    ["Castle on the Sea"] = CFrame.new(-5075, 314, -3155),
    ["Haunted Castle"] = CFrame.new(-9515, 142, 5566),
    ["Sea of Treats"] = CFrame.new(-2079, 252, -12375),
    ["Tiki Outpost"] = CFrame.new(-16105, 9, 440)
}

-- Lista de ilhas por Sea
local IslandsSea1 = {
    "Pirate Starter", "Marine Starter", "Jungle", "Pirate Village",
    "Desert", "Frozen Village", "Marine Fortress", "Sky Island 1",
    "Sky Island 2", "Sky Island 3", "Prison", "Colosseum",
    "Magma Village", "Underwater City", "Upper Skylands", "Fountain City"
}

local IslandsSea2 = {
    "Kingdom of Rose", "Cafe", "Mansion", "Graveyard",
    "Snow Mountain", "Hot and Cold", "Cursed Ship", "Ice Castle",
    "Forgotten Island", "Dark Arena"
}

local IslandsSea3 = {
    "Port Town", "Hydra Island", "Great Tree", "Castle on the Sea",
    "Haunted Castle", "Sea of Treats", "Tiki Outpost"
}

local CurrentIslands = Sea == 1 and IslandsSea1 or Sea == 2 and IslandsSea2 or IslandsSea3

-- =========================
-- SISTEMA DE QUESTS
-- =========================
local QuestData = {}

-- SEA 1 QUESTS
if Sea == 1 then
    QuestData = {
        [1] = {Quest = "BanditQuest1", QuestNum = 1, Mob = "Bandit", Pos = CFrame.new(1145, 17, 1634)},
        [10] = {Quest = "JungleQuest", QuestNum = 1, Mob = "Monkey", Pos = CFrame.new(-1448, 50, 38)},
        [15] = {Quest = "BuggyQuest1", QuestNum = 1, Mob = "Pirate", Pos = CFrame.new(-1103, 13, 3896)},
        [30] = {Quest = "BuggyQuest2", QuestNum = 1, Mob = "Brute", Pos = CFrame.new(-1140, 15, 4312)},
        [40] = {Quest = "DesertQuest", QuestNum = 1, Mob = "Desert Bandit", Pos = CFrame.new(945, 7, 4470)},
        [60] = {Quest = "MarineQuest2", QuestNum = 1, Mob = "Chief Petty Officer", Pos = CFrame.new(-4881, 23, 4273)},
        [75] = {Quest = "SnowQuest", QuestNum = 1, Mob = "Snowman", Pos = CFrame.new(1200, 105, -1318)},
        [100] = {Quest = "SnowQuest2", QuestNum = 1, Mob = "Winter Warrior", Pos = CFrame.new(1200, 105, -1318)},
        [120] = {Quest = "MarineQuest3", QuestNum = 1, Mob = "Marine Lieutenant", Pos = CFrame.new(-2994, 73, -3125)},
        [150] = {Quest = "SkyExp1Quest", QuestNum = 1, Mob = "God's Guard", Pos = CFrame.new(-4970, 718, -2667)},
        [175] = {Quest = "SkyExp1Quest", QuestNum = 2, Mob = "Shanda", Pos = CFrame.new(-7863, 5545, -380)},
        [190] = {Quest = "SkyExp2Quest", QuestNum = 1, Mob = "Royal Squad", Pos = CFrame.new(-7906, 5634, -1411)},
        [210] = {Quest = "SkyExp2Quest", QuestNum = 2, Mob = "Royal Soldier", Pos = CFrame.new(-7906, 5634, -1411)},
        [250] = {Quest = "PrisonerQuest", QuestNum = 1, Mob = "Dangerous Prisoner", Pos = CFrame.new(4875, 6, 734)},
        [275] = {Quest = "PrisonerQuest", QuestNum = 2, Mob = "Toga Warrior", Pos = CFrame.new(4875, 6, 734)},
        [300] = {Quest = "ColosseumQuest", QuestNum = 1, Mob = "Gladiator", Pos = CFrame.new(-1427, 7, -2926)},
        [325] = {Quest = "ColosseumQuest", QuestNum = 2, Mob = "Military Soldier", Pos = CFrame.new(-1427, 7, -2926)},
        [350] = {Quest = "MagmaQuest", QuestNum = 1, Mob = "Lava Pirate", Pos = CFrame.new(-5247, 12, 8504)},
        [375] = {Quest = "MagmaQuest", QuestNum = 2, Mob = "Magma Admiral", Pos = CFrame.new(-5247, 12, 8504)},
        [400] = {Quest = "FishmanQuest", QuestNum = 1, Mob = "Fishman Warrior", Pos = CFrame.new(61164, 18, 1609)},
        [450] = {Quest = "FishmanQuest", QuestNum = 2, Mob = "Fishman Commando", Pos = CFrame.new(61164, 18, 1609)}
    }
elseif Sea == 2 then
    QuestData = {
        [700] = {Quest = "Area1Quest", QuestNum = 1, Mob = "Raider", Pos = CFrame.new(-428, 72, 1836)},
        [775] = {Quest = "Area2Quest", QuestNum = 1, Mob = "Mercenary", Pos = CFrame.new(-972, 73, 1833)}
    }
elseif Sea == 3 then
    QuestData = {
        [1500] = {Quest = "PiratePortQuest", QuestNum = 1, Mob = "Pirate Millionaire", Pos = CFrame.new(-290, 44, 5580)}
    }
end

local function GetQuestByLevel(level)
    local selectedQuest = nil
    for lvl, quest in pairs(QuestData) do
        if level >= lvl then
            selectedQuest = quest
        end
    end
    return selectedQuest
end

-- =========================
-- FUNÇÕES CORE
-- =========================
local function Tween(obj, time, props)
    local tween = TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Linear), props)
    tween:Play()
    return tween
end

local function TP(cframe)
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    
    local char = LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    local distance = (hrp.Position - cframe.Position).Magnitude
    
    if distance < 250 then
        hrp.CFrame = cframe
    else
        local tween = Tween(hrp, distance/300, {CFrame = cframe})
        tween.Completed:Wait()
    end
end

local function GetRemote()
    return ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
end

local function EquipWeapon()
    pcall(function()
        for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                if tool.ToolTip == "Melee" or tool.ToolTip == "Sword" or tool.ToolTip == "Blox Fruit" then
                    LocalPlayer.Character.Humanoid:EquipTool(tool)
                    return
                end
            end
        end
    end)
end

local function Click()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(1280, 672))
    end)
end

local function ActivateBuso()
    if not LocalPlayer.Character:FindFirstChild("HasBuso") then
        GetRemote():InvokeServer("Buso")
    end
end

-- =========================
-- FAST ATTACK LOOP
-- =========================
spawn(function()
    while task.wait() do
        if _G.Settings.FastAttack then
            pcall(function()
                Click()
                if _G.Settings.AutoHaki then
                    ActivateBuso()
                end
            end)
        end
    end
end)

-- =========================
-- AUTO FARM LEVEL LOOP
-- =========================
spawn(function()
    while task.wait() do
        if _G.Settings.AutoFarmLevel then
            pcall(function()
                local myLevel = LocalPlayer.Data.Level.Value
                local questInfo = GetQuestByLevel(myLevel)
                
                if not questInfo then return end
                
                -- Verifica se tem a quest ativa
                local questGui = LocalPlayer.PlayerGui.Main.Quest
                
                if not questGui.Visible then
                    -- Pega a quest
                    repeat
                        TP(questInfo.Pos)
                        task.wait(0.5)
                    until (LocalPlayer.Character.HumanoidRootPart.Position - questInfo.Pos.Position).Magnitude < 10 or not _G.Settings.AutoFarmLevel
                    
                    if _G.Settings.AutoFarmLevel then
                        GetRemote():InvokeServer("StartQuest", questInfo.Quest, questInfo.QuestNum)
                        task.wait(1)
                    end
                end
                
                -- Procura e ataca o mob
                if _G.Settings.AutoFarmLevel then
                    for _, mob in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if mob.Name == questInfo.Mob and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                
                                if not _G.Settings.AutoFarmLevel then break end
                                
                                EquipWeapon()
                                
                                -- Bring mob
                                mob.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                mob.HumanoidRootPart.Transparency = 1
                                mob.Humanoid.WalkSpeed = 0
                                mob.Humanoid.JumpPower = 0
                                mob.HumanoidRootPart.CanCollide = false
                                
                                -- Teleporta pro mob
                                LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                
                                -- Ativa ataque
                                _G.Settings.FastAttack = true
                                
                            until not mob.Parent or mob.Humanoid.Health <= 0 or not _G.Settings.AutoFarmLevel or not questGui.Visible
                            
                            _G.Settings.FastAttack = false
                        end
                    end
                end
            end)
        else
            _G.Settings.FastAttack = false
        end
    end
end)

-- =========================
-- AUTO FARM BOSS LOOP
-- =========================
spawn(function()
    while task.wait() do
        if _G.Settings.AutoFarmBoss then
            pcall(function()
                for _, boss in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if boss:FindFirstChild("Humanoid") and boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 then
                        if _G.Settings.SelectedBoss == "All" or boss.Name == _G.Settings.SelectedBoss then
                            repeat
                                task.wait()
                                
                                if not _G.Settings.AutoFarmBoss then break end
                                
                                EquipWeapon()
                                
                                boss.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                boss.HumanoidRootPart.Transparency = 1
                                boss.Humanoid.WalkSpeed = 0
                                
                                LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                
                                _G.Settings.FastAttack = true
                                
                            until not boss.Parent or boss.Humanoid.Health <= 0 or not _G.Settings.AutoFarmBoss
                            
                            _G.Settings.FastAttack = false
                        end
                    end
                end
            end)
        else
            _G.Settings.FastAttack = false
        end
    end
end)

-- =========================
-- AUTO CHEST LOOP
-- =========================
spawn(function()
    while task.wait(0.5) do
        if _G.Settings.AutoChest then
            pcall(function()
                for _, chest in pairs(game:GetService("Workspace"):GetChildren()) do
                    if chest.Name:find("Chest") and (chest:FindFirstChild("Part") or chest:FindFirstChild("MeshPart")) then
                        local chestPart = chest:FindFirstChild("Part") or chest:FindFirstChild("MeshPart")
                        
                        if (LocalPlayer.Character.HumanoidRootPart.Position - chestPart.Position).Magnitude < 5000 then
                            TP(chestPart.CFrame)
                            task.wait(0.5)
                        end
                    end
                end
            end)
        end
    end
end)

-- =========================
-- FRUIT SNIPER
-- =========================
spawn(function()
    while task.wait(1) do
        if _G.Settings.AutoFruitSniper then
            pcall(function()
                for _, fruit in pairs(game:GetService("Workspace"):GetChildren()) do
                    if fruit:IsA("Tool") and fruit:FindFirstChild("Handle") then
                        TP(fruit.Handle.CFrame)
                        task.wait(0.5)
                    end
                end
            end)
        end
    end
end)

-- =========================
-- AUTO STORE FRUIT
-- =========================
spawn(function()
    while task.wait(2) do
        if _G.Settings.AutoStoreFruit then
            pcall(function()
                for _, fruit in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if fruit:IsA("Tool") and fruit:FindFirstChild("Handle") then
                        GetRemote():InvokeServer("StoreFruit", fruit:GetAttribute("OriginalName"), LocalPlayer.Backpack[fruit.Name])
                        task.wait(0.5)
                    end
                end
            end)
        end
    end
end)

-- =========================
-- AUTO BUY FRUIT
-- =========================
spawn(function()
    while task.wait(10) do
        if _G.Settings.AutoBuyFruit then
            pcall(function()
                GetRemote():InvokeServer("PurchaseRawFruit", _G.Settings.SelectedFruit, false)
            end)
        end
    end
end)

-- =========================
-- AUTO RANDOM FRUIT
-- =========================
spawn(function()
    while task.wait(2) do
        if _G.Settings.AutoRandomFruit then
            pcall(function()
                GetRemote():InvokeServer("Cousin", "Buy")
            end)
        end
    end
end)

-- =========================
-- GUI
-- =========================
local Gui = Instance.new("ScreenGui")
Gui.Name = "LagTeckHub"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    game:GetService("CoreGui"):FindFirstChild("LagTeckHub"):Destroy()
end)

Gui.Parent = game:GetService("CoreGui")

-- =========================
-- BOLINHA
-- =========================
local Bubble = Instance.new("ImageButton", Gui)
Bubble.Size = UDim2.fromOffset(60,60)
Bubble.Position = UDim2.fromScale(0.05,0.5)
Bubble.Image = "rbxassetid://118708232212462"
Bubble.BackgroundColor3 = Config.Tema.Botao
Bubble.BorderSizePixel = 0
Bubble.Active = true
Bubble.Draggable = true
Bubble.ScaleType = Enum.ScaleType.Fit

Instance.new("UICorner", Bubble).CornerRadius = UDim.new(1,0)

-- =========================
-- MAIN WINDOW
-- =========================
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.fromScale(0,0)
Main.Position = UDim2.fromScale(0.5,0.5)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = Config.Tema.Fundo
Main.BackgroundTransparency = 0.35
Main.BorderSizePixel = 0
Main.Visible = false

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)

-- =========================
-- TOP BAR
-- =========================
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,45)
Top.BackgroundColor3 = Config.Tema.Secundario
Top.BackgroundTransparency = 0.2
Top.BorderSizePixel = 0

Instance.new("UICorner", Top).CornerRadius = UDim.new(0,16)

local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1,-80,1,0)
Title.Position = UDim2.fromOffset(10,0)
Title.Text = "Lag Teck"
Title.TextColor3 = Config.Tema.Texto
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

local SeaLabel = Instance.new("TextLabel", Top)
SeaLabel.Size = UDim2.fromOffset(80,35)
SeaLabel.Position = UDim2.new(1, -120, 0.5, -17.5)
SeaLabel.Text = "SEA " .. Sea
SeaLabel.TextColor3 = Color3.new(1,1,1)
SeaLabel.BackgroundColor3 = Config.Tema.Ativo
SeaLabel.Font = Enum.Font.GothamBold
SeaLabel.TextSize = 14
SeaLabel.BorderSizePixel = 0

Instance.new("UICorner", SeaLabel).CornerRadius = UDim.new(0, 8)

local CloseBtn = Instance.new("TextButton", Top)
CloseBtn.Size = UDim2.fromOffset(35, 35)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -17.5)
CloseBtn.Text = "✕"
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
CloseBtn.BorderSizePixel = 0

Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

-- =========================
-- BODY
-- =========================
local Body = Instance.new("Frame", Main)
Body.Position = UDim2.fromOffset(0,50)
Body.Size = UDim2.new(1,0,1,-50)
Body.BackgroundTransparency = 1

-- =========================
-- SEARCH
-- =========================
local Search = Instance.new("TextBox", Body)
Search.Size = UDim2.new(1,-20,0,35)
Search.Position = UDim2.fromOffset(10,5)
Search.PlaceholderText = "🔍 Pesquisar..."
Search.Text = ""
Search.BackgroundColor3 = Config.Tema.Botao
Search.BackgroundTransparency = 0.3
Search.TextColor3 = Config.Tema.Texto
Search.BorderSizePixel = 0
Search.Font = Enum.Font.Gotham
Search.TextSize = 14

Instance.new("UICorner", Search).CornerRadius = UDim.new(0,10)

-- =========================
-- TABS
-- =========================
local TabBar = Instance.new("ScrollingFrame", Body)
TabBar.Position = UDim2.fromOffset(10,45)
TabBar.Size = UDim2.new(0,110,1,-55)
TabBar.BackgroundTransparency = 1
TabBar.BorderSizePixel = 0
TabBar.ScrollBarThickness = 4
TabBar.CanvasSize = UDim2.fromOffset(0, 0)

local TabLayout = Instance.new("UIListLayout", TabBar)
TabLayout.Padding = UDim.new(0,6)

TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    TabBar.CanvasSize = UDim2.fromOffset(0, TabLayout.AbsoluteContentSize.Y + 10)
end)

local Content = Instance.new("Frame", Body)
Content.Position = UDim2.fromOffset(130,45)
Content.Size = UDim2.new(1,-140,1,-55)
Content.BackgroundTransparency = 1

local Tabs = {}

-- =========================
-- CRIAR ABA
-- =========================
local function CriarAba(nome)
    local Btn = Instance.new("TextButton", TabBar)
    Btn.Size = UDim2.new(1,0,0,38)
    Btn.Text = nome
    Btn.BackgroundColor3 = Config.Tema.Botao
    Btn.BackgroundTransparency = 0.3
    Btn.TextColor3 = Config.Tema.Texto
    Btn.BorderSizePixel = 0
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 12
    Btn.AutoButtonColor = false

    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,8)

    local Frame = Instance.new("ScrollingFrame", Content)
    Frame.Size = UDim2.fromScale(1,1)
    Frame.CanvasSize = UDim2.fromScale(0,0)
    Frame.ScrollBarThickness = 6
    Frame.ScrollBarImageColor3 = Config.Tema.Ativo
    Frame.Visible = false
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0

    local Layout = Instance.new("UIListLayout", Frame)
    Layout.Padding = UDim.new(0,8)
    
    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Frame.CanvasSize = UDim2.fromOffset(0, Layout.AbsoluteContentSize.Y + 10)
    end)

    Btn.MouseButton1Click:Connect(function()
        for _,v in pairs(Tabs) do
            v.Frame.Visible = false
            Tween(v.Btn, 0.2, {BackgroundColor3 = Config.Tema.Botao})
        end
        Frame.Visible = true
        Tween(Btn, 0.2, {BackgroundColor3 = Config.Tema.Ativo})
    end)

    Tabs[nome] = {Frame = Frame, Btn = Btn}
    return Frame
end

-- =========================
-- COMPONENTES
-- =========================
local function Toggle(parent, texto, callback)
    local Box = Instance.new("Frame", parent)
    Box.Size = UDim2.new(1,0,0,45)
    Box.BackgroundColor3 = Config.Tema.Botao
    Box.BackgroundTransparency = 0.3
    Box.BorderSizePixel = 0
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0,8)

    local Label = Instance.new("TextLabel", Box)
    Label.Size = UDim2.new(1,-60,1,0)
    Label.Position = UDim2.fromOffset(12,0)
    Label.Text = texto
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Config.Tema.Texto
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Btn = Instance.new("TextButton", Box)
    Btn.Size = UDim2.fromOffset(40,20)
    Btn.Position = UDim2.new(1,-50,0.5,-10)
    Btn.BackgroundColor3 = Color3.fromRGB(120,120,120)
    Btn.Text = ""
    Btn.BorderSizePixel = 0
    Btn.AutoButtonColor = false
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(1,0)
    
    local Circle = Instance.new("Frame", Btn)
    Circle.Size = UDim2.fromOffset(16,16)
    Circle.Position = UDim2.fromOffset(2,2)
    Circle.BackgroundColor3 = Color3.new(1,1,1)
    Circle.BorderSizePixel = 0
    Instance.new("UICorner", Circle).CornerRadius = UDim.new(1,0)
    
    local enabled = false
    
    Btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        
        if enabled then
            Tween(Circle, 0.2, {Position = UDim2.fromOffset(22,2)})
            Tween(Btn, 0.2, {BackgroundColor3 = Config.Tema.Ativo})
        else
            Tween(Circle, 0.2, {Position = UDim2.fromOffset(2,2)})
            Tween(Btn, 0.2, {BackgroundColor3 = Color3.fromRGB(120,120,120)})
        end
        
        if callback then
            spawn(function() callback(enabled) end)
        end
    end)
end

local function Dropdown(parent, texto, options, callback)
    local Box = Instance.new("Frame", parent)
    Box.Size = UDim2.new(1,0,0,45)
    Box.BackgroundColor3 = Config.Tema.Botao
    Box.BackgroundTransparency = 0.3
    Box.BorderSizePixel = 0
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0,8)

    local Label = Instance.new("TextLabel", Box)
    Label.Size = UDim2.new(0.5,0,1,0)
    Label.Position = UDim2.fromOffset(12,0)
    Label.Text = texto
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Config.Tema.Texto
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Btn = Instance.new("TextButton", Box)
    Btn.Size = UDim2.new(0.45,-10,0,35)
    Btn.Position = UDim2.new(0.55,0,0.5,-17.5)
    Btn.Text = options[1]
    Btn.BackgroundColor3 = Config.Tema.Secundario
    Btn.BackgroundTransparency = 0.2
    Btn.TextColor3 = Config.Tema.Texto
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 11
    Btn.BorderSizePixel = 0
    Btn.TextTruncate = Enum.TextTruncate.AtEnd
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,6)
    
    local DropScroll = Instance.new("ScrollingFrame", Gui)
    DropScroll.Size = UDim2.new(0,200,0,0)
    DropScroll.Position = UDim2.new(0.55,0,0.5,0)
    DropScroll.BackgroundColor3 = Config.Tema.Secundario
    DropScroll.BorderSizePixel = 0
    DropScroll.Visible = false
    DropScroll.ZIndex = 100
    DropScroll.ScrollBarThickness = 4
    DropScroll.CanvasSize = UDim2.fromOffset(0, #options * 35)
    Instance.new("UICorner", DropScroll).CornerRadius = UDim.new(0,6)
    
    local DropLayout = Instance.new("UIListLayout", DropScroll)
    DropLayout.Padding = UDim.new(0,2)
    
    local isOpen = false
    
    Btn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        DropScroll.Visible = isOpen
        
        if isOpen then
            local btnPos = Btn.AbsolutePosition
            DropScroll.Position = UDim2.fromOffset(btnPos.X, btnPos.Y + 40)
            DropScroll.Size = UDim2.new(0,200,0,math.min(#options * 35, 200))
        end
    end)
    
    for _, option in pairs(options) do
        local OptBtn = Instance.new("TextButton", DropScroll)
        OptBtn.Size = UDim2.new(1,0,0,33)
        OptBtn.Text = option
        OptBtn.BackgroundColor3 = Config.Tema.Botao
        OptBtn.TextColor3 = Config.Tema.Texto
        OptBtn.Font = Enum.Font.Gotham
        OptBtn.TextSize = 11
        OptBtn.BorderSizePixel = 0
        OptBtn.TextTruncate = Enum.TextTruncate.AtEnd
        
        OptBtn.MouseButton1Click:Connect(function()
            Btn.Text = option
            DropScroll.Visible = false
            isOpen = false
            
            if callback then
                spawn(function() callback(option) end)
            end
        end)
    end
end

local function Button(parent, texto, callback)
    local Btn = Instance.new("TextButton", parent)
    Btn.Size = UDim2.new(1,0,0,45)
    Btn.Text = texto
    Btn.BackgroundColor3 = Config.Tema.Ativo
    Btn.BackgroundTransparency = 0.3
    Btn.TextColor3 = Config.Tema.Texto
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 14
    Btn.BorderSizePixel = 0
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,8)
    
    Btn.MouseButton1Click:Connect(function()
        if callback then
            spawn(function() callback() end)
        end
    end)
end

-- =========================
-- CRIANDO ABAS
-- =========================
local FarmTab = CriarAba("🌴 Farm")
local CombatTab = CriarAba("⚔️ Combat")
local FruitTab = CriarAba("🍏 Frutas")
local TeleportTab = CriarAba("🧭 TP")
local SeaEventTab = CriarAba("🦈 Sea Event")
local VisualTab = CriarAba("👁️ ESP")
local PlayerTab = CriarAba("🛡️ Player")
local ConfigTab = CriarAba("⚙️ Config")

Tabs["🌴 Farm"].Frame.Visible = true
Tween(Tabs["🌴 Farm"].Btn, 0.2, {BackgroundColor3 = Config.Tema.Ativo})

-- =========================
-- ABA FARM
-- =========================
Toggle(FarmTab, "Auto Farm Level", function(v)
    _G.Settings.AutoFarmLevel = v
end)

Toggle(FarmTab, "Auto Farm Boss", function(v)
    _G.Settings.AutoFarmBoss = v
end)

Dropdown(FarmTab, "Boss", BossList, function(v)
    _G.Settings.SelectedBoss = v
end)

Toggle(FarmTab, "Auto Chest", function(v)
    _G.Settings.AutoChest = v
end)

-- =========================
-- ABA COMBAT
-- =========================
Toggle(CombatTab, "Fast Attack", function(v)
    _G.Settings.FastAttack = v
end)

Toggle(CombatTab, "Auto Haki", function(v)
    _G.Settings.AutoHaki = v
end)

-- =========================
-- ABA FRUTAS
-- =========================
Toggle(FruitTab, "Girar Frutas (Random)", function(v)
    _G.Settings.AutoRandomFruit = v
end)

Toggle(FruitTab, "Ir Atrás de Frutas", function(v)
    _G.Settings.AutoFruitSniper = v
end)

Toggle(FruitTab, "Auto Guardar Fruta", function(v)
    _G.Settings.AutoStoreFruit = v
end)

Toggle(FruitTab, "Auto Comprar Fruta", function(v)
    _G.Settings.AutoBuyFruit = v
end)

Dropdown(FruitTab, "Fruta", FruitList, function(v)
    _G.Settings.SelectedFruit = v
end)

Button(FruitTab, "📊 Espiar Loja Normal", function()
    local fruits = GetRemote():InvokeServer("GetFruits")
    print("=== LOJA NORMAL ===")
    for i,v in pairs(fruits) do
        print(v.Name, "-", v.Price)
    end
end)

Button(FruitTab, "🌀 Espiar Loja Miragem", function()
    GetRemote():InvokeServer("GetFruits", LocalPlayer.Character.PrimaryPart.CFrame, true)
end)

-- =========================
-- ABA TELEPORT
-- =========================
for _, island in ipairs(CurrentIslands) do
    Button(TeleportTab, island, function()
        if IslandPositions[island] then
            TP(IslandPositions[island])
        else
            warn("Coordenadas não encontradas para:", island)
        end
    end)
end

-- =========================
-- ABA PLAYER
-- =========================
Toggle(PlayerTab, "Anti AFK", function(v)
    if v then
        LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end)

-- =========================
-- ANIMAÇÃO
-- =========================
local function OpenHub()
    if Config.Aberto then return end
    Config.Aberto = true
    
    Main.Visible = true
    Main.Size = UDim2.fromScale(0,0)
    Main.BackgroundTransparency = 1
    
    Tween(Main, 0.4, {
        Size = UDim2.fromScale(0.75,0.7),
        BackgroundTransparency = 0.35
    })
end

local function CloseHub()
    if not Config.Aberto then return end
    
    Tween(Main, 0.3, {
        Size = UDim2.fromScale(0,0),
        BackgroundTransparency = 1
    })
    
    task.wait(0.3)
    Main.Visible = false
    Config.Aberto = false
end

Bubble.MouseButton1Click:Connect(function()
    if Config.Aberto then
        CloseHub()
    else
        OpenHub()
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    CloseHub()
end)

-- =========================
-- INIT
-- =========================
task.wait(1)
print("🚀 Lag Teck Hub v1.2 LOADED!")
print("✅ Sea:", Sea)
print("📱 Mobile + PC")
print("🎯 Auto Farm: FIXED")
print("🗺️ Teleport: WORKING")

OpenHub()
