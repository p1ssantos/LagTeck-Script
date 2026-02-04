--[[
═══════════════════════════════════════════════════════════════
        LAG TECK FUSION V4.0 - ULTIMATE EDITION
                    PARTE 1/4 - CORE SYSTEM (DELTA COMPATIBLE)
═══════════════════════════════════════════════════════════════
Discord: discord.gg/RnZ6XHHFj7
Executor: Delta, Fluxus, Solara, Wave
Funcionalidades Parte 1:
  ✓ Core System (Anti-Ban, Fast Attack)
  ✓ UI Completa (Orion Library - Delta Compatible)
  ✓ Auto Farm (Levels, Nearest, Bosses)
  ✓ Bring Mob System
  ✓ Auto Haki & Auto Stats
--]]

-- ==========================================
-- VERIFICAÇÃO INICIAL
-- ==========================================
if not game:IsLoaded() then
    game.Loaded:Wait()
end

repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Players.LocalPlayer.Character

print("🔵 Carregando Lag Teck Fusion V4.0 - Parte 1/4...")
print("⚡ Versão Delta Compatible")
wait(0.5)

-- ==========================================
-- VERIFICAÇÃO DE MUNDO
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
    game.Players.LocalPlayer:Kick("⚠️ Este script é apenas para Blox Fruits!")
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

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Atualizar referências ao trocar personagem
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
end)

-- ==========================================
-- PROTEÇÕES ANTI-KICK & ANTI-BAN
-- ==========================================
print("🛡️ Ativando proteções Anti-Ban...")

pcall(function()
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
        
        -- Anti-Kick
        if method == "Kick" then
            print("⚠️ Tentativa de Kick bloqueada!")
            return wait(9e9)
        end
        
        return old(...)
    end)

    setreadonly(mt, true)
end)

-- Bypass Anti-Cheat
pcall(function()
    for i,v in pairs(Character:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock" or v.Name == "FallDamage" or 
               v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or 
               v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
    end
end)

print("✅ Proteções ativadas!")

-- ==========================================
-- AUTO RECONNECT
-- ==========================================
_G.AutoReconnect = true

pcall(function()
    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
        if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and 
           child.MessageArea:FindFirstChild("ErrorFrame") then
            if _G.AutoReconnect then
                print("🔄 Reconectando...")
                wait(1)
                TeleportService:Teleport(game.PlaceId)
            end
        end
    end)
end)

-- ==========================================
-- VARIÁVEIS GLOBAIS
-- ==========================================

-- Weapons
_G.SelectWeapon = "Combat"
_G.SelectWeaponGun = ""

-- Auto Farm
_G.AutoFarmLevel = false
_G.AutoFarmNearest = false
_G.AutoFarmSelectMonster = false
_G.SelectedMonster = ""

-- Bring System
_G.BringMonster = true
_G.BringMode = 350
_G.BringDistance = 350

-- Combat
_G.FastAttack = true
_G.FastAttackDelay = 0.15
_G.AutoHaki = true
_G.AutoBuso = true

-- Position
_G.PositionFarm = {X = 0, Y = 30, Z = 0}
_G.SafeDistance = 30

-- Boss
_G.AutoBoss = false
_G.SelectedBoss = ""

-- Stats
_G.AutoStats = false
_G.PointMelee = 0
_G.PointDefense = 0
_G.PointSword = 0
_G.PointGun = 0
_G.PointFruit = 0

-- Mastery
_G.AutoFarmFruitMastery = false
_G.AutoFarmGunMastery = false
_G.MasteryMode = "Devil Fruit"

-- Misc
_G.TweenSpeed = 350
_G.StopTween = false

-- ==========================================
-- FUNÇÕES AUXILIARES
-- ==========================================

function Notify(title, text, duration)
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = title;
            Text = text;
            Duration = duration or 5;
        })
    end)
end

function CheckTool(toolname)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(toolname) then
        return true
    end
    return false
end

function EquipTool(ToolSe)
    if LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(0.4)
        Humanoid:EquipTool(tool)
    end
end

function CheckBuso()
    for i,v in pairs(Character:GetChildren()) do
        if v:IsA("Model") and v.Name == "RageSystem_BusoHaki" then
            return true
        end
    end
    return false
end

function ActivateBuso()
    if not CheckBuso() then
        pcall(function()
            local args = {[1] = "Buso"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
    end
end

function Tween(position)
    pcall(function()
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
    end)
end

-- ==========================================
-- MONSTER DATABASE
-- ==========================================

MonsterList = {}

if _G.World1 then
    MonsterList = {
        "Bandit", "Monkey", "Gorilla", "Pirate", "Brute",
        "Desert Bandit", "Desert Officer", "Snow Bandit", "Snowman",
        "Chief Petty Officer", "Sky Bandit", "Dark Master",
        "Prisoner", "Dangerous Prisoner", "Toga Warrior", "Gladiator",
        "Military Soldier", "Military Spy", "Fishman Warrior", "Fishman Commando",
        "God's Guard", "Shanda", "Royal Squad", "Royal Soldier",
        "Galley Pirate", "Galley Captain"
    }
elseif _G.World2 then
    MonsterList = {
        "Raider", "Mercenary", "Swan Pirate", "Factory Staff",
        "Marine Lieutenant", "Marine Captain", "Zombie", "Vampire",
        "Snow Trooper", "Winter Warrior", "Lab Subordinate",
        "Horned Warrior", "Magma Ninja", "Lava Pirate",
        "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer",
        "Arctic Warrior", "Snow Lurker", "Sea Soldier", "Water Fighter"
    }
elseif _G.World3 then
    MonsterList = {
        "Pirate Millionaire", "Pistol Billionaire", "Dragon Crew Warrior", "Dragon Crew Archer",
        "Female Islander", "Giant Islander", "Marine Commodore", "Marine Rear Admiral",
        "Fishman Raider", "Fishman Captain", "Forest Pirate", "Mythological Pirate",
        "Jungle Pirate", "Musketeer Pirate", "Reborn Skeleton", "Living Zombie",
        "Demonic Soul", "Posessed Mummy", "Peanut Scout", "Peanut President",
        "Ice Cream Chef", "Ice Cream Commander", "Cookie Crafter", "Cake Guard",
        "Baking Staff", "Head Baker", "Cocoa Warrior", "Chocolate Bar Battler",
        "Sweet Thief", "Candy Rebel", "Candy Pirate", "Snow Demon"
    }
end

-- Boss List
BossList = {}

if _G.World1 then
    BossList = {
        "The Gorilla King", "Bobby", "Yeti", "Mob Leader",
        "Vice Admiral", "Warden", "Chief Warden", "Swan",
        "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg"
    }
elseif _G.World2 then
    BossList = {
        "Diamond", "Jeremy", "Fajita", "Don Swan",
        "Smoke Admiral", "Cursed Captain", "Darkbeard",
        "Order", "Awakened Ice Admiral"
    }
elseif _G.World3 then
    BossList = {
        "Stone", "Island Empress", "Kilo Admiral",
        "Captain Elephant", "Beautiful Pirate", "rip_indra True Form",
        "Longma", "Soul Reaper", "Cake Queen"
    }
end

-- ==========================================
-- FAST ATTACK SYSTEM (DELTA COMPATIBLE)
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
    if not ret then 
        return LocalPlayer.Character:FindFirstChildOfClass("Tool") and LocalPlayer.Character:FindFirstChildOfClass("Tool").Name or nil
    end
    pcall(function()
        while ret.Parent ~= LocalPlayer.Character do 
            ret = ret.Parent 
        end
    end)
    if not ret then 
        return LocalPlayer.Character:FindFirstChildOfClass("Tool") and LocalPlayer.Character:FindFirstChildOfClass("Tool").Name or nil
    end
    return ret
end

function getAllBladeHits(Sizes)
    local Hits = {}
    local Client = LocalPlayer
    local Enemies = game:GetService("Workspace").Enemies:GetChildren()
    for i=1,#Enemies do 
        local v = Enemies[i]
        local Human = v:FindFirstChildOfClass("Humanoid")
        if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
            table.insert(Hits, Human.RootPart)
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
    pcall(function()
        if tick() - cooldownfastattack > _G.FastAttackDelay then
            AttackFunction()
            cooldownfastattack = tick()
        end
    end)
end

-- ==========================================
-- BRING MOB SYSTEM
-- ==========================================

function BringMobNear(position, distance)
    if not _G.BringMonster then return end
    
    pcall(function()
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
    end)
end

-- ==========================================
-- CHECK LEVEL FUNCTION (RESUMIDA)
-- ==========================================

function CheckLevel()
    local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    
    if _G.World1 then
        if Lv == 1 or Lv <= 9 then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231)
            CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif Lv >= 10 and Lv <= 14 then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif Lv >= 15 and Lv <= 29 then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif Lv >= 30 and Lv <= 39 then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498)
            CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif Lv >= 40 and Lv <= 59 then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498)
            CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif Lv >= 60 and Lv <= 74 then
            Mon = "Desert Bandit"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359)
            CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif Lv >= 75 and Lv <= 89 then
            Mon = "Desert Officer"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359)
            CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif Lv >= 90 and Lv <= 99 then
            Mon = "Snow Bandit"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796)
            CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif Lv >= 100 and Lv <= 119 then
            Mon = "Snowman"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796)
            CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif Lv >= 120 and Lv <= 149 then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018)
            CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif Lv >= 150 and Lv <= 174 then
            Mon = "Sky Bandit"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165)
            CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif Lv >= 175 and Lv <= 189 then
            Mon = "Dark Master"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165)
            CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif Lv >= 190 and Lv <= 209 then
            Mon = "Prisoner"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514)
            CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif Lv >= 210 and Lv <= 249 then
            Mon = "Dangerous Prisoner"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514)
            CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif Lv >= 250 and Lv <= 274 then
            Mon = "Toga Warrior"
            LevelQuest = 1
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534)
            CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif Lv >= 275 and Lv <= 299 then
            Mon = "Gladiator"
            LevelQuest = 2
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534)
            CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif Lv >= 300 and Lv <= 324 then
            Mon = "Military Soldier"
            LevelQuest = 1
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395)
            CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif Lv >= 325 and Lv <= 374 then
            Mon = "Military Spy"
            LevelQuest = 2
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395)
            CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif Lv >= 375 and Lv <= 399 then
            Mon = "Fishman Warrior"
            LevelQuest = 1
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif Lv >= 400 and Lv <= 449 then
            Mon = "Fishman Commando"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
            if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif Lv >= 450 and Lv <= 474 then
            Mon = "God's Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643)
            CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
            if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif Lv >= 475 and Lv <= 524 then
            Mon = "Shanda"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196)
            CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
            if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif Lv >= 525 and Lv <= 549 then
            Mon = "Royal Squad"
            LevelQuest = 1
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif Lv >= 550 and Lv <= 624 then
            Mon = "Royal Soldier"
            LevelQuest = 2
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif Lv >= 625 and Lv <= 649 then
            Mon = "Galley Pirate"
            LevelQuest = 1
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif Lv >= 650 then
            Mon = "Galley Captain"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif _G.World2 then
        if Lv >= 700 and Lv <= 724 then
            Mon = "Raider"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif Lv >= 725 and Lv <= 774 then
            Mon = "Mercenary"
            LevelQuest = 2
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif Lv >= 775 and Lv <= 799 then
            Mon = "Swan Pirate"
            LevelQuest = 1
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898)
            CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif Lv >= 1500 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        end
    elseif _G.World3 then
        if Lv >= 1500 and Lv <= 1524 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif Lv >= 1525 and Lv <= 1574 then
            Mon = "Pistol Billionaire"
            LevelQuest = 2
            NameQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984)
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

-- ==========================================
-- AUTO FARM LOOPS
-- ==========================================

-- Auto Farm Level
spawn(function()
    while wait() do
        if _G.AutoFarmLevel then
            pcall(function()
                CheckLevel()
                
                if _G.AutoHaki then
                    ActivateBuso()
                end
                
                if not CheckTool(_G.SelectWeapon) then
                    EquipTool(_G.SelectWeapon)
                end
                
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    Tween(CFrameQuest)
                    
                    if (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude <= 5 then
                        wait(0.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                else
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

-- Auto Stats Loop
spawn(function()
    while wait() do
        if _G.AutoStats then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", _G.PointMelee)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", _G.PointDefense)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", _G.PointSword)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", _G.PointGun)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", _G.PointFruit)
            end)
        end
    end
end)

-- ==========================================
-- UI LIBRARY (ORION - DELTA COMPATIBLE)
-- ==========================================

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "💎 Lag Teck Fusion V4.0 - Parte 1/4",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "LagTeckConfig",
    IntroText = "Lag Teck Fusion"
})

-- ==========================================
-- TAB: MAIN FARM
-- ==========================================

local MainTab = Window:MakeTab({
    Name = "⚡ Main Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddToggle({
    Name = "Auto Farm Level",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmLevel = Value
        Notify("Auto Farm Level", Value and "Ativado ✅" or "Desativado ❌", 3)
    end    
})

MainTab:AddToggle({
    Name = "Auto Farm Nearest",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmNearest = Value
        Notify("Auto Farm Nearest", Value and "Ativado ✅" or "Desativado ❌", 3)
    end    
})

MainTab:AddToggle({
    Name = "Bring Mob",
    Default = true,
    Callback = function(Value)
        _G.BringMonster = Value
    end    
})

MainTab:AddSlider({
    Name = "Bring Distance",
    Min = 100,
    Max = 500,
    Default = 350,
    Color = Color3.fromRGB(255,255,255),
    Increment = 10,
    ValueName = "studs",
    Callback = function(Value)
        _G.BringMode = Value
        _G.BringDistance = Value
    end    
})

-- ==========================================
-- TAB: COMBAT
-- ==========================================

local CombatTab = Window:MakeTab({
    Name = "⚔️ Combat",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CombatTab:AddToggle({
    Name = "Fast Attack",
    Default = true,
    Callback = function(Value)
        _G.FastAttack = Value
    end    
})

CombatTab:AddSlider({
    Name = "Fast Attack Delay",
    Min = 0,
    Max = 10,
    Default = 1,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "delay",
    Callback = function(Value)
        _G.FastAttackDelay = Value / 10
    end    
})

CombatTab:AddToggle({
    Name = "Auto Haki",
    Default = true,
    Callback = function(Value)
        _G.AutoHaki = Value
        _G.AutoBuso = Value
    end    
})

-- ==========================================
-- TAB: WEAPON
-- ==========================================

local WeaponTab = Window:MakeTab({
    Name = "🗡️ Weapon",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

WeaponTab:AddDropdown({
    Name = "Select Weapon Type",
    Default = "Combat",
    Options = {"Combat", "Melee", "Sword", "Gun", "Fruit"},
    Callback = function(Value)
        if Value == "Combat" then
            _G.SelectWeapon = "Combat"
        elseif Value == "Melee" then
            for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Melee" then
                    _G.SelectWeapon = v.Name
                    break
                end
            end
        elseif Value == "Sword" then
            for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Sword" then
                    _G.SelectWeapon = v.Name
                    break
                end
            end
        elseif Value == "Gun" then
            for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Gun" then
                    _G.SelectWeapon = v.Name
                    break
                end
            end
        elseif Value == "Fruit" then
            for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
                    _G.SelectWeapon = v.Name
                    break
                end
            end
        end
    end    
})

WeaponTab:AddLabel("Your Weapons:")
for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then
        WeaponTab:AddButton({
            Name = v.Name .. " (" .. v.ToolTip .. ")",
            Callback = function()
                _G.SelectWeapon = v.Name
                EquipTool(v.Name)
                Notify("Weapon", "Equipado: " .. v.Name, 3)
            end    
        })
    end
end

-- ==========================================
-- TAB: STATS
-- ==========================================

local StatsTab = Window:MakeTab({
    Name = "📊 Stats",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

StatsTab:AddToggle({
    Name = "Auto Stats",
    Default = false,
    Callback = function(Value)
        _G.AutoStats = Value
        Notify("Auto Stats", Value and "Ativado ✅" or "Desativado ❌", 3)
    end    
})

StatsTab:AddSlider({
    Name = "Melee",
    Min = 0,
    Max = 100,
    Default = 0,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "points",
    Callback = function(Value)
        _G.PointMelee = Value
    end    
})

StatsTab:AddSlider({
    Name = "Defense",
    Min = 0,
    Max = 100,
    Default = 0,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "points",
    Callback = function(Value)
        _G.PointDefense = Value
    end    
})

StatsTab:AddSlider({
    Name = "Sword",
    Min = 0,
    Max = 100,
    Default = 0,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "points",
    Callback = function(Value)
        _G.PointSword = Value
    end    
})

StatsTab:AddSlider({
    Name = "Gun",
    Min = 0,
    Max = 100,
    Default = 0,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "points",
    Callback = function(Value)
        _G.PointGun = Value
    end    
})

StatsTab:AddSlider({
    Name = "Devil Fruit",
    Min = 0,
    Max = 100,
    Default = 0,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "points",
    Callback = function(Value)
        _G.PointFruit = Value
    end    
})

-- ==========================================
-- TAB: SETTINGS
-- ==========================================

local SettingsTab = Window:MakeTab({
    Name = "⚙️ Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SettingsTab:AddToggle({
    Name = "Auto Reconnect",
    Default = true,
    Callback = function(Value)
        _G.AutoReconnect = Value
    end    
})

SettingsTab:AddSlider({
    Name = "Tween Speed",
    Min = 100,
    Max = 400,
    Default = 350,
    Color = Color3.fromRGB(255,255,255),
    Increment = 10,
    ValueName = "speed",
    Callback = function(Value)
        _G.TweenSpeed = Value
    end    
})

SettingsTab:AddSlider({
    Name = "Farm Height (Y)",
    Min = 10,
    Max = 50,
    Default = 30,
    Color = Color3.fromRGB(255,255,255),
    Increment = 5,
    ValueName = "studs",
    Callback = function(Value)
        _G.PositionFarm.Y = Value
    end    
})

-- ==========================================
-- TAB: INFO
-- ==========================================

local InfoTab = Window:MakeTab({
    Name = "ℹ️ Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

InfoTab:AddLabel("Script: Lag Teck Fusion V4.0")
InfoTab:AddLabel("Versão: Parte 1/4 (Delta)")
InfoTab:AddLabel("Discord: discord.gg/RnZ6XHHFj7")
InfoTab:AddLabel(" ")
InfoTab:AddLabel("Suas Informações:")
InfoTab:AddLabel("Level: " .. LocalPlayer.Data.Level.Value)
InfoTab:AddLabel("Beli: $" .. LocalPlayer.Data.Beli.Value)
InfoTab:AddLabel("Fragments: " .. LocalPlayer.Data.Fragments.Value)

if _G.World1 then
    InfoTab:AddLabel("Sea: First Sea")
elseif _G.World2 then
    InfoTab:AddLabel("Sea: Second Sea")
elseif _G.World3 then
    InfoTab:AddLabel("Sea: Third Sea")
end

InfoTab:AddButton({
    Name = "Destroy UI",
    Callback = function()
        OrionLib:Destroy()
    end    
})

-- ==========================================
-- INIT UI
-- ==========================================

OrionLib:Init()

print("✅ Lag Teck Fusion V4.0 - Parte 1/4 carregado!")
print("✅ Delta Compatible Version!")
print("💬 Discord: discord.gg/RnZ6XHHFj7")

Notify("Lag Teck Fusion V4.0", "Parte 1/4 carregada! (Delta) ✅", 5)
wait(1)
Notify("Discord", "discord.gg/RnZ6XHHFj7", 5)

--[[
═══════════════════════════════════════════════════════════════
                    FIM DA PARTE 1/4 (DELTA COMPATIBLE)
═══════════════════════════════════════════════════════════════
--]]
