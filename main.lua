--[[
═══════════════════════════════════════════════════════════════
              LAG TECK FUSION V3.0 - PARTE 1/4
                   CORE & PROTEÇÕES
═══════════════════════════════════════════════════════════════
Discord: discord.gg/RnZ6XHHFj7
Linhas: 800+ | Parte: 1 de 4
--]]

-- ==========================================
-- VERIFICAÇÃO DE MUNDO
-- ==========================================
if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
    game:GetService("Players").LocalPlayer:Kick("⚠️ Este script é apenas para Blox Fruits!")
end

-- ==========================================
-- PROTEÇÕES ANTI-KICK & ANTI-BAN
-- ==========================================
local gc = getrawmetatable(game)
local old = gc.__namecall
setreadonly(gc, false)
gc.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = {...}
    if tostring(method) == "FireServer" then
        if tostring(args[1]) == "RemoteEvent" then
            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                if Skillaimbot then
                    args[2] = AimBotSkillPosition
                    return old(unpack(args))
                end
            end
        end
    end
    return old(...)
end)

-- Anti-Kick principal
pcall(function()
    local mt = getrawmetatable(game)
    local oldnamecall = mt.__namecall
    setreadonly(mt, false)
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        if method == "Kick" then
            return wait(9e9)
        end
        
        return oldnamecall(self, ...)
    end)
end)

-- Bypass Anti-Cheat
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
    if v:IsA("LocalScript") then
        if v.Name == "General" or v.Name == "Shiftlock" or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
            v:Destroy()
        end
    end
end

-- Delta Executor Fix
if not getgenv then
    function getgenv()
        return _G
    end
end

if not getnilinstances then
    function getnilinstances()
        return {}
    end
end

-- ==========================================
-- VARIÁVEIS GLOBAIS
-- ==========================================
_G.SelectWeapon = "Combat"
_G.SelectWeaponGun = ""
_G.AutoFarm = false
_G.AutoFarmNearest = false
_G.AutoFarmLevel = false
_G.Farmfast = false
_G.AutoFarmSelectMonster = false
_G.BringMonster = true
_G.BringMode = 350
_G.FastAttack = true
_G.FastAttackDelay = 0
_G.AutoHaki = true
_G.AutoBuso = true
_G.AutoSoru = true
_G.AutoObservation = false
_G.AutoObservation_Hop = false
_G.TeleportIsland = false
_G.SelectIsland = ""
_G.SelectNPC = ""
_G.TeleportNPC = false
_G.TeleportPly = false
_G.SelectPly = ""
_G.Auto_Kill_Ply = false
_G.Aimbot_Gun = false
_G.Aimbot_Skill = false
_G.Kill_At = 0
_G.AutoBudySword = false
_G.AutoBudySwordHop = false
_G.Autotushita = false
_G.Autotushitahop = false
_G.AutoCarvender = false
_G.AutoCavanderhop = false
_G.AutoTwinHook = false
_G.AutoTwinHook_Hop = false
_G.AutoDarkDagger = false
_G.AutoDarkDagger_Hop = false
_G.Autodoughking = false
_G.AutodoughkingHop = false
_G.AutoSeaBest = false
_G.AutoSeaBestHop = false
_G.Namfon = false
_G.AutoArenaTrainerHop = false
_G.AutoFarmBossHallow = false
_G.Auto_Bone = false
_G.Auto_Random_Bone = false
_G.Auto_Saber = false
_G.Autopole = false
_G.Autopolehop = false
_G.AutoBartilo = false
_G.AutoVampire = false
_G.Vampire = false
_G.AutoDeathStep = false
_G.AutoSharkman = false
_G.AutoElectricClaw = false
_G.AutoDragonTalon = false
_G.Auto_God_Human = false
_G.AutoThirdSea = false
_G.AutoNevaSoulGuitar = false
_G.soulGuitarhop = false
_G.AutoObservationHakiV2 = false
Auto_Cursed_Dual_Katana = false
_G.AutoFarmFruitMastery = false
_G.AutoFarmGunMastery = false
_G.AutoPlayerHunter = false
_G.AutoFactory = false
_G.AutoSwanGlasses = false
_G.Auto_Farm_Bone = false
_G.Auto_Bone2 = false
_G.Auto_Random_Bone2 = false
_G.AutoDoughtBoss = false
_G.AutoCakePrince = false
_G.AutoElite = false
_G.AutoEliteHop = false
_G.AutoRengoku = false
_G.AutoMusketeerHat = false
_G.Auto_EvoRace = false
_G.AutoBartilo = false
_G.Auto_DarkBoss = false
_G.AutoFarmChest = false
_G.AutoFarmBossHallow = false
_G.AutoFarmMob = false
_G.AutoRipIndra = false
_G.Auto_Farm_Bone = false
_G.AutoFarmCandy = false
_G.Auto_DungeonMobAura = false
_G.Auto_Dungeon = false
_G.Low_Health = 25
_G.High_Health = 100
_G.SelectMonster = ""
_G.QuestDoughtOpenDoor = false
_G.AllNPCS = false
_G.AutoAdvanceDungeon = false
_G.AutoDungeon = false
_G.AutoNextIsland = false
_G.AutoAwakener = false
_G.Kill_Aura = false
_G.Auto_Seabest = false
_G.AutoTerrorshark = false
_G.farmpiranya = false
_G.Fish_Crew_Member = false
_G.bjirFishBoat = false
_G.RelzFishBoat = false
_G.AutoShark = false
_G.Auto_Seabest = false
_G.Auto_Bone2 = false
_G.Auto_Random_Bone2 = false
_G.dao = false
_G.Hop = false
_G.Hopfinddao = false
_G.Hopfindmoon = false
_G.AutoRace = false
_G.AutoPullLever = false
_G.V3 = false
_G.V4 = false
_G.AutoDooHee = false
_G.TweenMGear = false
_G.Auto_Farm_Bone4 = false
_G.AutoQuestRace = false
_G.AutoBuyChip = false
_G.Auto_StartRaid = false
_G.SelectChip = selectraids or ""
_G.Auto_Buy_Law_Chip = false
_G.Auto_Start_Law_Dungeon = false
_G.Auto_Kill_Law = false
_G.FlowerESP = false
_G.DevilFruitESP = false
_G.ChestESP = false
_G.ESPPlayer = false
_G.RealFruitESP = false
_G.IslandESP = false
_G.Random_Auto = false
_G.AutoStoreFruit = false
_G.Tweenfruit = false
_G.DropFruit = false
_G.BringFruitBF = false
_G.AutoRedeemCode = false
_G.AutoStats_Kaitun = false
melee = false
defense = false
sword = false
gun = false
demonfruit = false
PointStats = 1
_G.TurnKen = false
KillPlayer = false
AimSkillNearest = false
BypassTP = false

-- Posições
Pos = CFrame.new(0, 30, 0)
PosX = 0
PosY = 30
PosZ = 0

-- ==========================================
-- FUNÇÕES ESSENCIAIS COMPLETAS
-- ==========================================

function CheckQuest()
    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if World1 then
        if MyLevel == 1 or MyLevel <= 9 then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
            CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif MyLevel == 10 or MyLevel <= 14 then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif MyLevel == 15 or MyLevel <= 29 then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif MyLevel == 30 or MyLevel <= 39 then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif MyLevel == 40 or MyLevel <= 59 then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif MyLevel == 60 or MyLevel <= 74 then
            Mon = "Desert Bandit"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif MyLevel == 75 or MyLevel <= 89 then
            Mon = "Desert Officer"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif MyLevel == 90 or MyLevel <= 99 then
            Mon = "Snow Bandit"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif MyLevel == 100 or MyLevel <= 119 then
            Mon = "Snowman"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif MyLevel == 120 or MyLevel <= 149 then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-4881.23095703125, 22.65204811096191, 4273.75244140625)
        elseif MyLevel == 150 or MyLevel <= 174 then
            Mon = "Sky Bandit"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif MyLevel == 175 or MyLevel <= 189 then
            Mon = "Dark Master"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif MyLevel == 190 or MyLevel <= 209 then
            Mon = "Prisoner"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif MyLevel == 210 or MyLevel <= 249 then
            Mon = "Dangerous Prisoner"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif MyLevel == 250 or MyLevel <= 274 then
            Mon = "Toga Warrior"
            LevelQuest = 1
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif MyLevel == 275 or MyLevel <= 299 then
            Mon = "Gladiator"
            LevelQuest = 2
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif MyLevel == 300 or MyLevel <= 324 then
            Mon = "Military Soldier"
            LevelQuest = 1
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif MyLevel == 325 or MyLevel <= 374 then
            Mon = "Military Spy"
            LevelQuest = 2
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif MyLevel == 375 or MyLevel <= 399 then
            Mon = "Fishman Warrior"
            LevelQuest = 1
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel == 400 or MyLevel <= 449 then
            Mon = "Fishman Commando"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel == 450 or MyLevel <= 474 then
            Mon = "God's Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
            CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif MyLevel == 475 or MyLevel <= 524 then
            Mon = "Shanda"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
            CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif MyLevel == 525 or MyLevel <= 549 then
            Mon = "Royal Squad"
            LevelQuest = 1
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif MyLevel == 550 or MyLevel <= 624 then
            Mon = "Royal Soldier"
            LevelQuest = 2
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif MyLevel == 625 or MyLevel <= 649 then
            Mon = "Galley Pirate"
            LevelQuest = 1
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif MyLevel >= 650 then
            Mon = "Galley Captain"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif World2 then
        if MyLevel == 700 or MyLevel <= 724 then
            Mon = "Raider"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif MyLevel == 725 or MyLevel <= 774 then
            Mon = "Mercenary"
            LevelQuest = 2
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif MyLevel == 775 or MyLevel <= 799 then
            Mon = "Swan Pirate"
            LevelQuest = 1
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
            CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif MyLevel == 800 or MyLevel <= 874 then
            Mon = "Factory Staff"
            NameQuest = "Area2Quest"
            LevelQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
            CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
        elseif MyLevel == 875 or MyLevel <= 899 then
            Mon = "Marine Lieutenant"
            LevelQuest = 1
            NameQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif MyLevel == 900 or MyLevel <= 949 then
            Mon = "Marine Captain"
            LevelQuest = 2
            NameQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
        elseif MyLevel == 950 or MyLevel <= 974 then
            Mon = "Zombie"
            LevelQuest = 1
            NameQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
        elseif MyLevel == 975 or MyLevel <= 999 then
            Mon = "Vampire"
            LevelQuest = 2
            NameQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
        elseif MyLevel == 1000 or MyLevel <= 1049 then
            Mon = "Snow Trooper"
            LevelQuest = 1
            NameQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
        elseif MyLevel == 1050 or MyLevel <= 1099 then
            Mon = "Winter Warrior"
            LevelQuest = 2
            NameQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
        elseif MyLevel == 1100 or MyLevel <= 1124 then
            Mon = "Lab Subordinate"
            LevelQuest = 1
            NameQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
        elseif MyLevel == 1125 or MyLevel <= 1174 then
            Mon = "Horned Warrior"
            LevelQuest = 2
            NameQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
        elseif MyLevel == 1175 or MyLevel <= 1199 then
            Mon = "Magma Ninja"
            LevelQuest = 1
            NameQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
        elseif MyLevel == 1200 or MyLevel <= 1249 then
            Mon = "Lava Pirate"
            LevelQuest = 2
            NameQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif MyLevel == 1250 or MyLevel <= 1274 then
            Mon = "Ship Deckhand"
            LevelQuest = 1
            NameQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
            CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)    
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1275 or MyLevel <= 1299 then
            Mon = "Ship Engineer"
            LevelQuest = 2
            NameQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)   
            CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1300 or MyLevel <= 1324 then
            Mon = "Ship Steward"
            LevelQuest = 1
            NameQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)         
            CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)      
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1325 or MyLevel <= 1349 then
            Mon = "Ship Officer"
            LevelQuest = 2
            NameQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1350 or MyLevel <= 1374 then
            Mon = "Arctic Warrior"
            LevelQuest = 1
            NameQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
            end
        elseif MyLevel == 1375 or MyLevel <= 1424 then
            Mon = "Snow Lurker"
            LevelQuest = 2
            NameQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
        elseif MyLevel == 1425 or MyLevel <= 1449 then
            Mon = "Sea Soldier"
            LevelQuest = 1
            NameQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.139203906, 0, 1, -0, 0.139203906, 0, 0.990270376)
            CFrameMon = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        elseif MyLevel >= 1450 then
            Mon = "Water Fighter"
            LevelQuest = 2
            NameQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.139203906, 0, 1, -0, 0.139203906, 0, 0.990270376)
            CFrameMon = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
        end
    elseif World3 then
        if MyLevel == 1500 or MyLevel <= 1524 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif MyLevel == 1525 or MyLevel <= 1574 then
            Mon = "Pistol Billionaire"
            LevelQuest = 2
            NameQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
        elseif MyLevel == 1575 or MyLevel <= 1599 then
            Mon = "Dragon Crew Warrior"
            LevelQuest = 1
            NameQuest = "AmazonQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
            CFrameMon = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
        elseif MyLevel == 1600 or MyLevel <= 1624 then 
            Mon = "Dragon Crew Archer"
            NameQuest = "AmazonQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
            CFrameMon = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125)
        elseif MyLevel == 1625 or MyLevel <= 1649 then
            Mon = "Female Islander"
            NameQuest = "AmazonQuest2"
            LevelQuest = 1
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312)
        elseif MyLevel == 1650 or MyLevel <= 1699 then 
            Mon = "Giant Islander"
            NameQuest = "AmazonQuest2"
            LevelQuest = 2
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508)
        elseif MyLevel == 1700 or MyLevel <= 1724 then
            Mon = "Marine Commodore"
            LevelQuest = 1
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
            CFrameMon = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
        elseif MyLevel == 1725 or MyLevel <= 1774 then
            Mon = "Marine Rear Admiral"
            NameMon = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            LevelQuest = 2
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
            CFrameMon = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
        elseif MyLevel == 1775 or MyLevel <= 1799 then
            Mon = "Fishman Raider"
            LevelQuest = 1
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10407.5263671875, 390.94473266601562, -8551.4970703125)
        elseif MyLevel == 1800 or MyLevel <= 1824 then
            Mon = "Fishman Captain"
            LevelQuest = 2
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
        elseif MyLevel == 1825 or MyLevel <= 1849 then
            Mon = "Forest Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
            CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
        elseif MyLevel == 1850 or MyLevel <= 1899 then
            Mon = "Mythological Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
            CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif MyLevel == 1900 or MyLevel <= 1924 then
            Mon = "Jungle Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
        elseif MyLevel == 1925 or MyLevel <= 1974 then
            Mon = "Musketeer Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
        elseif MyLevel == 1975 or MyLevel <= 1999 then
            Mon = "Reborn Skeleton"
            LevelQuest = 1
            NameQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
        elseif MyLevel == 2000 or MyLevel <= 2024 then
            Mon = "Living Zombie"
            LevelQuest = 2
            NameQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5971.0537109375)
        elseif MyLevel == 2025 or MyLevel <= 2049 then
            Mon = "Demonic Soul"
            LevelQuest = 1
            NameQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
            CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
        elseif MyLevel == 2050 or MyLevel <= 2074 then
            Mon = "Posessed Mummy"
            LevelQuest = 2
            NameQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif MyLevel == 2075 or MyLevel <= 2099 then
            Mon = "Peanut Scout"
            LevelQuest = 1
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
        elseif MyLevel == 2100 or MyLevel <= 2124 then
            Mon = "Peanut President"
            LevelQuest = 2
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
        elseif MyLevel == 2125 or MyLevel <= 2149 then
            Mon = "Ice Cream Chef"
            LevelQuest = 1
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
        elseif MyLevel == 2150 or MyLevel <= 2199 then
            Mon = "Ice Cream Commander"
            LevelQuest = 2
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
        elseif MyLevel == 2200 or MyLevel <= 2224 then
            Mon = "Cookie Crafter"
            LevelQuest = 1
            NameQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
        elseif MyLevel == 2225 or MyLevel <= 2249 then
            Mon = "Cake Guard"
            LevelQuest = 2
            NameQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
        elseif MyLevel == 2250 or MyLevel <= 2274 then
            Mon = "Baking Staff"
            LevelQuest = 1
            NameQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
        elseif MyLevel == 2275 or MyLevel <= 2299 then
            Mon = "Head Baker"
            LevelQuest = 2
            NameQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
        elseif MyLevel == 2300 or MyLevel <= 2324 then
            Mon = "Cocoa Warrior"
            LevelQuest = 1
            NameQuest = "ChocQuest1"
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(233.22836303711, 29.876001358032, -12201.2333984375)
            CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
        elseif MyLevel == 2325 or MyLevel <= 2349 then
            Mon = "Chocolate Bar Battler"
            LevelQuest = 2
            NameQuest = "ChocQuest1"
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(233.22836303711, 29.876001358032, -12201.2333984375)
            CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif MyLevel == 2350 or MyLevel <= 2374 then
            Mon = "Sweet Thief"
            LevelQuest = 1
            NameQuest = "ChocQuest2"
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(150.5066375732, 30.693693161011, -12774.5595703125)
            CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
        elseif MyLevel == 2375 or MyLevel <= 2399 then
            Mon = "Candy Rebel"
            LevelQuest = 2
            NameQuest = "ChocQuest2"
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(150.5066375732, 30.693693161011, -12774.5595703125)
            CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
        elseif MyLevel == 2400 or MyLevel <= 2424 then
            Mon = "Candy Pirate"
            LevelQuest = 1
            NameQuest = "CandyQuest1"
            NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif MyLevel == 2425 or MyLevel <= 2449 then
            Mon = "Snow Demon"
            LevelQuest = 2
            NameQuest = "CandyQuest1"
            NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)
        elseif MyLevel == 2450 or MyLevel <= 2474 then
            Mon = "Isle Outlaw"
            LevelQuest = 1
            NameQuest = "TikiQuest1"
            NameMon = "Isle Outlaw"
            CFrameQuest = CFrame.new(-16545.9355, 55.6863556, -173.230499, -0.0530071855, -8.10633829e-09, 0.998594165, -1.45964043e-08, 1, 7.52423077e-09, -0.998594165, -1.41992074e-08, -0.0530071855)
            CFrameMon = CFrame.new(-16442.814453125, 116.13857269287109, -264.4715576171875)
        elseif MyLevel == 2475 or MyLevel <= 2499 then
            Mon = "Island Boy"
            LevelQuest = 2
            NameQuest = "TikiQuest1"
            NameMon = "Island Boy"
            CFrameQuest = CFrame.new(-16545.9355, 55.6863556, -173.230499, -0.0530071855, -8.10633829e-09, 0.998594165, -1.45964043e-08, 1, 7.52423077e-09, -0.998594165, -1.41992074e-08, -0.0530071855)
            CFrameMon = CFrame.new(-16901.26171875, 121.83866882324219, -192.31768798828125)
        elseif MyLevel == 2500 or MyLevel <= 2524 then
            Mon = "Sun-kissed Warrior"
            LevelQuest = 1
            NameQuest = "TikiQuest2"
            NameMon = "Sun-kissed Warrior"
            CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(-16356.888671875, 92.0808334350586, 1132.4451904296875)
        elseif MyLevel >= 2525 then
            Mon = "Isle Champion"
            LevelQuest = 2
            NameQuest = "TikiQuest2"
            NameMon = "Isle Champion"
            CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(-16933.2129, 93.3503036, 999.450989)
        end
    end
end

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.1)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
    end
end

function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        _G.NotAutoEquip = true
        wait(.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        wait(.1)
        _G.NotAutoEquip = false
    end
end

function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 25 then
        Speed = 5000
    elseif Distance < 50 then
        Speed = 2000
    elseif Distance < 150 then
        Speed = 800
    elseif Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 300
    elseif Distance < 750 then
        Speed = 250
    elseif Distance >= 1000 then
        Speed = 200
    end
    game:GetService("TweenService"):Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
end

function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end
end

function BTP(P)
	repeat wait(1)
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
		task.wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
	until (P.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500
end

function TP1(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 25 then
        Speed = 5000
    elseif Distance < 50 then
        Speed = 2000
    elseif Distance < 150 then
        Speed = 800
    elseif Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 300
    elseif Distance < 750 then
        Speed = 250
    elseif Distance >= 1000 then
        Speed = 200
    end
    game:GetService("TweenService"):Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
end

function TPP(CFgo)
    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then 
        tween:Cancel()
        repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
        wait(7)
        return 
    end
    local Distance = (CFgo.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
    if Distance < 250 then
        Speed = 5000
    elseif Distance < 500 then
        Speed = 650
    elseif Distance < 1000 then
        Speed = 350
    elseif Distance >= 1000 then
        Speed = 250
    end
    game:GetService("TweenService"):Create(
        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = CFgo}
    ):Play()
    _G.Clip = true
    wait(Distance/Speed)
    _G.Clip = false
end

function TPB(CFgo)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
    tween = tween_s:Create(game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat, info, {CFrame = CFgo})
    tween:Play()

    local tweenfunc = {}

    function tweenfunc:Stop()
        tween:Cancel()
    end

    return tweenfunc
end

--[[
═══════════════════════════════════════════════════════════════
              LAG TECK FUSION V3.0 - PARTE 2/4
                INTERFACE & FARM SYSTEM
═══════════════════════════════════════════════════════════════
Discord: discord.gg/RnZ6XHHFj7
Linhas: 750+ | Parte: 2 de 4
--]]

-- ==========================================
-- CARREGAR BIBLIOTECA RAYFIELD
-- ==========================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ==========================================
-- CRIAR JANELA PRINCIPAL
-- ==========================================
local Window = Rayfield:CreateWindow({
   Name = "🌊 Lag Teck Fusion V3.0 - Premium Edition",
   LoadingTitle = "Carregando Lag Teck Fusion",
   LoadingSubtitle = "by Lag Teck Team",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LagTeckFusion",
      FileName = "BloxFruitsConfig"
   },
   Discord = {
      Enabled = true,
      Invite = "RnZ6XHHFj7",
      RememberJoins = true
   },
   KeySystem = false
})

-- ==========================================
-- NOTIFICAÇÃO DE BOAS-VINDAS
-- ==========================================
Rayfield:Notify({
   Title = "✅ Bem-vindo ao Lag Teck Fusion!",
   Content = "Script carregado com sucesso! V3.0",
   Duration = 6.5,
   Image = 4483362458,
   Actions = {
      Ignore = {
         Name = "Entendi!",
         Callback = function()
         end
      },
   },
})

-- ==========================================
-- TAB 1: HOME & STATUS
-- ==========================================
local HomeTab = Window:CreateTab("🏠 Home", 4483362458)
local HomeSection = HomeTab:CreateSection("📊 Status do Jogador")

local LevelLabel = HomeTab:CreateLabel("Level: Carregando...")
local RaceLabel = HomeTab:CreateLabel("Race: Carregando...")
local BeliLabel = HomeTab:CreateLabel("Beli: Carregando...")
local FragmentLabel = HomeTab:CreateLabel("Fragments: Carregando...")
local BountyLabel = HomeTab:CreateLabel("Bounty/Honor: Carregando...")
local DevilFruitLabel = HomeTab:CreateLabel("Devil Fruit: Carregando...")

-- Update em tempo real
spawn(function()
    while wait(1) do
        pcall(function()
            LevelLabel:Set("⭐ Level: " .. game:GetService("Players").LocalPlayer.Data.Level.Value)
            RaceLabel:Set("🧬 Race: " .. game:GetService("Players").LocalPlayer.Data.Race.Value)
            BeliLabel:Set("💰 Beli: " .. game:GetService("Players").LocalPlayer.Data.Beli.Value)
            FragmentLabel:Set("💎 Fragments: " .. game:GetService("Players").LocalPlayer.Data.Fragments.Value)
            
            local BountyHonor = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
            BountyLabel:Set("🎯 Bounty/Honor: " .. BountyHonor)
            
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                DevilFruitLabel:Set("😈 Devil Fruit: " .. game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
            else
                DevilFruitLabel:Set("😈 Devil Fruit: None")
            end
        end)
    end
end)

local UpdateSection = HomeTab:CreateSection("📢 Informações da Versão")

HomeTab:CreateParagraph({
    Title = "V3.0 - Fusion Premium",
    Content = "✅ +200 Funções Implementadas\n✅ Interface Rayfield Premium\n✅ Auto Farm Otimizado\n✅ Race V4 Completo\n✅ Sistema Anti-Ban\n✅ Fast Attack Customizável\n✅ Bring Mobs Avançado\n✅ ESP Sistema Completo"
})

local SupportSection = HomeTab:CreateSection("💬 Suporte")

HomeTab:CreateButton({
   Name = "📱 Abrir Discord (Sugestões & Bugs)",
   Callback = function()
       setclipboard("discord.gg/RnZ6XHHFj7")
       Rayfield:Notify({
           Title = "Discord Copiado!",
           Content = "Link copiado para área de transferência!",
           Duration = 3,
           Image = 4483362458
       })
   end,
})

-- ==========================================
-- TAB 2: MAIN FARM
-- ==========================================
local FarmTab = Window:CreateTab("⚔️ Main Farm", 4483362458)
local FarmMainSection = FarmTab:CreateSection("🎯 Auto Farm Principal")

-- Seleção de Arma
local WeaponList = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    table.insert(WeaponList,v.Name)
end
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(WeaponList,v.Name)
    end
end

local SelectWeaponDropdown = FarmTab:CreateDropdown({
   Name = "Selecionar Arma Principal",
   Options = WeaponList,
   CurrentOption = "Combat",
   Flag = "SelectWeapon",
   Callback = function(Option)
        _G.SelectWeapon = Option
   end,
})

-- Auto Farm Level
local AutoFarmToggle = FarmTab:CreateToggle({
   Name = "🔥 Auto Farm Level (Quest)",
   CurrentValue = false,
   Flag = "AutoFarmLevel",
   Callback = function(Value)
        _G.AutoFarm = Value
        StopTween(_G.AutoFarm)
   end,
})

-- Auto Farm Nearest
local AutoFarmNearestToggle = FarmTab:CreateToggle({
   Name = "📍 Auto Farm Nearest Mob",
   CurrentValue = false,
   Flag = "AutoFarmNearest",
   Callback = function(Value)
        _G.AutoFarmNearest = Value
        StopTween(_G.AutoFarmNearest)
   end,
})

-- Fast Farm (Lv 10-120)
local FastFarmToggle = FarmTab:CreateToggle({
   Name = "⚡ Fast Farm (Level 10-120)",
   CurrentValue = false,
   Flag = "FastFarm",
   Callback = function(Value)
        _G.Farmfast = Value
        StopTween(_G.Farmfast)
   end,
})

local FarmSelectSection = FarmTab:CreateSection("🎯 Farm Específico")

-- Lista de Monstros
local MonsterList = {}
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    table.insert(MonsterList, v.Name)
end

local SelectMonsterDropdown = FarmTab:CreateDropdown({
   Name = "Selecionar Monstro",
   Options = MonsterList,
   CurrentOption = "",
   Flag = "SelectMonster",
   Callback = function(Option)
        _G.SelectMonster = Option
   end,
})

local AutoFarmSelectMonsterToggle = FarmTab:CreateToggle({
   Name = "Farm Monstro Selecionado",
   CurrentValue = false,
   Flag = "AutoFarmSelectMonster",
   Callback = function(Value)
        _G.AutoFarmSelectMonster = Value
        StopTween(_G.AutoFarmSelectMonster)
   end,
})

local BringSection = FarmTab:CreateSection("🧲 Bring Mobs Configuration")

local BringToggle = FarmTab:CreateToggle({
   Name = "🧲 Ativar Bring Mobs",
   CurrentValue = true,
   Flag = "BringMobs",
   Callback = function(Value)
        _G.BringMonster = Value
   end,
})

local BringModeDropdown = FarmTab:CreateDropdown({
   Name = "Bring Mode Distance",
   Options = {"Low (300)", "Normal (375)", "Super Bring (450)"},
   CurrentOption = "Normal (375)",
   Flag = "BringMode",
   Callback = function(Option)
        if Option == "Low (300)" then
            _G.BringMode = 300
        elseif Option == "Normal (375)" then
            _G.BringMode = 375
        elseif Option == "Super Bring (450)" then
            _G.BringMode = 450
        end
   end,
})

local AttackSection = FarmTab:CreateSection("⚡ Fast Attack Settings")

local FastAttackToggle = FarmTab:CreateToggle({
   Name = "⚡ Fast Attack",
   CurrentValue = true,
   Flag = "FastAttack",
   Callback = function(Value)
        _G.FastAttack = Value
   end,
})

local FastAttackDelaySlider = FarmTab:CreateSlider({
   Name = "Fast Attack Delay (segundos)",
   Range = {0, 1},
   Increment = 0.05,
   CurrentValue = 0,
   Flag = "FastAttackDelay",
   Callback = function(Value)
        _G.FastAttackDelay = Value
   end,
})

local PositionSection = FarmTab:CreateSection("📐 Farm Position Settings")

FarmTab:CreateParagraph({
    Title = "ℹ️ Configuração de Posição",
    Content = "Configure a posição X, Y, Z do farm em relação ao mob.\nPosY controla a altura (recomendado: 30)"
})

local PosXSlider = FarmTab:CreateSlider({
   Name = "Posição X",
   Range = {-50, 50},
   Increment = 1,
   CurrentValue = 0,
   Flag = "PosX",
   Callback = function(Value)
        PosX = Value
   end,
})

local PosYSlider = FarmTab:CreateSlider({
   Name = "Posição Y (Altura)",
   Range = {0, 60},
   Increment = 1,
   CurrentValue = 30,
   Flag = "PosY",
   Callback = function(Value)
        PosY = Value
   end,
})

local PosZSlider = FarmTab:CreateSlider({
   Name = "Posição Z",
   Range = {-50, 50},
   Increment = 1,
   CurrentValue = 0,
   Flag = "PosZ",
   Callback = function(Value)
        PosZ = Value
   end,
})

local MiscFarmSection = FarmTab:CreateSection("⚙️ Outras Configurações")

local AutoHakiToggle = FarmTab:CreateToggle({
   Name = "🛡️ Auto Haki (Buso)",
   CurrentValue = true,
   Flag = "AutoHaki",
   Callback = function(Value)
        _G.AutoHaki = Value
   end,
})

local BypassTPToggle = FarmTab:CreateToggle({
   Name = "🌀 Bypass TP (Long Distance)",
   CurrentValue = false,
   Flag = "BypassTP",
   Callback = function(Value)
        BypassTP = Value
   end,
})

-- ==========================================
-- LOOPS DE AUTO FARM
-- ==========================================

-- Loop Auto Farm Level
spawn(function()
    while wait() do
        if _G.AutoFarm then
            pcall(function()
                CheckQuest()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    StartMagnet = false
                    topos(CFrameQuest)
                    if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Mon and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    if _G.AutoHaki then
                                        AutoHaki()
                                    end
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid.WalkSpeed = 0
                                    v.Humanoid.JumpPower = 0
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                    PosMon = v.HumanoidRootPart.CFrame
                                    StartMagnet = true
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                                StartMagnet = false
                            end
                        end
                    else
                        StartMagnet = false
                        topos(CFrameMon)
                    end
                end
            end)
        end
    end
end)

-- Loop Auto Farm Nearest
spawn(function()
    while wait() do
        if _G.AutoFarmNearest then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
                            repeat task.wait()
                                if _G.AutoHaki then
                                    AutoHaki()
                                end
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid.WalkSpeed = 0
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not _G.AutoFarmNearest or not v.Parent or v.Humanoid.Health <= 0
                            break
                        end
                    end
                end
            end)
        end
    end
end)

-- Loop Fast Farm (10-120)
spawn(function()
    while wait() do
        if _G.Farmfast then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 10 and game.Players.LocalPlayer.Data.Level.Value <= 120 then
                    CheckQuest()
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Mon and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    if _G.AutoHaki then
                                        AutoHaki()
                                    end
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not _G.Farmfast or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        topos(CFrameMon)
                    end
                else
                    _G.Farmfast = false
                    Rayfield:Notify({
                        Title = "Fast Farm",
                        Content = "Você não está no nível correto (10-120)",
                        Duration = 3
                    })
                end
            end)
        end
    end
end)

-- Loop Auto Farm Select Monster
spawn(function()
    while wait() do
        if _G.AutoFarmSelectMonster then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectMonster) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == _G.SelectMonster and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                if _G.AutoHaki then
                                    AutoHaki()
                                end
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                PosMon = v.HumanoidRootPart.CFrame
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not _G.AutoFarmSelectMonster or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    Rayfield:Notify({
                        Title = "Monstro não encontrado",
                        Content = _G.SelectMonster .. " não está presente no mapa!",
                        Duration = 3
                    })
                end
            end)
        end
    end
end)

-- Sistema de Bring Mobs
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BringMonster then
                CheckQuest()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.AutoFarm and StartMagnet and v.Name == Mon and (Mon == "Factory Staff" or Mon == "Monkey" or Mon == "Dragon Crew Warrior" or Mon == "Dragon Crew Archer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 250 then
                        v.HumanoidRootPart.Size = Vector3.new(150,150,150)
                        v.HumanoidRootPart.CFrame = PosMon
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                    elseif _G.AutoFarm and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
                        v.HumanoidRootPart.Size = Vector3.new(150,150,150)
                        v.HumanoidRootPart.CFrame = PosMon
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                    end
                end
            end
        end)
    end
end)

-- NoClip System (Atravessar Paredes)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoFarm or _G.AutoFarmNearest or _G.Farmfast or _G.AutoFarmSelectMonster or _G.TeleportIsland or _G.TeleportNPC or _G.TeleportPly then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

-- Sistema de Flutuação na Água
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoFarm or _G.AutoFarmNearest or _G.Farmfast or _G.AutoFarmSelectMonster then
                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y < 1 then
                    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                        local vc = Instance.new("BodyVelocity", game:GetService("Players").LocalPlayer.Character.HumanoidRootPart)
                        vc.MaxForce = Vector3.new(1, 1, 1) * math.huge
                        vc.Velocity = Vector3.new(0, 1, 0) * 30
                    end
                else
                    if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
                    end
                end
            end
        end)
    end
end)

-- Auto Haki Loop
spawn(function()
    while wait(.1) do
        pcall(function()
            if _G.AutoHaki then
                AutoHaki()
            end
        end)
    end
end)

-- Fast Attack System
local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigEven = game:GetService("ReplicatedStorage").RigControllerEvent
local AttackAnim = Instance.new("Animation")
local AttackCoolDown = 0
local cooldowntickFire = 0
local MaxFire = 1000
local FireCoolDown = 0
local FireL = 0
local bladehit = {}

spawn(function()
    while wait() do
        if _G.FastAttack then
            pcall(function()
                if _G.FastAttackDelay > 0 then
                    wait(_G.FastAttackDelay)
                end
                repeat task.wait()
                    AttackFunction()
                until not _G.FastAttack
            end)
        end
    end
end)

function AttackFunction()
    local AC = CombatFrameworkR.activeController
    if AC and AC.equipped then
        for indexincrement = 1, 1 do
            local bladehit = {}
            local hits = {}
            local Client = game.Players.LocalPlayer
            local Characters = game:GetService("Workspace").Characters:GetChildren()
            for i, v in pairs(Characters) do
                local Human = v:FindFirstChildOfClass("Humanoid")
                if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
                    table.insert(bladehit, Human.RootPart)
                end
            end
            local Enemies = game:GetService("Workspace").Enemies:GetChildren()
            for i, v in pairs(Enemies) do
                local Human = v:FindFirstChildOfClass("Humanoid")
                if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
                    table.insert(bladehit, Human.RootPart)
                end
            end
            if #bladehit > 0 then
                pcall(function()
                    local u1 = hits
                    local u2 = #bladehit
                    local u3 = bladehit
                    RigEven:FireServer("weaponChange", AC.currentWeaponModel.Name)
                    RigEven:FireServer("hit", u3, u2, "")
                end)
            end
        end
    end
end

-- ==========================================
-- TAB 3: MASTERY
-- ==========================================
local MasteryTab = Window:CreateTab("📈 Mastery", 4483362458)
local MasterySection = MasteryTab:CreateSection("⚔️ Farm Mastery")

MasteryTab:CreateToggle({
   Name = "Auto Farm Devil Fruit Mastery",
   CurrentValue = false,
   Flag = "AutoFarmFruitMastery",
   Callback = function(Value)
        _G.AutoFarmFruitMastery = Value
        StopTween(_G.AutoFarmFruitMastery)
   end,
})

MasteryTab:CreateToggle({
   Name = "Auto Farm Gun Mastery",
   CurrentValue = false,
   Flag = "AutoFarmGunMastery",
   Callback = function(Value)
        _G.AutoFarmGunMastery = Value
        StopTween(_G.AutoFarmGunMastery)
   end,
})

local SkillSection = MasteryTab:CreateSection("🎯 Skills Settings")

MasteryTab:CreateToggle({
   Name = "Usar Skill Z",
   CurrentValue = true,
   Flag = "UseSkillZ",
   Callback = function(Value)
        _G.UseSkillZ = Value
   end,
})

MasteryTab:CreateToggle({
   Name = "Usar Skill X",
   CurrentValue = true,
   Flag = "UseSkillX",
   Callback = function(Value)
        _G.UseSkillX = Value
   end,
})

MasteryTab:CreateToggle({
   Name = "Usar Skill C",
   CurrentValue = true,
   Flag = "UseSkillC",
   Callback = function(Value)
        _G.UseSkillC = Value
   end,
})

MasteryTab:CreateToggle({
   Name = "Usar Skill V",
   CurrentValue = true,
   Flag = "UseSkillV",
   Callback = function(Value)
        _G.UseSkillV = Value
   end,
})

MasteryTab:CreateToggle({
   Name = "Usar Skill F",
   CurrentValue = false,
   Flag = "UseSkillF",
   Callback = function(Value)
        _G.UseSkillF = Value
   end,
})

local HealthSection = MasteryTab:CreateSection("❤️ Health Settings")

MasteryTab:CreateSlider({
   Name = "Kill at % HP",
   Range = {0, 100},
   Increment = 5,
   CurrentValue = 25,
   Flag = "KillAtHP",
   Callback = function(Value)
        _G.Kill_At = Value
   end,
})

--[[
═══════════════════════════════════════════════════════════════
              LAG TECK FUSION V3.0 - PARTE 3/4
              STATS, ITEMS, QUESTS & BOSSES
═══════════════════════════════════════════════════════════════
Discord: discord.gg/RnZ6XHHFj7
Linhas: 850+ | Parte: 3 de 4
--]]

-- ==========================================
-- TAB 4: STATS
-- ==========================================
local StatsTab = Window:CreateTab("📊 Stats", 4483362458)
local StatsDisplaySection = StatsTab:CreateSection("📈 Status Atual")

local MeleeLabel = StatsTab:CreateLabel("Melee: 0")
local DefenseLabel = StatsTab:CreateLabel("Defense: 0")
local SwordLabel = StatsTab:CreateLabel("Sword: 0")
local GunLabel = StatsTab:CreateLabel("Gun: 0")
local FruitLabel = StatsTab:CreateLabel("Devil Fruit: 0")
local PointsLabel = StatsTab:CreateLabel("Stat Points: 0")

spawn(function()
    while wait(1) do
        pcall(function()
            MeleeLabel:Set("🥊 Melee: "..game.Players.LocalPlayer.Data.Stats.Melee.Level.Value)
            DefenseLabel:Set("🛡️ Defense: "..game.Players.LocalPlayer.Data.Stats.Defense.Level.Value)
            SwordLabel:Set("⚔️ Sword: "..game.Players.LocalPlayer.Data.Stats.Sword.Level.Value)
            GunLabel:Set("🔫 Gun: "..game.Players.LocalPlayer.Data.Stats.Gun.Level.Value)
            FruitLabel:Set("😈 Devil Fruit: "..game.Players.LocalPlayer.Data.Stats["Demon Fruit"].Level.Value)
            PointsLabel:Set("⭐ Stat Points: "..tostring(game:GetService("Players").LocalPlayer.Data.Points.Value))
        end)
    end
end)

local StatsAutoSection = StatsTab:CreateSection("⚡ Auto Stats")

StatsTab:CreateToggle({
   Name = "🎯 Auto Stats Kaitun",
   CurrentValue = false,
   Flag = "AutoStatsKaitun",
   Callback = function(Value)
        _G.Auto_Stats_Kaitun = Value
   end,
})

StatsTab:CreateToggle({
   Name = "🥊 Melee",
   CurrentValue = false,
   Flag = "AutoMelee",
   Callback = function(Value)
        melee = Value
   end,
})

StatsTab:CreateToggle({
   Name = "🛡️ Defense",
   CurrentValue = false,
   Flag = "AutoDefense",
   Callback = function(Value)
        defense = Value
   end,
})

StatsTab:CreateToggle({
   Name = "⚔️ Sword",
   CurrentValue = false,
   Flag = "AutoSword",
   Callback = function(Value)
        sword = Value
   end,
})

StatsTab:CreateToggle({
   Name = "🔫 Gun",
   CurrentValue = false,
   Flag = "AutoGun",
   Callback = function(Value)
        gun = Value
   end,
})

StatsTab:CreateToggle({
   Name = "😈 Devil Fruit",
   CurrentValue = false,
   Flag = "AutoFruit",
   Callback = function(Value)
        demonfruit = Value
   end,
})

local StatsPointSection = StatsTab:CreateSection("📊 Configuração de Pontos")

StatsTab:CreateSlider({
   Name = "Pontos por Upgrade",
   Range = {1, 100},
   Increment = 1,
   CurrentValue = 1,
   Flag = "PointStats",
   Callback = function(Value)
        PointStats = Value
   end,
})

-- Loop Auto Stats
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_Stats_Kaitun then
                if game.Players.LocalPlayer.Data.Points.Value >= PointStats then
                    if game.Players.LocalPlayer.Data.Stats.Melee.Level.Value < 2450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",PointStats)
                    end
                    if game.Players.LocalPlayer.Data.Stats.Defense.Level.Value < 2450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",PointStats)
                    end
                    if game.Players.LocalPlayer.Data.Stats.Sword.Level.Value < 2450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",PointStats)
                    end
                    if game.Players.LocalPlayer.Data.Stats.Gun.Level.Value < 2450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",PointStats)
                    end
                    if game.Players.LocalPlayer.Data.Stats["Demon Fruit"].Level.Value < 2450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit",PointStats)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if melee then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",PointStats)
        end
        if defense then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",PointStats)
        end
        if sword then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",PointStats)
        end
        if gun then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",PointStats)
        end
        if demonfruit then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit",PointStats)
        end
    end
end)

-- ==========================================
-- TAB 5: ITEMS & QUESTS
-- ==========================================
local ItemsTab = Window:CreateTab("🎯 Items & Quests", 4483362458)
local SaberSection = ItemsTab:CreateSection("🗡️ Saber")

ItemsTab:CreateToggle({
   Name = "Auto Saber",
   CurrentValue = false,
   Flag = "AutoSaber",
   Callback = function(Value)
        _G.Auto_Saber = Value
        StopTween(_G.Auto_Saber)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Saber [HOP]",
   CurrentValue = false,
   Flag = "AutoSaberHop",
   Callback = function(Value)
        _G.Hop = Value
   end,
})

local PoleSection = ItemsTab:CreateSection("⚡ Pole V1")

ItemsTab:CreateToggle({
   Name = "Auto Pole V1",
   CurrentValue = false,
   Flag = "AutoPole",
   Callback = function(Value)
        _G.Autopole = Value
        StopTween(_G.Autopole)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Pole V1 [HOP]",
   CurrentValue = false,
   Flag = "AutoPoleHop",
   Callback = function(Value)
        _G.Autopolehop = Value
   end,
})

local SeaSection = ItemsTab:CreateSection("🌊 Second/Third Sea")

if World1 then
    ItemsTab:CreateButton({
       Name = "🌊 Go to Second Sea",
       Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
       end,
    })
end

if World2 then
    ItemsTab:CreateToggle({
       Name = "🌊 Auto Third Sea",
       CurrentValue = false,
       Flag = "AutoThirdSea",
       Callback = function(Value)
            _G.AutoThirdSea = Value
            StopTween(_G.AutoThirdSea)
       end,
    })
end

local BartiloSection = ItemsTab:CreateSection("🎭 Bartilo Quest")

ItemsTab:CreateToggle({
   Name = "Auto Bartilo Quest",
   CurrentValue = false,
   Flag = "AutoBartilo",
   Callback = function(Value)
        _G.AutoBartilo = Value
        StopTween(_G.AutoBartilo)
   end,
})

local VampireSection = ItemsTab:CreateSection("🧛 Vampire")

ItemsTab:CreateToggle({
   Name = "Auto Vampire",
   CurrentValue = false,
   Flag = "AutoVampire",
   Callback = function(Value)
        _G.AutoVampire = Value
        StopTween(_G.AutoVampire)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Vampire [HOP]",
   CurrentValue = false,
   Flag = "AutoVampireHop",
   Callback = function(Value)
        _G.Vampire = Value
   end,
})

local BuddySection = ItemsTab:CreateSection("⚔️ Buddy Sword")

ItemsTab:CreateToggle({
   Name = "Auto Buddy Sword",
   CurrentValue = false,
   Flag = "AutoBuddy",
   Callback = function(Value)
        _G.AutoBudySword = Value
        StopTween(_G.AutoBudySword)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Buddy Sword [HOP]",
   CurrentValue = false,
   Flag = "AutoBuddyHop",
   Callback = function(Value)
        _G.AutoBudySwordHop = Value
   end,
})

local SoulGuitarSection = ItemsTab:CreateSection("🎸 Soul Guitar")

ItemsTab:CreateToggle({
   Name = "Auto Soul Guitar",
   CurrentValue = false,
   Flag = "AutoSoulGuitar",
   Callback = function(Value)
        _G.AutoNevaSoulGuitar = Value
        StopTween(_G.AutoNevaSoulGuitar)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Soul Guitar [HOP]",
   CurrentValue = false,
   Flag = "AutoSoulGuitarHop",
   Callback = function(Value)
        _G.soulGuitarhop = Value
   end,
})

local TushitaSection = ItemsTab:CreateSection("⚔️ Tushita")

ItemsTab:CreateToggle({
   Name = "Auto Tushita",
   CurrentValue = false,
   Flag = "AutoTushita",
   Callback = function(Value)
        _G.Autotushita = Value
        StopTween(_G.Autotushita)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Tushita [HOP]",
   CurrentValue = false,
   Flag = "AutoTushitaHop",
   Callback = function(Value)
        _G.Autotushitahop = Value
   end,
})

local CavanderSection = ItemsTab:CreateSection("🗡️ Cavander")

ItemsTab:CreateToggle({
   Name = "Auto Cavander",
   CurrentValue = false,
   Flag = "AutoCavander",
   Callback = function(Value)
        _G.AutoCarvender = Value
        StopTween(_G.AutoCarvender)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Cavander [HOP]",
   CurrentValue = false,
   Flag = "AutoCavanderHop",
   Callback = function(Value)
        _G.AutoCavanderhop = Value
   end,
})

local TwinHookSection = ItemsTab:CreateSection("🪝 Twin Hook")

ItemsTab:CreateToggle({
   Name = "Auto Twin Hook",
   CurrentValue = false,
   Flag = "AutoTwinHook",
   Callback = function(Value)
        _G.AutoTwinHook = Value
        StopTween(_G.AutoTwinHook)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Twin Hook [HOP]",
   CurrentValue = false,
   Flag = "AutoTwinHookHop",
   Callback = function(Value)
        _G.AutoTwinHook_Hop = Value
   end,
})

local HallowSection = ItemsTab:CreateSection("💀 Hallow Scythe")

ItemsTab:CreateToggle({
   Name = "Auto Hallow Scythe",
   CurrentValue = false,
   Flag = "AutoHallow",
   Callback = function(Value)
        _G.AutoFarmBossHallow = Value
        StopTween(_G.AutoFarmBossHallow)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Hallow Scythe [HOP]",
   CurrentValue = false,
   Flag = "AutoHallowHop",
   Callback = function(Value)
        _G.Hop = Value
   end,
})

local DarkDaggerSection = ItemsTab:CreateSection("🗡️ Dark Dagger")

ItemsTab:CreateToggle({
   Name = "Auto Dark Dagger",
   CurrentValue = false,
   Flag = "AutoDarkDagger",
   Callback = function(Value)
        _G.AutoDarkDagger = Value
        StopTween(_G.AutoDarkDagger)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Dark Dagger [HOP]",
   CurrentValue = false,
   Flag = "AutoDarkDaggerHop",
   Callback = function(Value)
        _G.AutoDarkDagger_Hop = Value
   end,
})

local CDKSection = ItemsTab:CreateSection("⚔️ Cursed Dual Katana")

ItemsTab:CreateToggle({
   Name = "Auto Cursed Dual Katana",
   CurrentValue = false,
   Flag = "AutoCDK",
   Callback = function(Value)
        Auto_Cursed_Dual_Katana = Value
        StopTween(Auto_Cursed_Dual_Katana)
   end,
})

local ObservationSection = ItemsTab:CreateSection("👁️ Observation V2")

ItemsTab:CreateToggle({
   Name = "Auto Observation V2",
   CurrentValue = false,
   Flag = "AutoObsV2",
   Callback = function(Value)
        _G.AutoObservationHakiV2 = Value
        StopTween(_G.AutoObservationHakiV2)
   end,
})

ItemsTab:CreateToggle({
   Name = "Auto Observation V2 [HOP]",
   CurrentValue = false,
   Flag = "AutoObsV2Hop",
   Callback = function(Value)
        _G.AutoObservation_Hop = Value
   end,
})

-- ==========================================
-- TAB 6: BOSSES
-- ==========================================
local BossTab = Window:CreateTab("👑 Bosses", 4483362458)
local DoughKingSection = BossTab:CreateSection("🍩 Dough King")

BossTab:CreateToggle({
   Name = "Auto Dough King",
   CurrentValue = false,
   Flag = "AutoDoughKing",
   Callback = function(Value)
        _G.Autodoughking = Value
        StopTween(_G.Autodoughking)
   end,
})

BossTab:CreateToggle({
   Name = "Auto Dough King [HOP]",
   CurrentValue = false,
   Flag = "AutoDoughKingHop",
   Callback = function(Value)
        _G.AutodoughkingHop = Value
   end,
})

local EliteSection = BossTab:CreateSection("⭐ Elite Hunter")

BossTab:CreateToggle({
   Name = "Auto Elite Hunter",
   CurrentValue = false,
   Flag = "AutoElite",
   Callback = function(Value)
        _G.AutoElite = Value
        StopTween(_G.AutoElite)
   end,
})

BossTab:CreateToggle({
   Name = "Auto Elite Hunter [HOP]",
   CurrentValue = false,
   Flag = "AutoEliteHop",
   Callback = function(Value)
        _G.AutoEliteHop = Value
   end,
})

local FactorySection = BossTab:CreateSection("🏭 Factory")

BossTab:CreateToggle({
   Name = "Auto Factory",
   CurrentValue = false,
   Flag = "AutoFactory",
   Callback = function(Value)
        _G.AutoFactory = Value
        StopTween(_G.AutoFactory)
   end,
})

local SeabeastSection = BossTab:CreateSection("🦈 Seabeast")

BossTab:CreateToggle({
   Name = "Auto Seabeast",
   CurrentValue = false,
   Flag = "AutoSeabeast",
   Callback = function(Value)
        _G.AutoSeaBest = Value
        StopTween(_G.AutoSeaBest)
   end,
})

BossTab:CreateToggle({
   Name = "Auto Seabeast [HOP]",
   CurrentValue = false,
   Flag = "AutoSeabeastHop",
   Callback = function(Value)
        _G.AutoSeaBestHop = Value
   end,
})

local ArenaSection = BossTab:CreateSection("🥊 Arena Trainer")

BossTab:CreateToggle({
   Name = "Auto Arena Trainer (Dummy)",
   CurrentValue = false,
   Flag = "AutoArena",
   Callback = function(Value)
        _G.Namfon = Value
        StopTween(_G.Namfon)
   end,
})

BossTab:CreateToggle({
   Name = "Auto Arena Trainer [HOP]",
   CurrentValue = false,
   Flag = "AutoArenaHop",
   Callback = function(Value)
        _G.AutoArenaTrainerHop = Value
   end,
})

local BoneSection = BossTab:CreateSection("🦴 Bone")

BossTab:CreateToggle({
   Name = "Auto Farm Bone",
   CurrentValue = false,
   Flag = "AutoBone",
   Callback = function(Value)
        _G.Auto_Bone2 = Value
        StopTween(_G.Auto_Bone2)
   end,
})

BossTab:CreateToggle({
   Name = "Auto Random Bone",
   CurrentValue = false,
   Flag = "AutoRandomBone",
   Callback = function(Value)
        _G.Auto_Random_Bone2 = Value
   end,
})

local CakePrinceSection = BossTab:CreateSection("🎂 Cake Prince")

BossTab:CreateToggle({
   Name = "Auto Cake Prince",
   CurrentValue = false,
   Flag = "AutoCakePrince",
   Callback = function(Value)
        _G.AutoCakePrince = Value
        StopTween(_G.AutoCakePrince)
   end,
})

local PlayerHunterSection = BossTab:CreateSection("🎯 Player Hunter")

BossTab:CreateToggle({
   Name = "Auto Player Hunter",
   CurrentValue = false,
   Flag = "AutoPlayerHunter",
   Callback = function(Value)
        _G.AutoPlayerHunter = Value
        StopTween(_G.AutoPlayerHunter)
   end,
})

-- ==========================================
-- TAB 7: MELEE V2
-- ==========================================
local MeleeTab = Window:CreateTab("🥋 Melee V2", 4483362458)
local MeleeSection = MeleeTab:CreateSection("⚡ Auto Get Fighting Styles")

MeleeTab:CreateToggle({
   Name = "Auto Death Step",
   CurrentValue = false,
   Flag = "AutoDeathStep",
   Callback = function(Value)
        _G.AutoDeathStep = Value
   end,
})

MeleeTab:CreateToggle({
   Name = "Auto SharkMan Karate",
   CurrentValue = false,
   Flag = "AutoSharkman",
   Callback = function(Value)
        _G.AutoSharkman = Value
   end,
})

MeleeTab:CreateToggle({
   Name = "Auto Electric Claw",
   CurrentValue = false,
   Flag = "AutoElectricClaw",
   Callback = function(Value)
        _G.AutoElectricClaw = Value
   end,
})

MeleeTab:CreateToggle({
   Name = "Auto Dragon Talon",
   CurrentValue = false,
   Flag = "AutoDragonTalon",
   Callback = function(Value)
        _G.AutoDragonTalon = Value
   end,
})

MeleeTab:CreateToggle({
   Name = "Auto GodHuman",
   CurrentValue = false,
   Flag = "AutoGodHuman",
   Callback = function(Value)
        _G.Auto_God_Human = Value
   end,
})

local MeleeInfoSection = MeleeTab:CreateSection("ℹ️ Informações")

MeleeTab:CreateParagraph({
    Title = "📋 Como Funciona",
    Content = "Os toggles acima farão automaticamente:\n1. Comprar o fighting style base\n2. Upar até level 400\n3. Comprar a evolução V2\n\nCertifique-se de ter beli e fragments!"
})

-- ==========================================
-- TAB 8: SHOP
-- ==========================================
local ShopTab = Window:CreateTab("🛒 Shop", 4483362458)
local HakiSection = ShopTab:CreateSection("💪 Haki")

ShopTab:CreateButton({
   Name = "Buy Geppo",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Buso Haki",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Soru (Flash Step)",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Observation (Ken) Haki",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
   end,
})

local MeleeShopSection = ShopTab:CreateSection("🥊 Fighting Styles")

ShopTab:CreateButton({
   Name = "Buy Black Leg",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Electro",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Fishman Karate",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Dragon Claw",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Superhuman",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
   end,
})

local SwordShopSection = ShopTab:CreateSection("⚔️ Swords")

ShopTab:CreateButton({
   Name = "Buy Cutlass",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Katana",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Iron Mace",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Dual Katana",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Triple Katana",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Pipe",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Dual-Headed Blade",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Bisento",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Soul Cane",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
   end,
})

local GunShopSection = ShopTab:CreateSection("🔫 Guns")

ShopTab:CreateButton({
   Name = "Buy Slingshot",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Musket",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Flintlock",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Refined Slingshot",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Slingshot")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Refined Flintlock",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Cannon",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Kabucha [1,500 Fragments]",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Bizarre Rifle [250 Ectoplasm]",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Buy",1)
   end,
})

local RaceShopSection = ShopTab:CreateSection("🧬 Race")

ShopTab:CreateButton({
   Name = "Buy Ghoul Race [100 Ectoplasm]",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","BuyCheck",4)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Change",4)
   end,
})

ShopTab:CreateButton({
   Name = "Buy Cyborg Race [2,500 Fragments]",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer","Buy")
   end,
})

local OtherShopSection = ShopTab:CreateSection("💎 Outros")

ShopTab:CreateButton({
   Name = "Refund Stats [2,500 Fragments]",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
   end,
})

ShopTab:CreateButton({
   Name = "Random Race [3,000 Fragments]",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
   end,
})

--[[
═══════════════════════════════════════════════════════════════
              LAG TECK FUSION V3.0 - PARTE 4/4 FINAL
       TELEPORT, ESP, RAID, RACE V4, FRUIT, PVP & MISC
═══════════════════════════════════════════════════════════════
Discord: discord.gg/RnZ6XHHFj7
Linhas: 900+ | Parte: 4 de 4 (FINAL)
--]]

-- ==========================================
-- TAB 9: TELEPORT
-- ==========================================
local TeleportTab = Window:CreateTab("🌍 Teleport", 4483362458)
local IslandSection = TeleportTab:CreateSection("🏝️ Teleport Island")

local IslandList = {}
if World1 then
    IslandList = {"WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City","Shank Room","Mob Island"}
elseif World2 then
    IslandList = {"The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colossuim","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island","Ussop Island","Mini Sky Island"}
elseif World3 then
    IslandList = {"Mansion","Port Town","Great Tree","Castle On The Sea","MiniSky","Hydra Island","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Tiki Outpost New","Candy Island New"}
end

local SelectIslandDropdown = TeleportTab:CreateDropdown({
   Name = "Selecionar Ilha",
   Options = IslandList,
   CurrentOption = "",
   Flag = "SelectIsland",
   Callback = function(Option)
        _G.SelectIsland = Option
   end,
})

local TeleportIslandToggle = TeleportTab:CreateToggle({
   Name = "Teleport to Island",
   CurrentValue = false,
   Flag = "TeleportIsland",
   Callback = function(Value)
        _G.TeleportIsland = Value
        if _G.TeleportIsland then
            repeat wait()
                if _G.SelectIsland == "WindMill" then
                    topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                elseif _G.SelectIsland == "Marine" then
                    topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                elseif _G.SelectIsland == "Middle Town" then
                    topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                elseif _G.SelectIsland == "Jungle" then
                    topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
                elseif _G.SelectIsland == "Pirate Village" then
                    topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
                elseif _G.SelectIsland == "Desert" then
                    topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                elseif _G.SelectIsland == "Snow Island" then
                    topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
                elseif _G.SelectIsland == "MarineFord" then
                    topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
                elseif _G.SelectIsland == "Colosseum" then
                    topos(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
                elseif _G.SelectIsland == "Sky Island 1" then
                    topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
                elseif _G.SelectIsland == "Sky Island 2" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
                elseif _G.SelectIsland == "Sky Island 3" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                elseif _G.SelectIsland == "Prison" then
                    topos(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                elseif _G.SelectIsland == "Magma Village" then
                    topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
                elseif _G.SelectIsland == "Under Water Island" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                elseif _G.SelectIsland == "Fountain City" then
                    topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                elseif _G.SelectIsland == "Shank Room" then
                    topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                elseif _G.SelectIsland == "Mob Island" then
                    topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                elseif _G.SelectIsland == "The Cafe" then
                    topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                elseif _G.SelectIsland == "Frist Spot" then
                    topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
                elseif _G.SelectIsland == "Dark Area" then
                    topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
                elseif _G.SelectIsland == "Flamingo Mansion" then
                    topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
                elseif _G.SelectIsland == "Flamingo Room" then
                    topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                elseif _G.SelectIsland == "Green Zone" then
                    topos(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
                elseif _G.SelectIsland == "Factory" then
                    topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
                elseif _G.SelectIsland == "Colossuim" then
                    topos(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
                elseif _G.SelectIsland == "Zombie Island" then
                    topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
                elseif _G.SelectIsland == "Two Snow Mountain" then
                    topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
                elseif _G.SelectIsland == "Punk Hazard" then
                    topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
                elseif _G.SelectIsland == "Cursed Ship" then
                    topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                elseif _G.SelectIsland == "Ice Castle" then
                    topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
                elseif _G.SelectIsland == "Forgotten Island" then
                    topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
                elseif _G.SelectIsland == "Ussop Island" then
                    topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                elseif _G.SelectIsland == "Mini Sky Island" then
                    topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
                elseif _G.SelectIsland == "Great Tree" then
                    topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
                elseif _G.SelectIsland == "Castle On The Sea" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324, 314.858734, -3150.69922))
                elseif _G.SelectIsland == "MiniSky" then
                    topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
                elseif _G.SelectIsland == "Port Town" then
                    topos(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
                elseif _G.SelectIsland == "Hydra Island" then
                    topos(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
                elseif _G.SelectIsland == "Floating Turtle" then
                    topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
                elseif _G.SelectIsland == "Mansion" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                elseif _G.SelectIsland == "Haunted Castle" then
                    topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
                elseif _G.SelectIsland == "Ice Cream Island" then
                    topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
                elseif _G.SelectIsland == "Peanut Island" then
                    topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
                elseif _G.SelectIsland == "Cake Island" then
                    topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                elseif _G.SelectIsland == "Cocoa Island" then
                    topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
                elseif _G.SelectIsland == "Candy Island New" then
                    topos(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
                elseif _G.SelectIsland == "Tiki Outpost New" then
                    topos(CFrame.new(-16101.1885, 12.8422165, 380.942291))
                end
            until not _G.TeleportIsland
        end
        StopTween(_G.TeleportIsland)
   end,
})

local NPCSection = TeleportTab:CreateSection("👤 Teleport NPC")

local NPCList = {}
if World1 then
    NPCList = {"Random Devil Fruit","Blox Fruits Dealer","Remove Devil Fruit","Ability Teacher","Dark Step","Electro","Fishman Karate"}
elseif World2 then
    NPCList = {"Dragon Berath","Mysterious Man","Mysterious Scientist","Awakening Expert","Nerd","Bar Manager","Blox Fruits Dealer","Trevor","Enhancement Editor","Pirate Recruiter","Marines Recruiter","Chemist","Cyborg","Ghoul Mark","Guashiem","El Admin","El Rodolfo","Arowe"}
elseif World3 then
    NPCList = {"Blox Fruits Dealer","Remove Devil Fruit","Horned Man","Hungry Man","Previous Hero","Butler","Lunoven","Trevor","Elite Hunter","Player Hunter","Uzoth","Spy","Beast Hunter","Shafi"}
end

local SelectNPCDropdown = TeleportTab:CreateDropdown({
   Name = "Selecionar NPC",
   Options = NPCList,
   CurrentOption = "",
   Flag = "SelectNPC",
   Callback = function(Option)
        _G.SelectNPC = Option
   end,
})

local TeleportNPCToggle = TeleportTab:CreateToggle({
   Name = "Teleport to NPC",
   CurrentValue = false,
   Flag = "TeleportNPC",
   Callback = function(Value)
        _G.TeleportNPC = Value
        if _G.TeleportNPC then
            repeat wait()
                if _G.SelectNPC == "Blox Fruits Dealer" then
                    if World1 then topos(CFrame.new(-923.255066, 7.67800522, 1608.61011))
                    elseif World2 then topos(CFrame.new(-450.725464, 73.0458984, 355.636902))
                    elseif World3 then topos(CFrame.new(-12511, 337, -7448)) end
                elseif _G.SelectNPC == "Random Devil Fruit" then
                    if World1 then topos(CFrame.new(-1436.19727, 61.8777695, 4.75247526))
                    elseif World3 then topos(CFrame.new(-12491, 337, -7449)) end
                elseif _G.SelectNPC == "Remove Devil Fruit" then
                    if World1 then topos(CFrame.new(5664.80469, 64.677681, 867.85907))
                    elseif World3 then topos(CFrame.new(-5571, 1089, -2661)) end
                elseif _G.SelectNPC == "Ability Teacher" then
                    topos(CFrame.new(-1057.67822, 9.65220833, 1799.49146))
                elseif _G.SelectNPC == "Dark Step" then
                    topos(CFrame.new(-987.873047, 13.7778397, 3989.4978))
                elseif _G.SelectNPC == "Electro" then
                    topos(CFrame.new(-5389.49561, 13.283, -2149.80151))
                elseif _G.SelectNPC == "Fishman Karate" then
                    topos(CFrame.new(61581.8047, 18.8965912, 987.832703))
                end
            until not _G.TeleportNPC
        end
        StopTween(_G.TeleportNPC)
   end,
})

local MirageSection = TeleportTab:CreateSection("🌫️ Mirage Island")

TeleportTab:CreateToggle({
   Name = "Teleport to Mirage Island",
   CurrentValue = false,
   Flag = "TPMirage",
   Callback = function(Value)
        _G.AutoMysticIsland = Value
        StopTween(_G.AutoMysticIsland)
   end,
})

TeleportTab:CreateButton({
   Name = "Remove Frog (Fog)",
   Callback = function()
        game:GetService("Lighting").LightingLayers:Destroy()
        game:GetService("Lighting").Sky:Destroy()
   end,
})

-- ==========================================
-- TAB 10: ESP
-- ==========================================
local ESPTab = Window:CreateTab("👁️ ESP", 4483362458)
local ESPSection = ESPTab:CreateSection("🔍 ESP Configuration")

ESPTab:CreateToggle({
   Name = "👥 ESP Players",
   CurrentValue = false,
   Flag = "ESPPlayers",
   Callback = function(Value)
        ESPPlayer = Value
        UpdatePlayerChams()
   end,
})

ESPTab:CreateToggle({
   Name = "😈 ESP Devil Fruits",
   CurrentValue = false,
   Flag = "ESPFruits",
   Callback = function(Value)
        DevilFruitESP = Value
        while DevilFruitESP do wait()
            UpdateDevilChams()
        end
   end,
})

ESPTab:CreateToggle({
   Name = "🏝️ ESP Islands",
   CurrentValue = false,
   Flag = "ESPIslands",
   Callback = function(Value)
        IslandESP = Value
        while IslandESP do wait()
            UpdateIslandESP()
        end
   end,
})

ESPTab:CreateToggle({
   Name = "🌺 ESP Flowers",
   CurrentValue = false,
   Flag = "ESPFlowers",
   Callback = function(Value)
        FlowerESP = Value
        UpdateFlowerChams()
   end,
})

ESPTab:CreateToggle({
   Name = "📦 ESP Chests",
   CurrentValue = false,
   Flag = "ESPChests",
   Callback = function(Value)
        ChestESP = Value
        while ChestESP do wait()
            UpdateChestChams()
        end
   end,
})

-- Funções ESP
function isnil(thing)
    return (thing == nil)
end

local function round(n)
    return math.floor(tonumber(n) + 0.5)
end

Number = math.random(1, 1000000)

function UpdatePlayerChams()
    for i,v in pairs(game:GetService'Players':GetChildren()) do
        pcall(function()
            if not isnil(v.Character) then
                if ESPPlayer then
                    if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v.Character.Head)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Character.Head
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Team == game.Players.LocalPlayer.Team then
                            name.TextColor3 = Color3.new(0,255,0)
                        else
                            name.TextColor3 = Color3.new(255,0,0)
                        end
                    else
                        v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
                    end
                else
                    if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end
        end)
    end
end

function UpdateDevilChams()
    for i,v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if DevilFruitESP then
                if string.find(v.Name, "Fruit") then
                    if not v.Handle:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v.Handle)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                    else
                        v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v.Handle:FindFirstChild('NameEsp'..Number) then
                    v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end)
    end
end

function UpdateIslandESP()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function UpdateFlowerChams()
    for i,v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if v.Name == "Flower2" or v.Name == "Flower1" then
                if FlowerESP then
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if v.Name == "Flower1" then
                            name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                            name.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if v.Name == "Flower2" then
                            name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                else
                    if v:FindFirstChild('NameEsp'..Number) then
                        v:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end
        end)
    end
end

-- Loop ESP
spawn(function()
    while wait(2) do
        if FlowerESP then UpdateFlowerChams() end
        if DevilFruitESP then UpdateDevilChams() end
        if ChestESP then UpdateChestChams() end
        if ESPPlayer then UpdatePlayerChams() end
    end
end)

-- ==========================================
-- TAB 11: RAID
-- ==========================================
local RaidTab = Window:CreateTab("⚔️ Raid", 4483362458)
local RaidInfoSection = RaidTab:CreateSection("ℹ️ Raid Information")

local TimeRaidLabel = RaidTab:CreateLabel("Wait For Dungeon")
local CheckIslandLabel = RaidTab:CreateLabel("Island: Not Raid")

local RaidChipSection = RaidTab:CreateSection("🎫 Chip Configuration")

_G.SelectChip = selectraids or ""
Raidslist = {}
RaidsModule = require(game.ReplicatedStorage.Raids)
for i,v in pairs(RaidsModule.raids) do
    table.insert(Raidslist,v)
end
for i,v in pairs(RaidsModule.advancedRaids) do
    table.insert(Raidslist,v)
end

RaidTab:CreateDropdown({
   Name = "Select Chip",
   Options = Raidslist,
   CurrentOption = "",
   Flag = "SelectChip",
   Callback = function(Option)
        _G.SelectChip = Option
   end,
})

RaidTab:CreateButton({
   Name = "Buy Chip Selected",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)
   end,
})

RaidTab:CreateToggle({
   Name = "Auto Start Raid",
   CurrentValue = false,
   Flag = "AutoStartRaid",
   Callback = function(Value)
        _G.Auto_StartRaid = Value
   end,
})

local RaidMainSection = RaidTab:CreateSection("⚔️ Raid Settings")

RaidTab:CreateToggle({
   Name = "Kill Aura",
   CurrentValue = false,
   Flag = "KillAura",
   Callback = function(Value)
        _G.Kill_Aura = Value
   end,
})

RaidTab:CreateToggle({
   Name = "Next Island",
   CurrentValue = false,
   Flag = "NextIsland",
   Callback = function(Value)
        _G.Auto_Dungeon = Value
        StopTween(_G.Auto_Dungeon)
   end,
})

RaidTab:CreateToggle({
   Name = "Auto Awakener",
   CurrentValue = false,
   Flag = "AutoAwakener",
   Callback = function(Value)
        _G.Auto_Awakener = Value
   end,
})

local LawRaidSection = RaidTab:CreateSection("⚖️ Law Raid")

RaidTab:CreateToggle({
   Name = "Auto Buy Law Chip",
   CurrentValue = false,
   Flag = "AutoBuyLawChip",
   Callback = function(Value)
        _G.Auto_Buy_Law_Chip = Value
   end,
})

RaidTab:CreateToggle({
   Name = "Start Law Raid",
   CurrentValue = false,
   Flag = "StartLawRaid",
   Callback = function(Value)
        _G.Auto_Start_Law_Dungeon = Value
   end,
})

RaidTab:CreateToggle({
   Name = "Auto Kill Law",
   CurrentValue = false,
   Flag = "AutoKillLaw",
   Callback = function(Value)
        _G.Auto_Kill_Law = Value
        StopTween(_G.Auto_Kill_Law)
   end,
})

-- ==========================================
-- TAB 12: RACE V4
-- ==========================================
local RaceTab = Window:CreateTab("🌙 Race V4", 4483362458)
local RaceSection = RaceTab:CreateSection("🧬 Race Configuration")

RaceTab:CreateToggle({
   Name = "Auto Race (V1-V2-V3)",
   CurrentValue = false,
   Flag = "AutoRace",
   Callback = function(Value)
        _G.AutoRace = Value
        StardFarm = Value
        StopTween(StardFarm)
        StopTween(_G.AutoRace)
   end,
})

local PullLeverSection = RaceTab:CreateSection("🎚️ Pull Lever")

RaceTab:CreateToggle({
   Name = "Auto Pull Lever",
   CurrentValue = false,
   Flag = "AutoPullLever",
   Callback = function(Value)
        _G.AutoPullLever = Value
        StopTween(_G.AutoPullLever)
   end,
})

RaceTab:CreateToggle({
   Name = "Auto Turn On Race V3",
   CurrentValue = false,
   Flag = "AutoV3",
   Callback = function(Value)
        _G.V3 = Value
   end,
})

RaceTab:CreateToggle({
   Name = "Auto Turn On Race V4",
   CurrentValue = false,
   Flag = "AutoV4",
   Callback = function(Value)
        _G.V4 = Value
   end,
})

RaceTab:CreateToggle({
   Name = "Move Cam to Moon",
   CurrentValue = false,
   Flag = "MoveCamMoon",
   Callback = function(Value)
        _G.AutoDooHee = Value
   end,
})

local RaceV4Section = RaceTab:CreateSection("⚡ Race V4 Settings")

RaceTab:CreateToggle({
   Name = "Auto Buy Gear",
   CurrentValue = false,
   Flag = "AutoBuyGear",
   Callback = function(Value)
        _G.Auto_Farm_Bone4 = Value
        StopTween(_G.Auto_Farm_Bone4)
   end,
})

RaceTab:CreateToggle({
   Name = "Auto Train Race",
   CurrentValue = false,
   Flag = "AutoTrainRace",
   Callback = function(Value)
        _G.AutoRace = Value
        StardFarm = Value
        StopTween(StardFarm)
        StopTween(_G.AutoRace)
   end,
})

local TempleSection = RaceTab:CreateSection("🏛️ Temple of Time")

RaceTab:CreateButton({
   Name = "Teleport to Great Tree Top",
   Callback = function()
        topos(CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625))
   end,
})

RaceTab:CreateButton({
   Name = "Teleport to Temple",
   Callback = function()
        Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
   end,
})

RaceTab:CreateButton({
   Name = "Teleport to Lever",
   Callback = function()
        topos(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
   end,
})

RaceTab:CreateButton({
   Name = "Teleport to Ancient One",
   Callback = function()
        topos(CFrame.new(28973.0879, 14889.9756, -120.298691))
   end,
})

RaceTab:CreateButton({
   Name = "Teleport to Clock",
   Callback = function()
        topos(CFrame.new(29551.9941, 15069.002, -85.5179291))
   end,
})

RaceTab:CreateButton({
   Name = "Teleport to Trial Doors",
   Callback = function()
        if game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
            topos(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
            topos(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
            topos(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
            topos(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
            topos(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
            topos(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
        end
   end,
})

local TrialsSection = RaceTab:CreateSection("🎯 Trial Settings")

RaceTab:CreateToggle({
   Name = "Auto Complete Trials",
   CurrentValue = false,
   Flag = "AutoTrials",
   Callback = function(Value)
        _G.AutoQuestRace = Value
        StopTween(_G.AutoQuestRace)
   end,
})

RaceTab:CreateToggle({
   Name = "Auto Kill Players After Trials",
   CurrentValue = false,
   Flag = "KillAfterTrials",
   Callback = function(Value)
        KillPlayer = Value
        StopTween(KillPlayer)
        _G.TurnKen = Value
   end,
})

-- ==========================================
-- TAB 13: DEVIL FRUIT
-- ==========================================
local FruitTab = Window:CreateTab("😈 Devil Fruit", 4483362458)
local FruitSection = FruitTab:CreateSection("🎲 Random Fruit")

FruitTab:CreateButton({
   Name = "Random Fruit",
   Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
   end,
})

FruitTab:CreateToggle({
   Name = "Auto Random Fruit",
   CurrentValue = false,
   Flag = "AutoRandomFruit",
   Callback = function(Value)
        _G.Random_Auto = Value
   end,
})

local StoreFruitSection = FruitTab:CreateSection("📦 Store Fruits")

FruitTab:CreateToggle({
   Name = "Auto Store Fruits",
   CurrentValue = false,
   Flag = "AutoStoreFruit",
   Callback = function(Value)
        _G.AutoStoreFruit = Value
   end,
})

FruitTab:CreateToggle({
   Name = "Teleport To Fruit Spawn",
   CurrentValue = false,
   Flag = "TPFruitSpawn",
   Callback = function(Value)
        _G.Tweenfruit = Value
        StopTween(_G.Tweenfruit)
   end,
})

FruitTab:CreateToggle({
   Name = "Auto Drop Fruit",
   CurrentValue = false,
   Flag = "AutoDropFruit",
   Callback = function(Value)
        _G.DropFruit = Value
   end,
})

FruitTab:CreateToggle({
   Name = "Bring All Fruit [⚠️ High Kick Risk]",
   CurrentValue = false,
   Flag = "BringAllFruit",
   Callback = function(Value)
        _G.BringFruitBF = Value
   end,
})

-- ==========================================
-- TAB 14: PLAYERS & PVP
-- ==========================================
local PlayerTab = Window:CreateTab("🎮 Players & PVP", 4483362458)
local PlayerListSection = PlayerTab:CreateSection("👥 Player List")

local Playerslist = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist,v.Name)
end

local SelectPlayerDropdown = PlayerTab:CreateDropdown({
   Name = "Select Player",
   Options = Playerslist,
   CurrentOption = "",
   Flag = "SelectPlayer",
   Callback = function(Option)
        _G.SelectPly = Option
   end,
})

PlayerTab:CreateButton({
   Name = "🔄 Refresh Player List",
   Callback = function()
        Playerslist = {}
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            table.insert(Playerslist, v.Name)
        end
        SelectPlayerDropdown:Refresh(Playerslist)
   end,
})

local PlayerActionsSection = PlayerTab:CreateSection("⚔️ Player Actions")

PlayerTab:CreateToggle({
   Name = "Teleport To Player",
   CurrentValue = false,
   Flag = "TPPlayer",
   Callback = function(Value)
        _G.TeleportPly = Value
        pcall(function()
            if _G.TeleportPly then
                repeat topos(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame) wait()
                until _G.TeleportPly == false
            end
            StopTween(_G.TeleportPly)
        end)
   end,
})

PlayerTab:CreateToggle({
   Name = "Auto Kill Player",
   CurrentValue = false,
   Flag = "AutoKillPlayer",
   Callback = function(Value)
        _G.Auto_Kill_Ply = Value
        StopTween(_G.Auto_Kill_Ply)
   end,
})

local AimbotSection = PlayerTab:CreateSection("🎯 Aimbot")

PlayerTab:CreateToggle({
   Name = "Aimbot Gun",
   CurrentValue = false,
   Flag = "AimbotGun",
   Callback = function(Value)
        _G.Aimbot_Gun = Value
   end,
})

PlayerTab:CreateToggle({
   Name = "Aimbot Skill",
   CurrentValue = false,
   Flag = "AimbotSkill",
   Callback = function(Value)
        _G.Aimbot_Skill = Value
   end,
})

PlayerTab:CreateToggle({
   Name = "Aimbot Skill Nearest",
   CurrentValue = false,
   Flag = "AimbotSkillNearest",
   Callback = function(Value)
        AimSkillNearest = Value
   end,
})

-- ==========================================
-- TAB 15: SERVER
-- ==========================================
local ServerTab = Window:CreateTab("🌐 Server", 4483362458)
local ServerInfoSection = ServerTab:CreateSection("ℹ️ Server Information")

local ServerTimeLabel = ServerTab:CreateLabel("Server Time: Loading...")
local MoonLabel = ServerTab:CreateLabel("Moon: Loading...")
local EliteLabel = ServerTab:CreateLabel("Elite: Not Spawned")
local MirageLabel = ServerTab:CreateLabel("Mirage: Not Found")

local ServerActionsSection = ServerTab:CreateSection("⚙️ Server Actions")

ServerTab:CreateInput({
   Name = "Job ID",
   PlaceholderText = "Enter Job ID",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
        _G.Job = Text
   end,
})

ServerTab:CreateButton({
   Name = "Join Server by Job ID",
   Callback = function()
        _G.AutoRejoin = false
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
   end,
})

ServerTab:CreateButton({
   Name = "Copy Job ID",
   Callback = function()
        setclipboard(tostring(game.JobId))
        Rayfield:Notify({Title = "Job ID Copiado!", Content = "Job ID copiado para área de transferência!", Duration = 3})
   end,
})

ServerTab:CreateButton({
   Name = "Hop Server",
   Callback = function()
        _G.AutoRejoin = false
        Hop()
   end,
})

ServerTab:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
   end,
})

local HopSection = ServerTab:CreateSection("🔄 Auto Hop")

ServerTab:CreateToggle({
   Name = "Hop Find Full Moon",
   CurrentValue = false,
   Flag = "HopFindMoon",
   Callback = function(Value)
        _G.Hopfindmoon = Value
   end,
})

ServerTab:CreateToggle({
   Name = "Hop Find Mirage",
   CurrentValue = false,
   Flag = "HopFindMirage",
   Callback = function(Value)
        _G.Hopfinddao = Value
   end,
})

-- ==========================================
-- TAB 16: MISC
-- ==========================================
local MiscTab = Window:CreateTab("⚙️ Misc", 4483362458)
local CodesSection = MiscTab:CreateSection("🎁 Codes")

MiscTab:CreateToggle({
   Name = "Auto Redeem Codes",
   CurrentValue = false,
   Flag = "AutoRedeemCodes",
   Callback = function(Value)
        _G.AutoRedeemCode = Value
   end,
})

MiscTab:CreateButton({
   Name = "Redeem All Codes",
   Callback = function()
        local codes = {"JULYUPDATE_RESET","staffbattle","Sub2CaptainMaui","SUB2GAMERROBOT_RESET1","KittGaming","Sub2Fer999","Enyu_is_Pro","Magicbus","ENYU_IS_PRO","FUDD10","BIGNEWS","THEGREATACE","SUB2GAMERROBOT_EXP1","STRAWHATMAIME","SUB2OFFICIALNOOBIE","SUB2NOOBMASTER123","SUB2DAIGROCK","AXIORE","TANTAIGAMIMG","STRAWHATMAINE","JCWK","FUDD10_V2","SUB2FER999","MAGICBIS","TY_FOR_WATCHING","STARCODEHEO"}
        for i,v in pairs(codes) do
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Redeem",v)
        end
        Rayfield:Notify({Title = "✅ Codes", Content = "Todos os códigos foram resgatados!", Duration = 5})
   end,
})

local BoostSection = MiscTab:CreateSection("⚡ Performance Boost")

MiscTab:CreateToggle({
   Name = "Boost FPS",
   CurrentValue = false,
   Flag = "BoostFPS",
   Callback = function(Value)
        if Value then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                end
            end
        end
   end,
})

MiscTab:CreateToggle({
   Name = "White Screen (Max FPS)",
   CurrentValue = false,
   Flag = "WhiteScreen",
   Callback = function(Value)
        game:GetService("RunService"):Set3dRenderingEnabled(not Value)
   end,
})

MiscTab:CreateToggle({
   Name = "Remove Effect",
   CurrentValue = false,
   Flag = "RemoveEffect",
   Callback = function(Value)
        _G.Remove_Effect = Value
   end,
})

local OtherSection = MiscTab:CreateSection("🎮 Others")

MiscTab:CreateToggle({
   Name = "Anti AFK",
   CurrentValue = true,
   Flag = "AntiAFK",
   Callback = function(Value)
        if Value then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end
   end,
})

-- ==========================================
-- NOTIFICAÇÃO FINAL
-- ==========================================
Rayfield:Notify({
   Title = "🎉 Script Totalmente Carregado!",
   Content = "Lag Teck Fusion V3.0 está pronto para uso!\nDivirta-se! 🚀",
   Duration = 8,
   Image = 4483362458,
   Actions = {
      Ignore = {
         Name = "Vamos lá!",
         Callback = function()
         end
      },
   },
})

print("✅ PARTE 4 (FINAL) CARREGADA - Lag Teck Fusion V3.0 COMPLETO!")
print("═══════════════════════════════════════════════════════════════")
print("            🌊 LAG TECK FUSION V3.0 - 100% CARREGADO!")
print("           Discord: discord.gg/RnZ6XHHFj7")
print("           Total: ~3000 linhas | 200+ Funções")
print("═══════════════════════════════════════════════════════════════")
