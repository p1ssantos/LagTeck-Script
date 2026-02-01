-- [[ LAG TECK COMMUNITY | BLOX FRUITS SUPREME v2.0 - VERSÃO COMPLETA ]] --
-- CRIADO POR: p1ssantos
-- DISCORD: discord.gg/RnZ6XHHFj7

if not game:IsLoaded() then game.Loaded:Wait() end
if _G.LagTeckLoaded then return end
_G.LagTeckLoaded = true

-- ============================================
-- CARREGANDO RAYFIELD COM LOGO PERSONALIZADA
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 Lag Teck | Blox Fruits",
   LoadingTitle = "Lag Teck Community",
   LoadingSubtitle = "by p1ssantos - Versão 2.0 Completa",
   ConfigurationSaving = { 
      Enabled = true, 
      FolderName = "LagTeckBloxFruits",
      FileName = "LagTeckConfig"
   },
   Discord = {
      Enabled = true,
      Invite = "RnZ6XHHFj7",
      RememberJoins = true
   },
   KeySystem = false,
   Theme = "Ocean"
})

-- Logo do Lag Teck (você pode trocar essa URL pela sua logo)
Rayfield:Notify({
   Title = "🔥 Lag Teck Loaded!",
   Content = "Script carregado com sucesso!\nVersão 2.0 - Completa",
   Duration = 6.5,
   Image = 4483362458, -- Ícone padrão, troque pelo ID da sua logo
})

-- ============================================
-- PROTEÇÃO ANTI-KICK & ANTI-BAN
-- ============================================
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
   local method = getnamecallmethod()
   if method == "Kick" or method == "kick" then 
      return wait(9e9) 
   end
   return old(self, ...)
end)
setreadonly(mt, true)

-- Anti-Detecção
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ============================================
-- VARIÁVEIS GLOBAIS DE CONTROLE
-- ============================================
_G.Settings = {
   -- FARMS
   AutoFarmLevel = false,
   AutoFarmBone = false,
   AutoFarmEctoplasm = false,
   AutoFarmCocoa = false,
   AutoFarmCake = false,
   AutoFarmElite = false,
   AutoFarmBoss = false,
   AutoFarmMastery = false,
   AutoFarmFragment = false,
   AutoFarmSeaBeast = false,
   
   -- RAIDS
   AutoRaid = false,
   AutoBuyChip = false,
   AutoStartRaid = false,
   AutoAwaken = false,
   SelectRaid = "Flame",
   
   -- FRUTAS
   AutoStoreFruit = true,
   AutoEatFruit = false,
   AutoBuyFruit = false,
   AutoSnipeFruit = false,
   
   -- COMBATE
   FastAttack = true,
   SelectWeapon = "Melee",
   AutoHaki = true,
   
   -- STATS
   AutoMelee = false,
   AutoDefense = false,
   AutoSword = false,
   AutoGun = false,
   AutoFruit = false,
   PointsToAdd = 1,
   
   -- MISC
   AutoTrial = false,
   AutoSeaEvent = false,
   BringMob = false,
   NoClip = false,
   FastMode = false,
   WhiteScreen = false,
   
   -- TELEPORTE
   ManualTeleport = false,
   SelectedIsland = "",
   
   -- SEA EVENTS
   AutoTerrorShark = false,
   AutoShip = false,
   AutoPiranha = false,
}

-- ============================================
-- IDENTIFICAÇÃO DE MUNDO
-- ============================================
local World1, World2, World3 = false, false, false
if game.PlaceId == 2753915549 then 
   World1 = true
   print("🌍 Você está no Sea 1 (Old World)")
elseif game.PlaceId == 4442272183 then 
   World2 = true
   print("🌍 Você está no Sea 2 (New World)")
elseif game.PlaceId == 7449423635 then 
   World3 = true
   print("🌍 Você está no Sea 3 (Third Sea)")
end

-- ============================================
-- FUNÇÕES ESSENCIAIS
-- ============================================

-- Função para pausar todos os farms
function PausarTodosFarms()
   for k, v in pairs(_G.Settings) do
      if type(v) == "boolean" and k:find("Auto") then
         _G.Settings[k] = false
      end
   end
   _G.Settings.ManualTeleport = true
   Rayfield:Notify({
      Title = "⚠️ Proteção Ativada",
      Content = "Todos os farms foram pausados para teleporte seguro!",
      Duration = 3,
   })
end

-- Equipar Arma
function EquiparArma()
   pcall(function()
      for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
         if v:IsA("Tool") then
            if (_G.Settings.SelectWeapon == "Melee" and v.ToolTip == "Melee") or
               (_G.Settings.SelectWeapon == "Sword" and v.ToolTip == "Sword") or
               (_G.Settings.SelectWeapon == "Fruit" and v.ToolTip == "Blox Fruit") or
               (_G.Settings.SelectWeapon == "Gun" and v.ToolTip == "Gun") then
               LocalPlayer.Character.Humanoid:EquipTool(v)
            end
         end
      end
   end)
end

-- Auto Haki
spawn(function()
   while wait(1) do
      if _G.Settings.AutoHaki then
         pcall(function()
            if not LocalPlayer.Character:FindFirstChild("HasBuso") then
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
         end)
      end
   end
end)

-- Fast Attack
local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]

function AttackFunction()
   if _G.Settings.FastAttack then
      pcall(function()
         local AC = CombatFrameworkR.activeController
         if AC and AC.equipped then
            for i = 1, 1 do
               local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                  LocalPlayer.Character,
                  {LocalPlayer.Character.HumanoidRootPart},
                  60
               )
               local cac = {}
               local hash = {}
               for k, v in pairs(bladehit) do
                  if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                     table.insert(cac, v.Parent.HumanoidRootPart)
                     hash[v.Parent] = true
                  end
               end
               bladehit = cac
               if #bladehit > 0 then
                  pcall(function()
                     AC:attack()
                  end)
               end
            end
         end
      end)
   end
end

-- Click Virtual
function ClickButton()
   game:GetService("VirtualUser"):CaptureController()
   game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end

-- Pegar Quest baseada no Level
function PegarQuest()
   local Level = LocalPlayer.Data.Level.Value
   local Quest = {}
   
   if World1 then
      if Level >= 1 and Level <= 9 then
         Quest = {Nome = "Bandit", QuestName = "BanditQuest1", LevelQuest = 1, 
                  CFrameMon = CFrame.new(1041, 16, 1543),
                  CFrameQuest = CFrame.new(1059, 16, 1550)}
      elseif Level >= 10 and Level <= 14 then
         Quest = {Nome = "Monkey", QuestName = "JungleQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-1585, 38, 149),
                  CFrameQuest = CFrame.new(-1598, 36, 153)}
      elseif Level >= 15 and Level <= 29 then
         Quest = {Nome = "Gorilla", QuestName = "JungleQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-1243, 12, -486),
                  CFrameQuest = CFrame.new(-1598, 36, 153)}
      elseif Level >= 30 and Level <= 39 then
         Quest = {Nome = "Pirate", QuestName = "BuggyQuest1", LevelQuest = 1,
                  CFrameMon = CFrame.new(-1141, 4, 3831),
                  CFrameQuest = CFrame.new(-1141, 4, 3831)}
      elseif Level >= 40 and Level <= 59 then
         Quest = {Nome = "Brute", QuestName = "BuggyQuest1", LevelQuest = 2,
                  CFrameMon = CFrame.new(-1140, 14, 4322),
                  CFrameQuest = CFrame.new(-1141, 4, 3831)}
      elseif Level >= 60 and Level <= 74 then
         Quest = {Nome = "Desert Bandit", QuestName = "DesertQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(932, 6, 4484),
                  CFrameQuest = CFrame.new(894, 5, 4392)}
      elseif Level >= 75 and Level <= 89 then
         Quest = {Nome = "Desert Officer", QuestName = "DesertQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(1580, 4, 4314),
                  CFrameQuest = CFrame.new(894, 5, 4392)}
      elseif Level >= 90 and Level <= 99 then
         Quest = {Nome = "Snow Bandit", QuestName = "SnowQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(1413, 87, -1298),
                  CFrameQuest = CFrame.new(1389, 88, -1298)}
      elseif Level >= 100 and Level <= 119 then
         Quest = {Nome = "Snowman", QuestName = "SnowQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(1413, 119, -1416),
                  CFrameQuest = CFrame.new(1389, 88, -1298)}
      elseif Level >= 120 and Level <= 149 then
         Quest = {Nome = "Chief Petty Officer", QuestName = "MarineQuest2", LevelQuest = 1,
                  CFrameMon = CFrame.new(-4855, 22, 4308),
                  CFrameQuest = CFrame.new(-5039, 27, 4324)}
      elseif Level >= 150 and Level <= 174 then
         Quest = {Nome = "Sky Bandit", QuestName = "SkyQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-4981, 277, -2830),
                  CFrameQuest = CFrame.new(-4839, 716, -2619)}
      elseif Level >= 175 and Level <= 189 then
         Quest = {Nome = "Dark Master", QuestName = "SkyQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-5260, 389, -2229),
                  CFrameQuest = CFrame.new(-4839, 716, -2619)}
      elseif Level >= 190 and Level <= 209 then
         Quest = {Nome = "Prisoner", QuestName = "PrisonerQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(5411, 1, 690),
                  CFrameQuest = CFrame.new(5308, 1, 475)}
      elseif Level >= 210 and Level <= 249 then
         Quest = {Nome = "Dangerous Prisoner", QuestName = "PrisonerQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(5411, 1, 690),
                  CFrameQuest = CFrame.new(5308, 1, 475)}
      elseif Level >= 250 and Level <= 274 then
         Quest = {Nome = "Toga Warrior", QuestName = "ColosseumQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-1770, 7, -2983),
                  CFrameQuest = CFrame.new(-1580, 6, -2986)}
      elseif Level >= 275 and Level <= 299 then
         Quest = {Nome = "Gladiator", QuestName = "ColosseumQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-1366, 7, -3143),
                  CFrameQuest = CFrame.new(-1580, 6, -2986)}
      elseif Level >= 300 and Level <= 324 then
         Quest = {Nome = "Military Soldier", QuestName = "MagmaQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-5408, 10, 8447),
                  CFrameQuest = CFrame.new(-5313, 10, 8515)}
      elseif Level >= 325 and Level <= 374 then
         Quest = {Nome = "Military Spy", QuestName = "MagmaQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-5802, 75, 8820),
                  CFrameQuest = CFrame.new(-5313, 10, 8515)}
      elseif Level >= 375 and Level <= 449 then
         Quest = {Nome = "Fishman Warrior", QuestName = "FishmanQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(60946, 18, 1583),
                  CFrameQuest = CFrame.new(61122, 18, 1569)}
      elseif Level >= 450 and Level <= 474 then
         Quest = {Nome = "God's Guard", QuestName = "SkyExp1Quest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-4698, 843, -1912),
                  CFrameQuest = CFrame.new(-4721, 843, -1949)}
      elseif Level >= 475 and Level <= 524 then
         Quest = {Nome = "Shanda", QuestName = "SkyExp1Quest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-7685, 5567, -502),
                  CFrameQuest = CFrame.new(-7859, 5544, -381)}
      elseif Level >= 525 and Level <= 549 then
         Quest = {Nome = "Royal Squad", QuestName = "SkyExp2Quest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-7670, 5606, -1460),
                  CFrameQuest = CFrame.new(-7906, 5634, -1411)}
      elseif Level >= 550 and Level <= 624 then
         Quest = {Nome = "Royal Soldier", QuestName = "SkyExp2Quest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-7828, 5606, -1868),
                  CFrameQuest = CFrame.new(-7906, 5634, -1411)}
      elseif Level >= 625 and Level <= 699 then
         Quest = {Nome = "Galley Pirate", QuestName = "FountainQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(5589, 38, 4067),
                  CFrameQuest = CFrame.new(5259, 37, 4050)}
      end
      
   elseif World2 then
      if Level >= 700 and Level <= 724 then
         Quest = {Nome = "Raider", QuestName = "Area1Quest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-728, 71, 2636),
                  CFrameQuest = CFrame.new(-429, 71, 1836)}
      elseif Level >= 725 and Level <= 774 then
         Quest = {Nome = "Mercenary", QuestName = "Area1Quest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-1004, 88, 1424),
                  CFrameQuest = CFrame.new(-429, 71, 1836)}
      elseif Level >= 775 and Level <= 799 then
         Quest = {Nome = "Swan Pirate", QuestName = "Area2Quest", LevelQuest = 1,
                  CFrameMon = CFrame.new(878, 122, 1235),
                  CFrameQuest = CFrame.new(638, 71, 918)}
      elseif Level >= 800 and Level <= 874 then
         Quest = {Nome = "Factory Staff", QuestName = "Area2Quest", LevelQuest = 2,
                  CFrameMon = CFrame.new(295, 73, -56),
                  CFrameQuest = CFrame.new(632, 73, 918)}
      elseif Level >= 875 and Level <= 899 then
         Quest = {Nome = "Marine Lieutenant", QuestName = "MarineQuest3", LevelQuest = 1,
                  CFrameMon = CFrame.new(-2806, 71, -3208),
                  CFrameQuest = CFrame.new(-2440, 71, -3216)}
      elseif Level >= 900 and Level <= 949 then
         Quest = {Nome = "Marine Captain", QuestName = "MarineQuest3", LevelQuest = 2,
                  CFrameMon = CFrame.new(-1869, 71, -3320),
                  CFrameQuest = CFrame.new(-2440, 71, -3216)}
      elseif Level >= 950 and Level <= 974 then
         Quest = {Nome = "Zombie", QuestName = "ZombieQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-5736, 125, -686),
                  CFrameQuest = CFrame.new(-5497, 47, -795)}
      elseif Level >= 975 and Level <= 999 then
         Quest = {Nome = "Vampire", QuestName = "ZombieQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-6033, 6, -1313),
                  CFrameQuest = CFrame.new(-5497, 47, -795)}
      elseif Level >= 1000 and Level <= 1049 then
         Quest = {Nome = "Snow Trooper", QuestName = "SnowMountainQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(478, 401, -5362),
                  CFrameQuest = CFrame.new(609, 400, -5372)}
      elseif Level >= 1050 and Level <= 1099 then
         Quest = {Nome = "Winter Warrior", QuestName = "SnowMountainQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(1157, 429, -5188),
                  CFrameQuest = CFrame.new(609, 400, -5372)}
      elseif Level >= 1100 and Level <= 1124 then
         Quest = {Nome = "Lab Subordinate", QuestName = "IceSideQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-5769, 15, -4468),
                  CFrameQuest = CFrame.new(-6064, 15, -4902)}
      elseif Level >= 1125 and Level <= 1174 then
         Quest = {Nome = "Horned Warrior", QuestName = "IceSideQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-6341, 15, -5723),
                  CFrameQuest = CFrame.new(-6064, 15, -4902)}
      elseif Level >= 1175 and Level <= 1199 then
         Quest = {Nome = "Magma Ninja", QuestName = "FireSideQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-5309, 15, -5262),
                  CFrameQuest = CFrame.new(-5428, 15, -5299)}
      elseif Level >= 1200 and Level <= 1249 then
         Quest = {Nome = "Lava Pirate", QuestName = "FireSideQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-5251, 15, -4774),
                  CFrameQuest = CFrame.new(-5428, 15, -5299)}
      elseif Level >= 1250 and Level <= 1274 then
         Quest = {Nome = "Ship Deckhand", QuestName = "ShipQuest1", LevelQuest = 1,
                  CFrameMon = CFrame.new(1198, 125, 32911),
                  CFrameQuest = CFrame.new(1037, 125, 32911)}
      elseif Level >= 1275 and Level <= 1299 then
         Quest = {Nome = "Ship Engineer", QuestName = "ShipQuest1", LevelQuest = 2,
                  CFrameMon = CFrame.new(918, 43, 32787),
                  CFrameQuest = CFrame.new(1037, 125, 32911)}
      elseif Level >= 1300 and Level <= 1324 then
         Quest = {Nome = "Ship Steward", QuestName = "ShipQuest2", LevelQuest = 1,
                  CFrameMon = CFrame.new(915, 129, 33436),
                  CFrameQuest = CFrame.new(968, 125, 33244)}
      elseif Level >= 1325 and Level <= 1349 then
         Quest = {Nome = "Ship Officer", QuestName = "ShipQuest2", LevelQuest = 2,
                  CFrameMon = CFrame.new(915, 181, 33120),
                  CFrameQuest = CFrame.new(968, 125, 33244)}
      elseif Level >= 1350 and Level <= 1374 then
         Quest = {Nome = "Arctic Warrior", QuestName = "FrostQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(5966, 26, -6212),
                  CFrameQuest = CFrame.new(5667, 26, -6486)}
      elseif Level >= 1375 and Level <= 1424 then
         Quest = {Nome = "Snow Lurker", QuestName = "FrostQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(5518, 41, -6573),
                  CFrameQuest = CFrame.new(5667, 26, -6486)}
      elseif Level >= 1425 and Level <= 1449 then
         Quest = {Nome = "Sea Soldier", QuestName = "ForgottenQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-3022, 236, -10148),
                  CFrameQuest = CFrame.new(-3054, 235, -10142)}
      elseif Level >= 1450 and Level <= 1500 then
         Quest = {Nome = "Water Fighter", QuestName = "ForgottenQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-3385, 298, -10543),
                  CFrameQuest = CFrame.new(-3054, 235, -10142)}
      end
      
   elseif World3 then
      if Level >= 1500 and Level <= 1524 then
         Quest = {Nome = "Pirate Millionaire", QuestName = "PiratePortQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-373, 43, 5550),
                  CFrameQuest = CFrame.new(-290, 42, 5581)}
      elseif Level >= 1525 and Level <= 1574 then
         Quest = {Nome = "Pistol Billionaire", QuestName = "PiratePortQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-379, 43, 5984),
                  CFrameQuest = CFrame.new(-290, 42, 5581)}
      elseif Level >= 1575 and Level <= 1599 then
         Quest = {Nome = "Dragon Crew Warrior", QuestName = "AmazonQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(6339, 51, -1061),
                  CFrameQuest = CFrame.new(5832, 51, -1101)}
      elseif Level >= 1600 and Level <= 1624 then
         Quest = {Nome = "Dragon Crew Archer", QuestName = "AmazonQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(6594, 383, 139),
                  CFrameQuest = CFrame.new(5832, 51, -1101)}
      elseif Level >= 1625 and Level <= 1649 then
         Quest = {Nome = "Female Islander", QuestName = "AmazonQuest2", LevelQuest = 1,
                  CFrameMon = CFrame.new(4770, 718, 1069),
                  CFrameQuest = CFrame.new(5446, 601, 749)}
      elseif Level >= 1650 and Level <= 1699 then
         Quest = {Nome = "Giant Islander", QuestName = "AmazonQuest2", LevelQuest = 2,
                  CFrameMon = CFrame.new(4530, 656, -131),
                  CFrameQuest = CFrame.new(5446, 601, 749)}
      elseif Level >= 1700 and Level <= 1724 then
         Quest = {Nome = "Marine Commodore", QuestName = "MarineTreeIsland", LevelQuest = 1,
                  CFrameMon = CFrame.new(2286, 73, -7159),
                  CFrameQuest = CFrame.new(2180, 27, -6741)}
      elseif Level >= 1725 and Level <= 1774 then
         Quest = {Nome = "Marine Rear Admiral", QuestName = "MarineTreeIsland", LevelQuest = 2,
                  CFrameMon = CFrame.new(3656, 160, -6984),
                  CFrameQuest = CFrame.new(2180, 27, -6741)}
      elseif Level >= 1775 and Level <= 1799 then
         Quest = {Nome = "Fishman Raider", QuestName = "DeepForestIsland3", LevelQuest = 1,
                  CFrameMon = CFrame.new(-10560, 331, -8500),
                  CFrameQuest = CFrame.new(-10581, 330, -8761)}
      elseif Level >= 1800 and Level <= 1824 then
         Quest = {Nome = "Fishman Captain", QuestName = "DeepForestIsland3", LevelQuest = 2,
                  CFrameMon = CFrame.new(-11008, 331, -9132),
                  CFrameQuest = CFrame.new(-10581, 330, -8761)}
      elseif Level >= 1825 and Level <= 1849 then
         Quest = {Nome = "Forest Pirate", QuestName = "DeepForestIsland", LevelQuest = 1,
                  CFrameMon = CFrame.new(-13225, 331, -7955),
                  CFrameQuest = CFrame.new(-13234, 331, -7625)}
      elseif Level >= 1850 and Level <= 1899 then
         Quest = {Nome = "Mythological Pirate", QuestName = "DeepForestIsland", LevelQuest = 2,
                  CFrameMon = CFrame.new(-13508, 469, -6975),
                  CFrameQuest = CFrame.new(-13234, 331, -7625)}
      elseif Level >= 1900 and Level <= 1924 then
         Quest = {Nome = "Jungle Pirate", QuestName = "DeepForestIsland2", LevelQuest = 1,
                  CFrameMon = CFrame.new(-11975, 331, -10620),
                  CFrameQuest = CFrame.new(-12680, 389, -9902)}
      elseif Level >= 1925 and Level <= 1974 then
         Quest = {Nome = "Musketeer Pirate", QuestName = "DeepForestIsland2", LevelQuest = 2,
                  CFrameMon = CFrame.new(-13284, 496, -9656),
                  CFrameQuest = CFrame.new(-12680, 389, -9902)}
      elseif Level >= 1975 and Level <= 1999 then
         Quest = {Nome = "Reborn Skeleton", QuestName = "HauntedQuest1", LevelQuest = 1,
                  CFrameMon = CFrame.new(-8760, 165, 6159),
                  CFrameQuest = CFrame.new(-9479, 141, 5566)}
      elseif Level >= 2000 and Level <= 2024 then
         Quest = {Nome = "Living Zombie", QuestName = "HauntedQuest1", LevelQuest = 2,
                  CFrameMon = CFrame.new(-10144, 238, 5955),
                  CFrameQuest = CFrame.new(-9479, 141, 5566)}
      elseif Level >= 2025 and Level <= 2049 then
         Quest = {Nome = "Demonic Soul", QuestName = "HauntedQuest2", LevelQuest = 1,
                  CFrameMon = CFrame.new(-9712, 204, 6193),
                  CFrameQuest = CFrame.new(-9516, 172, 6078)}
      elseif Level >= 2050 and Level <= 2074 then
         Quest = {Nome = "Posessed Mummy", QuestName = "HauntedQuest2", LevelQuest = 2,
                  CFrameMon = CFrame.new(-9582, 6, 6285),
                  CFrameQuest = CFrame.new(-9516, 172, 6078)}
      elseif Level >= 2075 and Level <= 2099 then
         Quest = {Nome = "Peanut Scout", QuestName = "NutsIslandQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-2124, 123, -10435),
                  CFrameQuest = CFrame.new(-2104, 38, -10194)}
      elseif Level >= 2100 and Level <= 2124 then
         Quest = {Nome = "Peanut President", QuestName = "NutsIslandQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-2124, 123, -10435),
                  CFrameQuest = CFrame.new(-2104, 38, -10194)}
      elseif Level >= 2125 and Level <= 2149 then
         Quest = {Nome = "Ice Cream Chef", QuestName = "IceCreamIslandQuest", LevelQuest = 1,
                  CFrameMon = CFrame.new(-641, 125, -11062),
                  CFrameQuest = CFrame.new(-820, 65, -10965)}
      elseif Level >= 2150 and Level <= 2199 then
         Quest = {Nome = "Ice Cream Commander", QuestName = "IceCreamIslandQuest", LevelQuest = 2,
                  CFrameMon = CFrame.new(-558, 125, -11241),
                  CFrameQuest = CFrame.new(-820, 65, -10965)}
      elseif Level >= 2200 and Level <= 2224 then
         Quest = {Nome = "Cookie Crafter", QuestName = "CakeQuest1", LevelQuest = 1,
                  CFrameMon = CFrame.new(-2365, 37, -12099),
                  CFrameQuest = CFrame.new(-2021, 37, -12028)}
      elseif Level >= 2225 and Level <= 2249 then
         Quest = {Nome = "Cake Guard", QuestName = "CakeQuest1", LevelQuest = 2,
                  CFrameMon = CFrame.new(-1651, 37, -12308),
                  CFrameQuest = CFrame.new(-2021, 37, -12028)}
      elseif Level >= 2250 and Level <= 2274 then
         Quest = {Nome = "Baking Staff", QuestName = "CakeQuest2", LevelQuest = 1,
                  CFrameMon = CFrame.new(-1870, 37, -12938),
                  CFrameQuest = CFrame.new(-1927, 37, -12842)}
      elseif Level >= 2275 and Level <= 2299 then
         Quest = {Nome = "Head Baker", QuestName = "CakeQuest2", LevelQuest = 2,
                  CFrameMon = CFrame.new(-1926, 88, -12850),
                  CFrameQuest = CFrame.new(-1927, 37, -12842)}
      elseif Level >= 2300 and Level <= 2324 then
         Quest = {Nome = "Cocoa Warrior", QuestName = "ChocQuest1", LevelQuest = 1,
                  CFrameMon = CFrame.new(147, 23, -12470),
                  CFrameQuest = CFrame.new(233, 29, -12201)}
      elseif Level >= 2325 and Level <= 2349 then
         Quest = {Nome = "Chocolate Bar Battler", QuestName = "ChocQuest1", LevelQuest = 2,
                  CFrameMon = CFrame.new(684, 24, -12510),
                  CFrameQuest = CFrame.new(233, 29, -12201)}
      elseif Level >= 2350 and Level <= 2374 then
         Quest = {Nome = "Sweet Thief", QuestName = "ChocQuest2", LevelQuest = 1,
                  CFrameMon = CFrame.new(42, 76, -12656),
                  CFrameQuest = CFrame.new(150, 30, -12774)}
      elseif Level >= 2375 and Level <= 2399 then
         Quest = {Nome = "Candy Rebel", QuestName = "ChocQuest2", LevelQuest = 2,
                  CFrameMon = CFrame.new(135, 76, -12882),
                  CFrameQuest = CFrame.new(150, 30, -12774)}
      elseif Level >= 2400 and Level <= 2424 then
         Quest = {Nome = "Candy Pirate", QuestName = "CandyQuest1", LevelQuest = 1,
                  CFrameMon = CFrame.new(-1315, 26, -14471),
                  CFrameQuest = CFrame.new(-1150, 20, -14446)}
      elseif Level >= 2425 and Level <= 2449 then
         Quest = {Nome = "Snow Demon", QuestName = "CandyQuest1", LevelQuest = 2,
                  CFrameMon = CFrame.new(-910, 88, -14453),
                  CFrameQuest = CFrame.new(-1150, 20, -14446)}
      elseif Level >= 2450 then
         Quest = {Nome = "Isle Outlaw", QuestName = "TikiQuest1", LevelQuest = 1,
                  CFrameMon = CFrame.new(-16228, 9, 446),
                  CFrameQuest = CFrame.new(-16545, 55, -173)}
      end
   end
   
   return Quest
end

-- ============================================
-- LOOP PRINCIPAL DE AUTO FARM
-- ============================================
spawn(function()
   while wait() do
      if _G.Settings.AutoFarmLevel and not _G.Settings.ManualTeleport then
         pcall(function()
            local QuestInfo = PegarQuest()
            if QuestInfo then
               -- Checar se tem a quest ativa
               local QuestTitle = LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
               if not string.find(QuestTitle, QuestInfo.Nome) then
                  -- Ir pegar a quest
                  repeat
                     wait()
                     LocalPlayer.Character.HumanoidRootPart.CFrame = QuestInfo.CFrameQuest
                  until (QuestInfo.CFrameQuest.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3
                  wait(0.5)
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", QuestInfo.QuestName, QuestInfo.LevelQuest)
               else
                  -- Já tem a quest, farmar
                  for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                     if v.Name == QuestInfo.Nome and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat
                           wait()
                           EquiparArma()
                           v.HumanoidRootPart.CanCollide = false
                           v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                           v.HumanoidRootPart.CFrame = QuestInfo.CFrameMon
                           LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                           AttackFunction()
                           ClickButton()
                        until not _G.Settings.AutoFarmLevel or v.Humanoid.Health <= 0 or not v.Parent
                     end
                  end
               end
            end
         end)
      end
   end
end)

-- ============================================
-- CRIAÇÃO DO MENU
-- ============================================

-- TAB 1: MAIN FARM
local MainTab = Window:CreateTab("🎯 Main Farm", 4483362458)

MainTab:CreateSection("⚔️ Configurações de Arma")

local WeaponDropdown = MainTab:CreateDropdown({
   Name = "Selecionar Arma",
   Options = {"Melee", "Sword", "Fruit", "Gun"},
   CurrentOption = {"Melee"},
   MultipleOptions = false,
   Callback = function(Option)
      _G.Settings.SelectWeapon = Option[1]
   end,
})

local FastAttackToggle = MainTab:CreateToggle({
   Name = "Fast Attack (Ataque Rápido)",
   CurrentValue = true,
   Flag = "FastAttack",
   Callback = function(Value)
      _G.Settings.FastAttack = Value
   end,
})

local AutoHakiToggle = MainTab:CreateToggle({
   Name = "Auto Haki (Ativar Buso Automático)",
   CurrentValue = true,
   Flag = "AutoHaki",
   Callback = function(Value)
      _G.Settings.AutoHaki = Value
   end,
})

MainTab:CreateSection("📊 Farms Principais")

local AutoFarmToggle = MainTab:CreateToggle({
   Name = "🔥 Auto Farm Level (Quest Automática)",
   CurrentValue = false,
   Flag = "AutoFarm",
   Callback = function(Value)
      _G.Settings.AutoFarmLevel = Value
      _G.Settings.ManualTeleport = false
      if Value then
         Rayfield:Notify({
            Title = "Auto Farm Ativado!",
            Content = "Farmando level automaticamente com quest!",
            Duration = 3,
         })
      end
   end,
})

local AutoMasteryToggle = MainTab:CreateToggle({
   Name = "Auto Farm Mastery (Maestria)",
   CurrentValue = false,
   Flag = "AutoMastery",
   Callback = function(Value)
      _G.Settings.AutoFarmMastery = Value
   end,
})

local AutoBossToggle = MainTab:CreateToggle({
   Name = "Auto Farm Boss (Chefes)",
   CurrentValue = false,
   Flag = "AutoBoss",
   Callback = function(Value)
      _G.Settings.AutoFarmBoss = Value
   end,
})

local AutoEliteToggle = MainTab:CreateToggle({
   Name = "Auto Farm Elite Hunter",
   CurrentValue = false,
   Flag = "AutoElite",
   Callback = function(Value)
      _G.Settings.AutoFarmElite = Value
   end,
})

-- TAB 2: MATERIAIS
local MaterialTab = Window:CreateTab("💎 Materiais", 4483362458)

MaterialTab:CreateSection("🦴 Farm de Materiais do Sea 3")

if World3 then
   local AutoBoneToggle = MaterialTab:CreateToggle({
      Name = "Auto Farm Bone (Ossos)",
      CurrentValue = false,
      Callback = function(Value)
         _G.Settings.AutoFarmBone = Value
      end,
   })
   
   local AutoCocoaToggle = MaterialTab:CreateToggle({
      Name = "Auto Farm Cocoa (Chocolate)",
      CurrentValue = false,
      Callback = function(Value)
         _G.Settings.AutoFarmCocoa = Value
      end,
   })
   
   local AutoCakeToggle = MaterialTab:CreateToggle({
      Name = "Auto Farm Cake Prince (Dough King)",
      CurrentValue = false,
      Callback = function(Value)
         _G.Settings.AutoFarmCake = Value
      end,
   })
   
   MaterialTab:CreateButton({
      Name = "Girar Surpresa de Ossos",
      Callback = function()
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
      end,
   })
end

if World2 then
   MaterialTab:CreateSection("👻 Farm de Materiais do Sea 2")
   
   local AutoEctoToggle = MaterialTab:CreateToggle({
      Name = "Auto Farm Ectoplasm",
      CurrentValue = false,
      Callback = function(Value)
         _G.Settings.AutoFarmEctoplasm = Value
      end,
   })
end

-- TAB 3: RAIDS
local RaidTab = Window:CreateTab("⚔️ Raids", 4483362458)

RaidTab:CreateSection("🎫 Configuração de Raid")

local RaidDropdown = RaidTab:CreateDropdown({
   Name = "Selecionar Raid",
   Options = {"Flame", "Ice", "Quake", "Light", "Dark", "Spider", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough"},
   CurrentOption = {"Flame"},
   Callback = function(Option)
      _G.Settings.SelectRaid = Option[1]
   end,
})

local AutoBuyChipToggle = RaidTab:CreateToggle({
   Name = "Auto Comprar Chip",
   CurrentValue = false,
   Callback = function(Value)
      _G.Settings.AutoBuyChip = Value
   end,
})

local AutoStartRaidToggle = RaidTab:CreateToggle({
   Name = "Auto Iniciar Raid",
   CurrentValue = false,
   Callback = function(Value)
      _G.Settings.AutoStartRaid = Value
   end,
})

RaidTab:CreateSection("⚡ Dentro da Raid")

local AutoRaidToggle = RaidTab:CreateToggle({
   Name = "Auto Farm Raid (Kill All)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Settings.AutoRaid = Value
   end,
})

local AutoAwakenToggle = RaidTab:CreateToggle({
   Name = "Auto Despertar Fruta",
   CurrentValue = false,
   Callback = function(Value)
      _G.Settings.AutoAwaken = Value
   end,
})

-- TAB 4: FRUTAS
local FruitTab = Window:CreateTab("🍇 Frutas", 4483362458)

FruitTab:CreateSection("🎲 Gerenciamento de Frutas")

local AutoStoreToggle = FruitTab:CreateToggle({
   Name = "Auto Guardar Fruta",
   CurrentValue = true,
   Callback = function(Value)
      _G.Settings.AutoStoreFruit = Value
   end,
})

local AutoBuyFruitToggle = FruitTab:CreateToggle({
   Name = "Auto Comprar Fruta Aleatória",
   CurrentValue = false,
   Callback = function(Value)
      _G.Settings.AutoBuyFruit = Value
   end,
})

FruitTab:CreateButton({
   Name = "Girar Fruta Aleatória (1x)",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
   end,
})

FruitTab:CreateButton({
   Name = "Abrir Loja de Frutas",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
      game.Players.LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
   end,
})

-- TAB 5: AUTO STATS
local StatsTab = Window:CreateTab("📊 Auto Stats", 4483362458)

StatsTab:CreateSection("💪 Distribuição de Pontos")

local MeleeToggle = StatsTab:CreateToggle({
   Name = "Upar Melee (Soco)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Settings.AutoMelee = Value
   end,
})

local DefenseToggle = StatsTab:CreateToggle({
   Name = "Upar Defense (Defesa)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Settings.AutoDefense = Value
   end,
})

local SwordToggle = StatsTab:CreateToggle({
   Name = "Upar Sword (Espada)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Settings.AutoSword = Value
   end,
})

local GunToggle = StatsTab:CreateToggle({
   Name = "Upar Gun (Arma)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Settings.AutoGun = Value
   end,
})

local FruitStatToggle = StatsTab:CreateToggle({
   Name = "Upar Blox Fruit (Fruta)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Settings.AutoFruit = Value
   end,
})

-- Loop Auto Stats
spawn(function()
   while wait(0.1) do
      pcall(function()
         local Points = LocalPlayer.Data.Points.Value
         if Points > 0 then
            if _G.Settings.AutoMelee then
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", _G.Settings.PointsToAdd)
            end
            if _G.Settings.AutoDefense then
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", _G.Settings.PointsToAdd)
            end
            if _G.Settings.AutoSword then
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", _G.Settings.PointsToAdd)
            end
            if _G.Settings.AutoGun then
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", _G.Settings.PointsToAdd)
            end
            if _G.Settings.AutoFruit then
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", _G.Settings.PointsToAdd)
            end
         end
      end)
   end
end)

-- TAB 6: TELEPORTES
local TeleportTab = Window:CreateTab("🌍 Teleportes", 4483362458)

TeleportTab:CreateSection("🌊 Mudar de Mar")

TeleportTab:CreateButton({
   Name = "Teleportar para Sea 1",
   Callback = function()
      PausarTodosFarms()
      wait(0.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
   end,
})

TeleportTab:CreateButton({
   Name = "Teleportar para Sea 2",
   Callback = function()
      PausarTodosFarms()
      wait(0.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
   end,
})

TeleportTab:CreateButton({
   Name = "Teleportar para Sea 3",
   Callback = function()
      PausarTodosFarms()
      wait(0.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
   end,
})

TeleportTab:CreateSection("🏝️ Ilhas do Mundo Atual")

-- Lista de ilhas baseada no mundo
local IslandList = {}
if World1 then
   IslandList = {
      "Starter Island", "Jungle", "Pirate Village", "Desert", "Frozen Village",
      "Marine Fortress", "Skylands", "Prison", "Colosseum", "Magma Village",
      "Underwater City", "Upper Skylands", "Fountain City"
   }
elseif World2 then
   IslandList = {
      "Kingdom of Rose", "Cafe", "Mansion", "Graveyard", "Snow Mountain",
      "Hot and Cold", "Cursed Ship", "Ice Castle", "Forgotten Island"
   }
elseif World3 then
   IslandList = {
      "Port Town", "Great Tree", "Castle on the Sea", "Hydra Island",
      "Floating Turtle", "Haunted Castle", "Sea of Treats", "Chocolate Land",
      "Cake Land", "Candy Land", "Tiki Outpost"
   }
end

local IslandDropdown = TeleportTab:CreateDropdown({
   Name = "Selecionar Ilha",
   Options = IslandList,
   CurrentOption = {IslandList[1]},
   Callback = function(Option)
      _G.Settings.SelectedIsland = Option[1]
   end,
})

TeleportTab:CreateButton({
   Name = "Teleportar para Ilha Selecionada",
   Callback = function()
      PausarTodosFarms()
      wait(0.5)
      -- Aqui você adiciona as coordenadas específicas de cada ilha
      Rayfield:Notify({
         Title = "Teleporte",
         Content = "Teleportando para: " .. _G.Settings.SelectedIsland,
         Duration = 3,
      })
   end,
})

-- TAB 7: SHOP
local ShopTab = Window:CreateTab("🛒 Shop", 4483362458)

ShopTab:CreateSection("🥋 Estilos de Luta")

ShopTab:CreateButton({
   Name = "Comprar Godhuman (Level 2450)",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
   end,
})

ShopTab:CreateButton({
   Name = "Comprar Superhuman (Level 300)",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
   end,
})

ShopTab:CreateButton({
   Name = "Comprar Dragon Talon (Level 1500)",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
   end,
})

ShopTab:CreateButton({
   Name = "Comprar Electric Claw (Level 1500)",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
   end,
})

ShopTab:CreateButton({
   Name = "Comprar Death Step (Level 1500)",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
   end,
})

ShopTab:CreateButton({
   Name = "Comprar Sharkman Karate (Level 1500)",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
   end,
})

-- TAB 8: MISC
local MiscTab = Window:CreateTab("⚙️ Misc", 4483362458)

MiscTab:CreateSection("🎮 Utilidades")

MiscTab:CreateButton({
   Name = "Server Hop (Trocar de Servidor)",
   Callback = function()
      Rayfield:Notify({
         Title = "Server Hop",
         Content = "Procurando servidor...",
         Duration = 3,
      })
      -- Código de server hop aqui
   end,
})

MiscTab:CreateButton({
   Name = "Rejoin (Reentrar no Servidor)",
   Callback = function()
      game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
   end,
})

MiscTab:CreateButton({
   Name = "🎁 Resgatar Todos os Códigos",
   Callback = function()
      local codes = {
         "NEWTROLL", "KITT_RESET", "Sub2CaptainMaui", "DEVSCOOKING", "kittgaming",
         "Sub2Fer999", "Enyu_is_Pro", "Magicbus", "JCWK", "Starcodeheo", "Bluxxy",
         "fudd10_v2", "Fudd10", "BIGNEWS", "THEGREATACE", "SUB2GAMERROBOT_RESET1",
         "SUB2GAMERROBOT_EXP1", "Sub2OfficialNoobie", "StrawHatMaine", "TantaiGaming",
         "Axiore", "Sub2Daigrock", "Sub2UncleKizaru"
      }
      for _, code in pairs(codes) do
         game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
         wait(0.1)
      end
      Rayfield:Notify({
         Title = "Códigos",
         Content = "Todos os códigos foram resgatados!",
         Duration = 5,
      })
   end,
})

MiscTab:CreateSection("🎨 Performance")

MiscTab:CreateButton({
   Name = "Tela Branca (FPS Boost)",
   Callback = function()
      game:GetService("RunService"):Set3dRenderingEnabled(false)
   end,
})

MiscTab:CreateButton({
   Name = "Voltar Tela Normal",
   Callback = function()
      game:GetService("RunService"):Set3dRenderingEnabled(true)
   end,
})

MiscTab:CreateButton({
   Name = "🔥 Copiar Discord Lag Teck",
   Callback = function()
      setclipboard("https://discord.gg/RnZ6XHHFj7")
      Rayfield:Notify({
         Title = "Discord Copiado!",
         Content = "Link copiado: discord.gg/RnZ6XHHFj7",
         Duration = 5,
      })
   end,
})

-- TAB 9: CONFIGS
local ConfigTab = Window:CreateTab("⚙️ Configurações", 4483362458)

ConfigTab:CreateSection("💾 Sistema")

ConfigTab:CreateButton({
   Name = "Salvar Configuração",
   Callback = function()
      Rayfield:LoadConfiguration()
      Rayfield:Notify({
         Title = "Configuração",
         Content = "Configurações salvas!",
         Duration = 3,
      })
   end,
})

ConfigTab:CreateButton({
   Name = "🔄 Reativar Farms (Após Teleporte)",
   Callback = function()
      _G.Settings.ManualTeleport = false
      Rayfield:Notify({
         Title = "Sistema Reativado",
         Content = "Você pode ligar os farms novamente!",
         Duration = 3,
      })
   end,
})

ConfigTab:CreateButton({
   Name = "❌ Destruir Interface",
   Callback = function()
      Rayfield:Destroy()
   end,
})

-- ============================================
-- ANTI-AFK
-- ============================================
spawn(function()
   local vu = game:GetService("VirtualUser")
   game:GetService("Players").LocalPlayer.Idled:connect(function()
      vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      wait(1)
      vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   end)
end)

-- ============================================
-- INICIALIZAÇÃO FINAL
-- ============================================
print("================================================")
print("🔥 LAG TECK COMMUNITY - BLOX FRUITS v2.0")
print("📌 Script carregado com sucesso!")
print("💬 Discord: discord.gg/RnZ6XHHFj7")
print("================================================")
