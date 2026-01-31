-- [[ LAG TECK - BLOX FRUITS OFFICIAL ]] --
-- Versão Otimizada para Delta iOS

if not game:IsLoaded() then game.Loaded:Wait() end

-- Impedir que o script rode duas vezes e cause lag
if _G.LagTeckExecutado then return end
_G.LagTeckExecutado = true

-- IDs dos mundos para o farm automático
local World1, World2, World3 = false, false, false
if game.PlaceId == 2753915549 then World1 = true
elseif game.PlaceId == 4442272183 then World2 = true
elseif game.PlaceId == 7449423635 then World3 = true
end

-- Proteção contra expulsão (Anti-Kick)
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "Kick" then return wait(9e9) end
    return old(self, ...)
end)
setreadonly(mt, true)

-- Carregando a Interface Visual (Link mais estável para iOS)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/juyas1/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Lag Teck Community | Blox Fruits", HidePremium = false, SaveConfig = true, IntroText = "LagTeck V1"})

-- Variáveis de Controle
_G.AutoFarm = false
_G.SelectWeapon = "Melee"

-- Aba Principal
local M = Window:MakeTab({Name = "Main Farm", Icon = "rbxassetid://4483345998"})

M:AddDropdown({
    Name = "Selecionar Arma",
    Default = "Melee",
    Options = {"Melee", "Sword", "Fruit"},
    Callback = function(Value)
        _G.SelectWeapon = Value
    end    
})

M:AddToggle({
    Name = "Auto Farm Level (Início)",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
    end    
})

-- Função de Equipar Arma Automático
function EquiparArma()
    pcall(function()
        if _G.SelectWeapon == "Melee" then
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ToolTip == "Melee" then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                end
            end
        elseif _G.SelectWeapon == "Sword" then
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ToolTip == "Sword" then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                end
            end
        end
    end)
end

-- Loop do Farm (Simplificado para não travar)
spawn(function()
    while wait() do
        if _G.AutoFarm then
            pcall(function()
                EquiparArma()
                -- Aqui o script buscaria o mob mais próximo e atacaria
                -- Para o Delta iOS não fechar, o ataque é controlado
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
            end)
        end
    end
end)

OrionLib:Init()
