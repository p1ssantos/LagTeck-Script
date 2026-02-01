--[[
═══════════════════════════════════════════════════════════════
                 LAG TECK FUSION V3.0 - COMPLETO
          Script Fundido Premium para Blox Fruits
          
Discord: discord.gg/RnZ6XHHFj7
Criado por: Lag Teck Team  
Versão: 3.0 Final (Fundido com Rayfield)
═══════════════════════════════════════════════════════════════
--]]

print("🌊 Iniciando Lag Teck Fusion V3.0...")
wait(1)

-- VERIFICAÇÃO DE JOGO
if game.PlaceId == 2753915549 then World1 = true
elseif game.PlaceId == 4442272183 then World2 = true  
elseif game.PlaceId == 7449423635 then World3 = true
else game.Players.LocalPlayer:Kick("⚠️ Este script é apenas para Blox Fruits!") end

-- CARREGAR LIBRARY RAYFIELD
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- CRIAR JANELA
local Window = Rayfield:CreateWindow({
   Name = "🌊 Lag Teck Fusion V3.0 - Premium Edition",
   LoadingTitle = "Carregando Lag Teck Fusion",
   LoadingSubtitle = "by Lag Teck Team",
   ConfigurationSaving = {Enabled = true, FolderName = "LagTeckFusion", FileName = "Config"},
   Discord = {Enabled = true, Invite = "RnZ6XHHFj7", RememberJoins = true},
   KeySystem = false
})

Rayfield:Notify({Title = "✅ Bem-vindo!", Content = "Lag Teck Fusion V3.0 carregado!", Duration = 5, Image = 4483362458})

-- VARIÁVEIS GLOBAIS
_G.SelectWeapon = "Combat"
_G.AutoFarm = false
_G.BringMonster = true
_G.BringMode = 350
_G.FastAttack = true

-- FUNÇÕES ESSENCIAIS
function CheckQuest()
    MyLevel = game.Players.LocalPlayer.Data.Level.Value
    if World1 then
        if MyLevel <= 9 then Mon,LevelQuest,NameQuest = "Bandit",1,"BanditQuest1"
            CFrameQuest = CFrame.new(1059.37,15.45,1550.42)
            CFrameMon = CFrame.new(1045.96,27,1560.82)
        elseif MyLevel <= 14 then Mon,LevelQuest,NameQuest = "Monkey",1,"JungleQuest"
            CFrameQuest = CFrame.new(-1598.09,35.55,153.38)
            CFrameMon = CFrame.new(-1448.52,67.85,11.47)
        elseif MyLevel <= 29 then Mon,LevelQuest,NameQuest = "Gorilla",2,"JungleQuest"
            CFrameQuest = CFrame.new(-1598.09,35.55,153.38)
            CFrameMon = CFrame.new(-1129.88,40.46,-525.42)
        elseif MyLevel <= 39 then Mon,LevelQuest,NameQuest = "Pirate",1,"BuggyQuest1"
            CFrameQuest = CFrame.new(-1141.07,4.1,3831.55)
            CFrameMon = CFrame.new(-1103.51,13.75,3896.09)
        elseif MyLevel <= 59 then Mon,LevelQuest,NameQuest = "Brute",2,"BuggyQuest1"
            CFrameQuest = CFrame.new(-1141.07,4.1,3831.55)
            CFrameMon = CFrame.new(-1140.08,14.81,4322.92)
        else Mon,LevelQuest,NameQuest = "Desert Bandit",1,"DesertQuest"
            CFrameQuest = CFrame.new(894.49,5.14,4392.43)
            CFrameMon = CFrame.new(924.8,6.45,4481.59)
        end
    elseif World2 then
        if MyLevel <= 724 then Mon,LevelQuest,NameQuest = "Raider",1,"Area1Quest"
            CFrameQuest = CFrame.new(-429.54,71.77,1836.18)
            CFrameMon = CFrame.new(-728.33,52.78,2345.77)
        else Mon,LevelQuest,NameQuest = "Mercenary",2,"Area1Quest"
            CFrameQuest = CFrame.new(-429.54,71.77,1836.18)
            CFrameMon = CFrame.new(-1004.32,80.16,1424.62)
        end
    elseif World3 then
        if MyLevel <= 1524 then Mon,LevelQuest,NameQuest = "Pirate Millionaire",1,"PiratePortQuest"
            CFrameQuest = CFrame.new(-290.07,42.9,5581.59)
            CFrameMon = CFrame.new(-245.99,47.31,5584.1)
        else Mon,LevelQuest,NameQuest = "Pistol Billionaire",2,"PiratePortQuest"
            CFrameQuest = CFrame.new(-290.07,42.9,5581.59)
            CFrameMon = CFrame.new(-187.33,86.24,6013.51)
        end
    end
end

function AutoHaki()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
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

function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 250 then Speed = 5000
    elseif Distance < 500 then Speed = 350
    elseif Distance < 1000 then Speed = 250
    else Speed = 200 end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
end

-- TAB HOME
local HomeTab = Window:CreateTab("🏠 Home", 4483362458)
HomeTab:CreateSection("📊 Status do Jogador")

local LevelLabel = HomeTab:CreateLabel("Level: ...")
local RaceLabel = HomeTab:CreateLabel("Race: ...")  
local BeliLabel = HomeTab:CreateLabel("Beli: ...")
local FragmentLabel = HomeTab:CreateLabel("Fragments: ...")

spawn(function()
    while wait(1) do
        pcall(function()
            LevelLabel:Set("⭐ Level: "..game.Players.LocalPlayer.Data.Level.Value)
            RaceLabel:Set("🧬 Race: "..game.Players.LocalPlayer.Data.Race.Value)
            BeliLabel:Set("💰 Beli: "..game.Players.LocalPlayer.Data.Beli.Value)
            FragmentLabel:Set("💎 Fragments: "..game.Players.LocalPlayer.Data.Fragments.Value)
        end)
    end
end)

-- TAB FARM
local FarmTab = Window:CreateTab("⚔️ Farm", 4483362458)
FarmTab:CreateSection("🎯 Auto Farm Principal")

FarmTab:CreateToggle({Name = "🔥 Auto Farm Level", CurrentValue = false, Flag = "AutoFarm",
   Callback = function(v) _G.AutoFarm = v end})

FarmTab:CreateToggle({Name = "🧲 Bring Mobs", CurrentValue = true, Flag = "BringMobs",
   Callback = function(v) _G.BringMonster = v end})

-- LOOP AUTO FARM
spawn(function()
    while wait() do
        if _G.AutoFarm then
            pcall(function()
                CheckQuest()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    topos(CFrameQuest)
                    if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == Mon and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                    v.HumanoidRootPart.CanCollide = false
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        topos(CFrameMon)
                    end
                end
            end)
        end
    end
end)

-- TAB STATS
local StatsTab = Window:CreateTab("📊 Stats", 4483362458)
StatsTab:CreateSection("⚡ Auto Stats")

StatsTab:CreateToggle({Name = "Melee", CurrentValue = false, Callback = function(v) _G.Melee = v end})
StatsTab:CreateToggle({Name = "Defense", CurrentValue = false, Callback = function(v) _G.Defense = v end})
StatsTab:CreateToggle({Name = "Sword", CurrentValue = false, Callback = function(v) _G.Sword = v end})
StatsTab:CreateToggle({Name = "Gun", CurrentValue = false, Callback = function(v) _G.Gun = v end})
StatsTab:CreateToggle({Name = "Devil Fruit", CurrentValue = false, Callback = function(v) _G.DevilFruit = v end})

spawn(function()
    while wait() do
        if _G.Melee then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",1) end
        if _G.Defense then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",1) end  
        if _G.Sword then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",1) end
        if _G.Gun then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",1) end
        if _G.DevilFruit then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit",1) end
    end
end)

-- TAB BOSSES
local BossTab = Window:CreateTab("👑 Bosses", 4483362458)
BossTab:CreateSection("Auto Farm Bosses")

BossTab:CreateToggle({Name = "Auto Dough King", CurrentValue = false,
   Callback = function(v) _G.AutoDoughKing = v end})

spawn(function()
    while wait() do
        if _G.AutoDoughKing and World3 then
            pcall(function()
                if game.Workspace.Enemies:FindFirstChild("Dough King") then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Dough King" and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not _G.AutoDoughKing or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    topos(CFrame.new(-2662.82,1062.35,-11853.7))
                end
            end)
        end
    end
end)

-- TAB SHOP
local ShopTab = Window:CreateTab("🛒 Shop", 4483362458)
ShopTab:CreateSection("Comprar Items")

ShopTab:CreateButton({Name = "Buy Geppo", Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
end})

ShopTab:CreateButton({Name = "Buy Buso Haki", Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
end})

ShopTab:CreateButton({Name = "Buy Soru", Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
end})

-- TAB TELEPORT
local TeleportTab = Window:CreateTab("🌍 Teleport", 4483362458)
TeleportTab:CreateSection("Teleport Rápido")

if World1 then
    TeleportTab:CreateButton({Name = "Middle Town", Callback = function()
        topos(CFrame.new(-690.33,15.09,1582.24))
    end})
    TeleportTab:CreateButton({Name = "Jungle", Callback = function()
        topos(CFrame.new(-1612.8,36.85,149.13))
    end})
    TeleportTab:CreateButton({Name = "Pirate Village", Callback = function()
        topos(CFrame.new(-1181.31,4.75,3803.55))
    end})
end

-- TAB MISC
local MiscTab = Window:CreateTab("⚙️ Misc", 4483362458)
MiscTab:CreateSection("Configurações")

MiscTab:CreateToggle({Name = "Auto Haki", CurrentValue = true,
   Callback = function(v) _G.AutoHaki = v end})

spawn(function()
    while wait(.1) do
        if _G.AutoHaki then AutoHaki() end
    end
end)

MiscTab:CreateButton({Name = "Redeem All Codes", Callback = function()
    local codes = {"JULYUPDATE_RESET","Sub2CaptainMaui","SUB2GAMERROBOT_RESET1","KittGaming","Sub2Fer999","Enyu_is_Pro","Magicbus","BIGNEWS","THEGREATACE","SUB2GAMERROBOT_EXP1"}
    for i,v in pairs(codes) do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Redeem",v)
    end
    Rayfield:Notify({Title = "✅ Códigos", Content = "Todos os códigos foram resgatados!", Duration = 3})
end})

print("✅ Lag Teck Fusion V3.0 carregado com sucesso!")
