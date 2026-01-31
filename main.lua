-- [[ LAG TECK COMMUNITY - BLOX FRUITS ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- Carregando a Rayfield (Mais estável que a Orion para iOS)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Lag Teck | Blox Fruits",
   LoadingTitle = "Carregando Lag Teck...",
   LoadingSubtitle = "by p1ssantos",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LagTeckData"
   }
})

-- Variáveis de controle
_G.AutoFarm = false
_G.SelectWeapon = "Melee"

-- Aba Principal
local MainTab = Window:CreateTab("Farm", 4483345998)

MainTab:CreateDropdown({
   Name = "Selecionar Arma",
   Options = {"Melee","Sword","Fruit"},
   CurrentOption = {"Melee"},
   MultipleOptions = false,
   Callback = function(Option)
      _G.SelectWeapon = Option[1]
   end,
})

MainTab:CreateToggle({
   Name = "Auto Farm Level",
   CurrentValue = false,
   Flag = "ToggleFarm", 
   Callback = function(Value)
      _G.AutoFarm = Value
   end,
})

-- Funções de Proteção e Ataque
local function Atacar()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end

-- Loop de Ataque
spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                -- Aqui o script executa o clique
                Atacar()
            end)
        end
    end
end)

Rayfield:Notify({
   Title = "Lag Teck Ativo!",
   Content = "O script carregou com sucesso no seu Delta iOS.",
   Duration = 5,
   Image = 4483345998,
})
