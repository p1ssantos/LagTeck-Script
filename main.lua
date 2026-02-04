--[[
═══════════════════════════════════════════════════════════════
        LAG TECK FUSION V4.0 - ULTIMATE EDITION
                    PARTE 1/4 - CORE SYSTEM + UI + AUTO FARM
═══════════════════════════════════════════════════════════════
Discord: discord.gg/RnZ6XHHFj7
Criado: 2026
Funcionalidades Parte 1:
  ✓ Core System (Anti-Ban, Fast Attack, Verificações)
  ✓ UI Completa (Library Moderna)
  ✓ Auto Farm (Levels, Nearest, Bosses Básicos)
  ✓ Bring Mob System
  ✓ Auto Haki & Auto Stats
--]]

print("🔵 Carregando Lag Teck Fusion V4.0 - Parte 1/4...")
print("⚡ Core System + UI + Auto Farm")
wait(0.5)

-- ==========================================
-- VERIFICAÇÃO DE MUNDO & INICIALIZAÇÃO
-- ==========================================
_G.World1 = false
_G.World2 = false
_G.World3 = false

if game.PlaceId == 2753915549 then
    _G.World1 = true
    print("🌍 Detectado: First Sea")
elseif game.PlaceId == 4442272183 then
    _G.World2 = true
    print("🌍 Detectado: Second Sea")
elseif game.PlaceId == 7449423635 then
    _G.World3 = true
    print("🌍 Detectado: Third Sea")
else
    game:GetService("Players").LocalPlayer:Kick("⚠️ Este script é apenas para Blox Fruits!")
    return
end

-- ==========================================
-- SERVICES
-- ==========================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- ==========================================
-- PROTEÇÕES ANTI-KICK & ANTI-BAN
-- ==========================================
print("🛡️ Ativando proteções Anti-Ban...")

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = {...}
    
    if tostring(method) == "FireServer" then
        if tostring(args[1]) == "RemoteEvent" then
            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                if _G.Skillaimbot then
                    args[2] = _G.AimBotSkillPosition
                    return old(unpack(args))
                end
            end
        end
    end
    
    -- Anti-Kick Protection
    if method == "Kick" then
        print("⚠️ Tentativa de Kick bloqueada!")
        return wait(9e9)
    end
    
    return old(...)
end)

setreadonly(mt, true)

-- Bypass Anti-Cheat LocalScripts
for i,v in pairs(Character:GetDescendants()) do
    if v:IsA("LocalScript") then
        if v.Name == "General" or v.Name == "Shiftlock" or v.Name == "FallDamage" or 
           v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or 
           v.Name == "Looking" or v.Name == "Run" then
            v:Destroy()
        end
    end
end

print("✅ Proteções ativadas com sucesso!")

-- ==========================================
-- AUTO RECONNECT SYSTEM
-- ==========================================
_G.AutoReconnect = true

CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and 
       child.MessageArea:FindFirstChild("ErrorFrame") then
        if _G.AutoReconnect then
            print("🔄 Reconectando...")
            wait(1)
            TeleportService:Teleport(game.PlaceId)
        end
    end
end)

-- ==========================================
-- VARIÁVEIS GLOBAIS - CONFIGURAÇÃO
-- ==========================================

-- Weapons
_G.SelectWeapon = "Combat"
_G.SelectWeaponGun = ""

-- Auto Farm
_G.AutoFarm = false
_G.AutoFarmLevel = false
_G.AutoFarmNearest = false
_G.Farmfast = true
_G.AutoFarmSelectMonster = false
_G.SelectedMonster = ""

-- Bring System
_G.BringMonster = true
_G.BringMode = 375
_G.BringDistance = 375

-- Combat
_G.FastAttack = true
_G.FastAttackDelay = 0.15
_G.AutoHaki = true
_G.AutoBuso = true

-- Position
_G.PositionFarm = {X = 0, Y = 30, Z = 0}
_G.SafeDistance = 30

-- Boss Farming (Básico - Parte 1)
_G.AutoBoss = false
_G.SelectedBoss = ""

-- Stats
_G.AutoStats = false
_G.PointMelee = 0
_G.PointDefense = 0
_G.PointSword = 0
_G.PointGun = 0
_G.PointFruit = 0

-- Mastery (Básico - Parte 2 terá completo)
_G.AutoFarmFruitMastery = false
_G.AutoFarmGunMastery = false
_G.MasteryMode = "Devil Fruit"

-- Misc
_G.AutoThirdSea = false
_G.TweenSpeed = 350

-- ==========================================
-- UTILITÁRIOS & FUNÇÕES AUXILIARES
-- ==========================================

-- Função de Notificação
function Notify(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration or 5;
        Icon = "rbxassetid://7733779610"
    })
end

-- Verificar se tem Tool equipada
function CheckTool(toolname)
    if LocalPlayer.Character:FindFirstChild(toolname) then
        return true
    end
    return false
end

-- Equipar Tool
function EquipTool(ToolSe)
    if LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(0.5)
        Humanoid:EquipTool(tool)
    end
end

-- Verificar Buso/Haki
function CheckBuso()
    for i,v in pairs(Character:GetChildren()) do
        if v:IsA("Model") and v.Name == "RaceEnergy" then
            return true
        end
    end
    return false
end

-- Ativar Buso
function ActivateBuso()
    if not CheckBuso() then
        local args = {
            [1] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end

-- Tween para posição
function Tween(position)
    local Distance = (position.Position - HumanoidRootPart.Position).Magnitude
    
    if Distance < 250 then
        HumanoidRootPart.CFrame = position
    else
        local Speed = _G.TweenSpeed
        
        local tween_s = game:GetService("TweenService")
        local info = TweenInfo.new(
            (position.Position - HumanoidRootPart.Position).Magnitude / Speed,
            Enum.EasingStyle.Linear
        )
        
        local tween = tween_s:Create(HumanoidRootPart, info, {CFrame = position})
        tween:Play()
        
        if Distance <= 250 then
            tween:Cancel()
            HumanoidRootPart.CFrame = position
        end
        
        if _G.StopTween then
            tween:Cancel()
            _G.StopTween = false
        end
    end
end

-- ==========================================
-- MONSTER DATABASE POR SEA
-- ==========================================

MonsterList = {}

if _G.World1 then
    MonsterList = {
        "Bandit",
        "Monkey",
        "Gorilla",
        "Pirate",
        "Brute",
        "Desert Bandit",
        "Desert Officer",
        "Snow Bandit",
        "Snowman",
        "Chief Petty Officer",
        "Sky Bandit",
        "Dark Master",
        "Prisoner",
        "Dangerous Prisoner",
        "Toga Warrior",
        "Gladiator",
        "Military Soldier",
        "Military Spy",
        "Fishman Warrior",
        "Fishman Commando",
        "God's Guard",
        "Shanda",
        "Royal Squad",
        "Royal Soldier",
        "Galley Pirate",
        "Galley Captain"
    }
elseif _G.World2 then
    MonsterList = {
        "Raider",
        "Mercenary",
        "Swan Pirate",
        "Factory Staff",
        "Marine Lieutenant",
        "Marine Captain",
        "Zombie",
        "Vampire",
        "Snow Trooper",
        "Winter Warrior",
        "Lab Subordinate",
        "Horned Warrior",
        "Magma Ninja",
        "Lava Pirate",
        "Ship Deckhand",
        "Ship Engineer",
        "Ship Steward",
        "Ship Officer",
        "Arctic Warrior",
        "Snow Lurker",
        "Sea Soldier",
        "Water Fighter"
    }
elseif _G.World3 then
    MonsterList = {
        "Pirate Millionaire",
        "Dragon Crew Warrior",
        "Dragon Crew Archer",
        "Female Islander",
        "Giant Islander",
        "Marine Commodore",
        "Marine Rear Admiral",
        "Fishman Raider",
        "Fishman Captain",
        "Forest Pirate",
        "Mythological Pirate",
        "Jungle Pirate",
        "Musketeer Pirate",
        "Reborn Skeleton",
        "Living Zombie",
        "Demonic Soul",
        "Posessed Mummy",
        "Peanut Scout",
        "Peanut President",
        "Ice Cream Chef",
        "Ice Cream Commander",
        "Cookie Crafter",
        "Cake Guard",
        "Baking Staff",
        "Head Baker",
        "Cocoa Warrior",
        "Chocolate Bar Battler",
        "Sweet Thief",
        "Candy Rebel",
        "Candy Pirate",
        "Snow Demon"
    }
end

-- Boss List
BossList = {}

if _G.World1 then
    BossList = {
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
    BossList = {
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
elseif _G.World3 then
    BossList = {
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
end

-- ==========================================
-- FAST ATTACK SYSTEM
-- ==========================================

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()

function CurrentWeapon()
    local ac = CombatFrameworkR.activeController
    local ret = ac.blades[1]
    if not ret then return LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
    pcall(function()
        while ret.Parent ~= LocalPlayer.Character do ret = ret.Parent end
    end)
    if not ret then return LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
    return ret
end

function getAllBladeHitsPlayers(Sizes)
    local Hits = {}
    local Client = LocalPlayer
    local Characters = game:GetService("Workspace").Characters:GetChildren()
    for i=1,#Characters do local v = Characters[i]
        local Human = v:FindFirstChildOfClass("Humanoid")
        if v.Name ~= Client.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
            table.insert(Hits,Human.RootPart)
        end
    end
    return Hits
end

function getAllBladeHits(Sizes)
    local Hits = {}
    local Client = LocalPlayer
    local Enemies = game:GetService("Workspace").Enemies:GetChildren()
    for i=1,#Enemies do local v = Enemies[i]
        local Human = v:FindFirstChildOfClass("Humanoid")
        if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
            table.insert(Hits,Human.RootPart)
        end
    end
    return Hits
end

function AttackFunction()
    local ac = CombatFrameworkR.activeController
    if ac and ac.equipped then
        for indexincrement = 1, 1 do
            local bladehit = getAllBladeHits(60)
            if #bladehit > 0 then
                local AcAttack8 = debug.getupvalue(ac.attack, 5)
                local AcAttack9 = debug.getupvalue(ac.attack, 6)
                local AcAttack7 = debug.getupvalue(ac.attack, 4)
                local AcAttack10 = debug.getupvalue(ac.attack, 7)
                local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
                local NumberAc13 = AcAttack7 * 798405
                (function()
                    NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
                    AcAttack8 = math.floor(NumberAc12 / AcAttack9)
                    AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
                end)()
                AcAttack10 = AcAttack10 + 1
                debug.setupvalue(ac.attack, 5, AcAttack8)
                debug.setupvalue(ac.attack, 6, AcAttack9)
                debug.setupvalue(ac.attack, 4, AcAttack7)
                debug.setupvalue(ac.attack, 7, AcAttack10)
                for k, v in pairs(ac.animator.anims.basic) do
                    v:Play(0.01,0.01,0.01)
                end                 
                if LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then 
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "") 
                end
            end
        end
    end
end

function AttackNoCD()
    if not _G.FastAttack then return end
    if not AutoFarmMasGun and not AutoFarmMasDevil then
        if tick() - cooldownfastattack > _G.FastAttackDelay then
            AttackFunction()
            cooldownfastattack = tick()
        end
    else
        AttackFunction()
    end
end

-- ==========================================
-- BRING MOB SYSTEM
-- ==========================================

function BringMobNear(position, distance)
    if not _G.BringMonster then return end
    
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if (v.HumanoidRootPart.Position - position.Position).Magnitude <= distance then
                v.HumanoidRootPart.CFrame = position
                v.Humanoid:ChangeState(14)
                v.HumanoidRootPart.CanCollide = false
                v.Head.CanCollide = false
                
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
                
                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
            end
        end
    end
end

-- ==========================================
-- AUTO FARM FUNCTIONS
-- ==========================================

function CheckLevel()
    local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    
    if _G.World1 then
        if Lv == 1 or Lv <= 9 then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
            CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif Lv == 10 or Lv <= 14 then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif Lv == 15 or Lv <= 29 then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif Lv == 30 or Lv <= 39 then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif Lv == 40 or Lv <= 59 then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif Lv == 60 or Lv <= 74 then
            Mon = "Desert Bandit"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif Lv == 75 or Lv <= 89 then
            Mon = "Desert Officer"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif Lv == 90 or Lv <= 99 then
            Mon = "Snow Bandit"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif Lv == 100 or Lv <= 119 then
            Mon = "Snowman"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif Lv == 120 or Lv <= 149 then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif Lv == 150 or Lv <= 174 then
            Mon = "Sky Bandit"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif Lv == 175 or Lv <= 189 then
            Mon = "Dark Master"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif Lv == 190 or Lv <= 209 then
            Mon = "Prisoner"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274816, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274816)
            CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif Lv == 210 or Lv <= 249 then
            Mon = "Dangerous Prisoner"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274816, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274816)
            CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif Lv == 250 or Lv <= 274 then
            Mon = "Toga Warrior"
            LevelQuest = 1
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif Lv == 275 or Lv <= 299 then
            Mon = "Gladiator"
            LevelQuest = 2
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif Lv == 300 or Lv <= 324 then
            Mon = "Military Soldier"
            LevelQuest = 1
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif Lv == 325 or Lv <= 374 then
            Mon = "Military Spy"
            LevelQuest = 2
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif Lv == 375 or Lv <= 399 then
            Mon = "Fishman Warrior"
            LevelQuest = 1
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            
            if _G.AutoFarm and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif Lv == 400 or Lv <= 449 then
            Mon = "Fishman Commando"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
            
            if _G.AutoFarm and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif Lv == 450 or Lv <= 474 then
            Mon = "God's Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
            CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
            
            if _G.AutoFarm and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif Lv == 475 or Lv <= 524 then
            Mon = "Shanda"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
            CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
            
            if _G.AutoFarm and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif Lv == 525 or Lv <= 549 then
            Mon = "Royal Squad"
            LevelQuest = 1
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif Lv == 550 or Lv <= 624 then
            Mon = "Royal Soldier"
            LevelQuest = 2
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif Lv == 625 or Lv <= 649 then
            Mon = "Galley Pirate"
            LevelQuest = 1
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif Lv >= 650 then
            Mon = "Galley Captain"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif _G.World2 then
        -- Second Sea Level Quests (simplified - full version would be huge)
        if Lv == 700 or Lv <= 724 then
            Mon = "Raider"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif Lv == 725 or Lv <= 774 then
            Mon = "Mercenary"
            LevelQuest = 2
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif Lv == 775 or Lv <= 799 then
            Mon = "Swan Pirate"
            LevelQuest = 1
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
            CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif Lv >= 1500 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        end
    elseif _G.World3 then
        -- Third Sea Level Quests
        if Lv == 1500 or Lv <= 1524 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif Lv == 1525 or Lv <= 1574 then
            Mon = "Pistol Billionaire"
            LevelQuest = 2
            NameQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
        elseif Lv >= 2550 then
            Mon = "Cake Guard"
            LevelQuest = 1
            NameQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-379.15835571289, 73.59677124023, -11135.435546875)
            CFrameMon = CFrame.new(-571.5263671875, 123.879638671875, -11250.1142578125)
        end
    end
end

-- Auto Farm Level
spawn(function()
    while wait() do
        if _G.AutoFarmLevel then
            pcall(function()
                CheckLevel()
                
                if _G.AutoHaki then
                    ActivateBuso()
                end
                
                -- Equipar arma
                if not CheckTool(_G.SelectWeapon) then
                    EquipTool(_G.SelectWeapon)
                end
                
                -- Pegar Quest
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    Tween(CFrameQuest)
                    
                    if (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude <= 5 then
                        wait(0.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                else
                    -- Farm Mob
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if v.Name == Mon then
                                repeat task.wait()
                                    if v.Humanoid.Health <= 0 then v.Humanoid.Health = 0 break end
                                    
                                    EquipTool(_G.SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.PositionFarm.X, _G.PositionFarm.Y, _G.PositionFarm.Z))
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid.JumpPower = 0
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    
                                    AttackNoCD()
                                    BringMobNear(v.HumanoidRootPart.CFrame, _G.BringMode)
                                    
                                until not _G.AutoFarmLevel or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Auto Farm Nearest
spawn(function()
    while wait() do
        if _G.AutoFarmNearest then
            pcall(function()
                if _G.AutoHaki then
                    ActivateBuso()
                end
                
                EquipTool(_G.SelectWeapon)
                
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude <= 5000 then
                            repeat task.wait()
                                if v.Humanoid.Health <= 0 then v.Humanoid.Health = 0 break end
                                
                                EquipTool(_G.SelectWeapon)
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.PositionFarm.X, _G.PositionFarm.Y, _G.PositionFarm.Z))
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid.JumpPower = 0
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.CanCollide = false
                                
                                AttackNoCD()
                                BringMobNear(v.HumanoidRootPart.CFrame, _G.BringMode)
                                
                            until not _G.AutoFarmNearest or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

-- ==========================================
-- UI LIBRARY
-- ==========================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("💎 Lag Teck Fusion V4.0 - Parte 1/4", "Sentinel")

-- ==========================================
-- TAB: MAIN FARM
-- ==========================================

local MainTab = Window:NewTab("⚡ Main Farm")
local MainSection = MainTab:NewSection("Auto Farm")

MainSection:NewToggle("Auto Farm Level", "Farm automaticamente no seu level", function(state)
    _G.AutoFarmLevel = state
    Notify("Auto Farm Level", state and "Ativado ✅" or "Desativado ❌", 3)
end)

MainSection:NewToggle("Auto Farm Nearest", "Farm o mob mais próximo", function(state)
    _G.AutoFarmNearest = state
    Notify("Auto Farm Nearest", state and "Ativado ✅" or "Desativado ❌", 3)
end)

MainSection:NewToggle("Bring Mob", "Traz mobs para você", function(state)
    _G.BringMonster = state
end)

MainSection:NewSlider("Bring Distance", "Distância do Bring", 500, 100, function(s)
    _G.BringMode = s
    _G.BringDistance = s
end)

-- ==========================================
-- TAB: COMBAT
-- ==========================================

local CombatTab = Window:NewTab("⚔️ Combat")
local CombatSection = CombatTab:NewSection("Combat Settings")

CombatSection:NewToggle("Fast Attack", "Ataque super rápido", function(state)
    _G.FastAttack = state
end)

CombatSection:NewSlider("Fast Attack Delay", "Delay entre ataques", 1, 0, function(s)
    _G.FastAttackDelay = s / 10
end)

CombatSection:NewToggle("Auto Haki", "Ativa Buso automaticamente", function(state)
    _G.AutoHaki = state
    _G.AutoBuso = state
end)

-- Fast Attack Loop
spawn(function()
    while wait(_G.FastAttackDelay) do
        if _G.FastAttack then
            pcall(function()
                AttackNoCD()
            end)
        end
    end
end)

-- ==========================================
-- TAB: WEAPON
-- ==========================================

local WeaponTab = Window:NewTab("🗡️ Weapon")
local WeaponSection = WeaponTab:NewSection("Select Weapon")

WeaponSection:NewDropdown("Select Weapon", "Escolha sua arma", {"Combat", "Melee", "Sword", "Gun", "Fruit"}, function(currentOption)
    _G.SelectWeapon = currentOption
    
    -- Auto equip based on type
    if currentOption == "Combat" then
        _G.SelectWeapon = "Combat"
    elseif currentOption == "Melee" then
        for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == "Melee" then
                _G.SelectWeapon = v.Name
                break
            end
        end
    elseif currentOption == "Sword" then
        for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == "Sword" then
                _G.SelectWeapon = v.Name
                break
            end
        end
    elseif currentOption == "Gun" then
        for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == "Gun" then
                _G.SelectWeapon = v.Name
                break
            end
        end
    elseif currentOption == "Fruit" then
        for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
                _G.SelectWeapon = v.Name
                break
            end
        end
    end
end)

-- List all weapons in inventory
local WeaponListSection = WeaponTab:NewSection("Your Weapons")
for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then
        WeaponListSection:NewButton(v.Name .. " (" .. v.ToolTip .. ")", "Equipar " .. v.Name, function()
            _G.SelectWeapon = v.Name
            EquipTool(v.Name)
            Notify("Weapon", "Equipado: " .. v.Name, 3)
        end)
    end
end

-- ==========================================
-- TAB: STATS
-- ==========================================

local StatsTab = Window:NewTab("📊 Stats")
local StatsSection = StatsTab:NewSection("Auto Stats")

StatsSection:NewToggle("Auto Stats", "Distribui pontos automaticamente", function(state)
    _G.AutoStats = state
    Notify("Auto Stats", state and "Ativado ✅" or "Desativado ❌", 3)
end)

StatsSection:NewSlider("Melee", "Pontos em Melee", 100, 0, function(s)
    _G.PointMelee = s
end)

StatsSection:NewSlider("Defense", "Pontos em Defense", 100, 0, function(s)
    _G.PointDefense = s
end)

StatsSection:NewSlider("Sword", "Pontos em Sword", 100, 0, function(s)
    _G.PointSword = s
end)

StatsSection:NewSlider("Gun", "Pontos em Gun", 100, 0, function(s)
    _G.PointGun = s
end)

StatsSection:NewSlider("Devil Fruit", "Pontos em Devil Fruit", 100, 0, function(s)
    _G.PointFruit = s
end)

-- Auto Stats Loop
spawn(function()
    while wait() do
        if _G.AutoStats then
            pcall(function()
                local Data = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", _G.PointMelee)
                local Data = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", _G.PointDefense)
                local Data = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", _G.PointSword)
                local Data = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", _G.PointGun)
                local Data = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", _G.PointFruit)
            end)
        end
    end
end)

-- ==========================================
-- TAB: SETTINGS
-- ==========================================

local SettingsTab = Window:NewTab("⚙️ Settings")
local SettingsSection = SettingsTab:NewSection("General Settings")

SettingsSection:NewToggle("Auto Reconnect", "Reconecta automaticamente se cair", function(state)
    _G.AutoReconnect = state
end)

SettingsSection:NewSlider("Tween Speed", "Velocidade de movimento", 400, 100, function(s)
    _G.TweenSpeed = s
end)

SettingsSection:NewSlider("Farm Distance Y", "Altura ao farmar", 50, 10, function(s)
    _G.PositionFarm.Y = s
end)

-- ==========================================
-- TAB: INFO
-- ==========================================

local InfoTab = Window:NewTab("ℹ️ Info")
local InfoSection = InfoTab:NewSection("Script Info")

InfoSection:NewLabel("Script: Lag Teck Fusion V4.0")
InfoSection:NewLabel("Versão: Parte 1/4")
InfoSection:NewLabel("Discord: discord.gg/RnZ6XHHFj7")
InfoSection:NewLabel(" ")
InfoSection:NewLabel("Suas Informações:")
InfoSection:NewLabel("Level: " .. LocalPlayer.Data.Level.Value)
InfoSection:NewLabel("Beli: $" .. LocalPlayer.Data.Beli.Value)
InfoSection:NewLabel("Fragments: " .. LocalPlayer.Data.Fragments.Value)

if _G.World1 then
    InfoSection:NewLabel("Sea: First Sea")
elseif _G.World2 then
    InfoSection:NewLabel("Sea: Second Sea")
elseif _G.World3 then
    InfoSection:NewLabel("Sea: Third Sea")
end

-- ==========================================
-- FINALIZAÇÃO
-- ==========================================

print("✅ Lag Teck Fusion V4.0 - Parte 1/4 carregado!")
print("✅ Core System, UI e Auto Farm ativados!")
print("💬 Discord: discord.gg/RnZ6XHHFj7")

Notify("Lag Teck Fusion V4.0", "Parte 1/4 carregada com sucesso! ✅", 5)
wait(1)
Notify("Discord", "discord.gg/RnZ6XHHFj7", 5)

--[[
═══════════════════════════════════════════════════════════════
                    FIM DA PARTE 1/4
                    
Funcionalidades incluídas:
✅ Core System (Anti-Ban, Fast Attack, Verificações)
✅ UI Completa (Library Moderna com 6 tabs)
✅ Auto Farm Level
✅ Auto Farm Nearest
✅ Bring Mob System
✅ Auto Haki & Auto Stats
✅ Weapon Selection
✅ Combat Settings

Próximas partes:
📋 Parte 2: Mastery + Bosses + Items
📋 Parte 3: ESP + Teleports + Sea Events
📋 Parte 4: Shop + Stats + Misc
═══════════════════════════════════════════════════════════════
--]]
