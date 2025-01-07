  if getgenv().ocalism then warn("Ocalism: Already Executed!") return end
  getgenv().ocalism = true

  if not game:IsLoaded() then
    game.Loaded:wait()
  end

-- variables
  local gui = game:GetService("GuiService")
  local http = game:GetService("HttpService")
  local ip = game:GetService("UserInputService")
  local lp = game.Players.LocalPlayer
  local Light = game:GetService("Lighting")
  local mk = game:GetService("MarketplaceService")
  local pl = game:GetService("Players")
  local rs = game:GetService("RunService")
  local re = game:GetService("ReplicatedStorage")
  local sg = game:GetService("StarterGui")
  local vim = game:GetService("VirtualInputManager")
  local vr = game:GetService('VirtualUser')

-- verificadores
  local human = lp.Character:FindFirstChild("Humanoid")
  local root = lp.Character:FindFirstChild("HumanoidRootPart")

-- functions
  local function GetCharacter(Player)
	if Player.Character then
		return Player.Character
	  end
  end

  local function GetRoot(Player)
	if GetCharacter(Player):FindFirstChild("HumanoidRootPart") then
		return GetCharacter(Player).HumanoidRootPart
	  end
  end


  getgenv().config = {
  anti_error = nil,
  touch_fling = nil,
  list = nil,
  view = nil,
  fling = nil,
  focus = nil,
  bang = nil,
  backpack = nil,
  headsit = nil,
  dog = nil,
  drag = nil,
  players = nil,
  pc = nil,
  pod = nil,
  saida = nil,
  vent = nil,
  speed = nil,
  jump = nil,
  anti_fling = nil,
  anti_chatspy = nil,
  void = nil,
  anti_afk = nil,
  }

  if not isfolder("Ocalism") then
  makefolder("Ocalism")
  end

  if not isfolder("Ocalism") then
  makefolder("Ocalism")
  end

  local function save()
  local save_name = "Ocalism/data.json"
  local data = http:JSONEncode(getgenv().config)
    writefile(save_name, data)
  end

  local function load_config()
  local save_name = "Ocalism/data.json"
    if isfile(save_name) then
        local data = readfile(save_name)
        getgenv().config = http:JSONDecode(data)
    end
  end


  local CheckMobile = function()
    if ip.TouchEnabled then
        return true
    end
  end

  IsMobile = CheckMobile()

  local largura, altura

  if not IsMobile then
    largura, altura = 600, 460
  else
    local ScreenGui1 = Instance.new("ScreenGui")
    local ImageButton1 = Instance.new("ImageButton")
    local UICorner = Instance.new("UICorner")

    ScreenGui1.Name = "ImageButton"
    ScreenGui1.Parent = game.CoreGui
    ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    ImageButton1.Parent = ScreenGui1
    ImageButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ImageButton1.BorderSizePixel = 0
    ImageButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    ImageButton1.Size = UDim2.new(0, 50, 0, 50)
    ImageButton1.Draggable = true
    ImageButton1.Image = "rbxassetid://18540832673"
    ImageButton1.MouseButton1Down:connect(
        function()
            vim:SendKeyEvent(true, "Insert", false, game)
            vim:SendKeyEvent(false, "Insert", false, game)
        end
    )
    UICorner.Parent = ImageButton1
  end

  load_config()

  local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/DevBeto-Cyber/Workspace/refs/heads/main/Library.txt", true))()

  local Window = Fluent:CreateWindow(
    {
    Title = "Ocalism - By Beto",
    SubTitle = mk:GetProductInfo(16732694052).Name,
    TabWidth = 180,
    Size = UDim2.fromOffset(530, 350),
    Acrylic = false,
    Theme = "Midnight",
    MinimizeKey = Enum.KeyCode.Insert
    }
  )


  local main_tab = {
    Home = Window:AddTab(
      {
        Title = "Home",
        Icon = "home"
      }
    ),
    Main = Window:AddTab(
      {
        Title = "Main",
        Icon = "book"
      }
    )
  }

  local main = main_tab.Main:AddSection("Main")
  
  main:AddButton(
    {
      Title = "Shiftlock",
      Description = "",
      Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zBbLeZmD"))()
        end
    }
  )
  
  
  -- Supondo que `re` e `RemoteEvent` já estejam definidos e se referindo ao evento correto

-- Interceptando a chamada para FireServer
local originalFireServer = re.RemoteEvent

re.RemoteEvent = function(self, ...)
    local args = {...}
    
    -- Interceptar a chamada específica
    if args[1] == "SetPlayerMinigameResult" then
        warn("Chamada interceptada para SetPlayerMinigameResult com valor:", args[2])
        
        -- Modifique o argumento se necessário
        -- args[2] = true -- Exemplo de modificação
        
        -- Se quiser, você pode optar por não chamar a original com um retorno
        -- return  -- Não chama a função original, apenas interrompe aqui
    end

    -- Chama a função original após a manipulação
    return originalFireServer(self, unpack(args))
end

-- Adicionando o toggle 
main:AddToggle("Erro", {
    Title = "Anti Error",
    Default = getgenv().config.anti_error or false,
    Callback = function(value)
        getgenv().config.anti_error = value
        save()
        
        spawn(function()
            while getgenv().config.anti_error do
                task.wait()
                
                -- Faz a chamada para o FireServer
                re.RemoteEvent:FireServer("SetPlayerMinigameResult", true)
                warn("Chamada feita para SetPlayerMinigameResult")
            end
        end)
    end
})
  
  local function Tfling()
    task.spawn(function()
        local RVelocity = nil
        while TflingActive do
            pcall(function()
                RVelocity = GetRoot(plr).Velocity 
                GetRoot(plr).Velocity = Vector3.new(math.random(-150, 150), -25000, math.random(-150, 150))
                rs.RenderStepped:wait()
                GetRoot(plr).Velocity = RVelocity
            end)
            rs.Heartbeat:wait()
        end
    end)
  end

  main:AddToggle("touch_fling",
    {
      Title = "Touch Fling",
      Default = getgenv().config.touch_fling or false,
      Callback = function(value)
        getgenv().config.touch_fling = value
        save()
        
        spawn(function()
          if getgenv().config.touch_fling then
            task.spawn(function()
              local rv
              while getgenv().config.touch_fling do
                task.wait()
                pcall(function()
                  rv = GetRoot(lp).Velocity
                  GetRoot(lp).Velocity = Vector3.new(math.random(-150, 150), -25000, math.random(-150, 150))
                end)
                rs.Heartbeat:wait()
              end
            end)
            end
          end)
      end
    }
  )

  local players_tab = {
    Players = Window:AddTab(
      {
        Title = "Players",
        Icon = "users"
      }
    )
  }

  local Players = players_tab.Players:AddSection("Players")

  local player_list = {}

  local function get_player_list()
    player_list = {}

    for _, player in pairs(pl:GetPlayers()) do
        if player ~= lp then
            table.insert(player_list, player.Name)
        end
    end

    return player_list
  end

  local players = get_player_list()

  local select_player = Players:AddDropdown("select_player", {
    Title = "Select Player",
    Values = player_list,
    Multi = false,
    Default = "",
    Callback = function(Value)
        getgenv().select_player = Value
    end
    }
  )

  Players:AddButton(
    {
    Title = "Refresh Player List",
    Description = "",
    Callback = function()
        get_player_list()
        select_player:SetValues(player_list)
    end
    }
  )

  Players:AddButton(
    {
        Title = "Teleport",
        Description = "Teleport to a selected Player",
        Callback = function()
            local Selected = getgenv().select_player

            if Selected and Selected ~= "" then
                local Targeted_Player = game.Players:FindFirstChild(Selected)

                if Targeted_Player and Targeted_Player.Character and Targeted_Player.Character:FindFirstChild("HumanoidRootPart") then
                    local Targeted = Targeted_Player.Character.HumanoidRootPart

                    local success, err = pcall(function()
                        lp.Character.HumanoidRootPart.CFrame = Targeted.CFrame + Vector3.new(0, 3, 0)
                    end)

                    if not success then
                        Fluent:Notify(
                          {
                            Title = "Erro",
                            Content = "A teleportação falhou: " .. tostring(err),
                            Duration = 5
                          }
                        ) 
                    end
                else
                    Fluent:Notify(
                        {
                            Title = "Erro",
                            Content = "Jogador alvo não encontrado ou não está em um estado válido.",
                            Duration = 5
                        }
                    )
                end
            else
                Fluent:Notify(
                    {
                        Title = "Erro",
                        Content = "Por favor, selecione um jogador válido.",
                        Duration = 5
                    }
                )
            end
        end
    }
  )


game:GetService("Players").LocalPlayer.Character.Hammer.HammerEvent

local args = {
    [1] = "HammerTieUp",
    [2] = game:GetService("Players").tomasturbanoqw1w.Character.Torso,
    [3] = Vector3.new(16.571271896362305, 5.492792129516602, 18.188800811767578)
}

game:GetService("Players").LocalPlayer.Character.Hammer.HammerEvent:FireServer(unpack(args))
