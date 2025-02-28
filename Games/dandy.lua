if getgenv().Ocalism_dandy then
    warn("Ocalism: Already Executed")
    return
end
getgenv().Ocalism_dandy = true

if game.PlaceId == 16552821455 then
elseif game.PlaceId == 16116270224 then
else
    local localplr = game.Players.LocalPlayer
    localplr:Kick("\n you're dumb? \n This is not the Dandy's World map nigga")
    return
end

if not game:IsLoaded() then
    game.Loaded:wait()
end

-- variables
local cg = game:GetService("CoreGui")
local pl = game:GetService("Players")
local lp = pl.LocalPlayer
local http = game:GetService("HttpService")
local ip = game:GetService("UserInputService")
local Light = game:GetService("Lighting")
local mk = game:GetService("MarketplaceService")
local rs = game:GetService("RunService")
local vim = game:GetService("VirtualInputManager")
local w = game:GetService("Workspace")
local fonte = Enum.Font.Fantasy
local folder

if not cg:FindFirstChild("Ocalism") then
    folder = Instance.new("Folder")
    folder.Name = "Ocalism"
    folder.Parent = cg
end

getgenv().config = {
    machines = nil,
    twisteds = nil,
    items = nil,
    players = nil,
    skill_check = nil,
    picks = nil,
    fb = nil,
    speed = nil
}

if not isfolder("Ocalism/Config/Dandy's World") then
    makefolder("Ocalism/Config/Dandy's World")
end

local function save()
    local save_name = "Ocalism/Config/Dandy's World/config.json"
    local data = http:JSONEncode(getgenv().config)
    writefile(save_name, data)
end

local function load_config()
    local save_name = "Ocalism/Config/Dandy's World/config.json"
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
    if folder:FindFirstChild("ImageButton") then
        return
    end
    local ScreenGui1 = Instance.new("ScreenGui")
    local ImageButton1 = Instance.new("ImageButton")
    local UICorner = Instance.new("UICorner")

    ScreenGui1.Name = "ImageButton"
    ScreenGui1.Parent = folder
    ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    ImageButton1.Parent = ScreenGui1
    ImageButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ImageButton1.BorderSizePixel = 0
    ImageButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    ImageButton1.Size = UDim2.new(0, 50, 0, 50)
    ImageButton1.Draggable = true
    ImageButton1.Image = "rbxassetid://18540832673"
    ImageButton1.MouseButton1Click:connect(
        function()
            vim:SendKeyEvent(true, "Insert", false, game)
            vim:SendKeyEvent(false, "Insert", false, game)
        end
    )
    UICorner.Parent = ImageButton1
end

load_config()

local Fluent =
    loadstring(
    game:HttpGet("https://raw.githubusercontent.com/DevBeto-Cyber/Workspace/refs/heads/main/Library.txt", true)
)()

local Window =
    Fluent:CreateWindow(
    {
        Title = "Ocalism - by Beto     ",
        SubTitle = mk:GetProductInfo(16116270224).Name,
        TabWidth = 180,
        Size = UDim2.fromOffset(530, 350),
        Acrylic = false,
        Theme = "Darker",
        MinimizeKey = Enum.KeyCode.Insert
    }
)

local tabs = {
    Home = Window:AddTab(
        {
            Title = "Home",
            Icon = "home"
        }
    ),
    Main = Window:AddTab(
        {
            Title = "Game",
            Icon = "book"
        }
    )
}

-- game-variable
local currentRoom = w:FindFirstChild("CurrentRoom")
local huma = lp.Character:FindFirstChild("Humanoid")

local stats = tabs.Home:AddSection("Game Status")
local tempo = "Calculando..."

local paragraph =
    stats:AddParagraph(
    {
        Title = "Run time: " .. tempo,
        Content = ""
    }
)

spawn(
    function()
        while true do
            task.wait(1)

            local totalSeconds = math.floor(w.DistributedGameTime)
            local hours = math.floor(totalSeconds / 3600)
            local minutes = math.floor((totalSeconds % 3600) / 60)
            local seconds = totalSeconds % 60

            if hours > 0 then
                tempo = string.format("%d Hour(s), %d Minute(s), %d Second(s)", hours, minutes, seconds)
            elseif minutes > 0 then
                tempo = string.format("%d Minute(s), %d Second(s)", minutes, seconds)
            else
                tempo = string.format("%d Second(s)", seconds)
            end
            paragraph:SetTitle("Run time: " .. tempo)
        end
    end
)

local game_sec = tabs.Main:AddSection("")
-- speed = 30

game_sec:AddButton(
    {
        Title = "Shiftlock",
        Description = "",
        Callback = function()
            spawn(
                function()
                    if folder:FindFirstChild("Shiftlock (CoreGui)") then
                        return
                    end
                    local ScreenGui = Instance.new("ScreenGui")
                    local Button = Instance.new("ImageButton")
                    local Cursor = Instance.new("ImageLabel")
                    local States = {
                        Off = "rbxasset://textures/ui/mouseLock_off@2x.png",
                        On = "rbxasset://textures/ui/mouseLock_on@2x.png",
                        Lock = "rbxasset://textures/MouseLockedCursor.png",
                        Lock2 = "rbxasset://SystemCursors/Cross"
                    }

                    local MaxLength = 900000
                    local EnabledOffset = CFrame.new(1.7, 0, 0)
                    local DisabledOffset = CFrame.new(-1.7, 0, 0)

                    ScreenGui.Name = "Shiftlock (CoreGui)"
                    ScreenGui.Parent = folder
                    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    ScreenGui.ResetOnSpawn = false

                    Button.Parent = ScreenGui
                    Button.BackgroundTransparency = 1
                    Button.Position = UDim2.new(0.8, 0, 0.35, 0)
                    Button.Size = UDim2.new(0.0636147112, 0, 0.0661305636, 0)
                    Button.SizeConstraint = Enum.SizeConstraint.RelativeXX
                    Button.Image = States.Off

                    Cursor.Name = "Cursor"
                    Cursor.Parent = ScreenGui
                    Cursor.Image = States.Lock
                    Cursor.Size = UDim2.new(0.03, 0, 0.03, 0)
                    Cursor.Position = UDim2.new(0.5, 0, 0.5, 0)
                    Cursor.AnchorPoint = Vector2.new(0.5, 0.5)
                    Cursor.SizeConstraint = Enum.SizeConstraint.RelativeXX
                    Cursor.BackgroundTransparency = 1
                    Cursor.Visible = false

                    local Active

                    Button.MouseButton1Click:Connect(
                        function()
                            if not Active then
                                Active =
                                    rs.RenderStepped:Connect(
                                    function()
                                        if lp.Character and huma and workspace.CurrentCamera then
                                            huma.AutoRotate = false
                                            Button.Image = States.On
                                            Cursor.Visible = true

                                            lp.Character.HumanoidRootPart.CFrame =
                                                CFrame.new(
                                                lp.Character.HumanoidRootPart.Position,
                                                Vector3.new(
                                                    workspace.CurrentCamera.CFrame.LookVector.X * MaxLength,
                                                    lp.Character.HumanoidRootPart.Position.Y,
                                                    workspace.CurrentCamera.CFrame.LookVector.Z * MaxLength
                                                )
                                            )
                                            workspace.CurrentCamera.CFrame =
                                                workspace.CurrentCamera.CFrame * EnabledOffset
                                            workspace.CurrentCamera.Focus =
                                                CFrame.fromMatrix(
                                                workspace.CurrentCamera.Focus.Position,
                                                workspace.CurrentCamera.CFrame.RightVector,
                                                workspace.CurrentCamera.CFrame.UpVector
                                            ) * EnabledOffset
                                        end
                                    end
                                )
                            else
                                if lp.Character and huma then
                                    lp.Character.Humanoid.AutoRotate = true
                                end
                                Button.Image = States.Off
                                if workspace.CurrentCamera then
                                    workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * DisabledOffset
                                end
                                Cursor.Visible = false
                                pcall(
                                    function()
                                        Active:Disconnect()
                                        Active = nil
                                    end
                                )
                            end
                        end
                    )
                end
            )
        end
    }
)

local frameConnect
game_sec:AddToggle(
    "autocheck",
    {
        Title = "Auto SkillCheck",
        Default = getgenv().config.skill_check or false,
        Callback = function(value)
            getgenv().config.skill_check = value
            save()

            if frameConnect then
                frameConnect:Disconnect()
                frameConnect = nil
            end

            if getgenv().config.skill_check then
                spawn(
                    function()
                        local screen = lp:WaitForChild("PlayerGui"):FindFirstChild("ScreenGui")
                        if screen then
                            screen = screen:FindFirstChild("Menu")
                        end
                        if not screen then
                            return
                        end

                        local check_frame = screen:FindFirstChild("SkillCheckFrame")
                        if not check_frame then
                            return
                        end

                        frameConnect =
                            check_frame:GetPropertyChangedSignal("Visible"):Connect(
                            function()
                                if check_frame.Visible then
                                    local marker = check_frame:FindFirstChild("Marker")
                                    local Area = check_frame:FindFirstChild("GoldArea")

                                    if marker and Area then
                                        repeat
                                            local markerpos = marker.AbsolutePosition
                                            local areapos = Area.AbsolutePosition
                                            local goldsize = Area.AbsoluteSize

                                            if markerpos.X >= areapos.X and markerpos.X <= (areapos.X + goldsize.X) then
                                                vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                                                vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                                            end
                                            task.wait(0.01)
                                        until not check_frame.Visible
                                    end
                                end
                            end
                        )
                    end
                )
            else
                if frameConnect then
                    frameConnect:Disconnect()
                    frameConnect = nil
                end
            end
        end
    }
)

game_sec:AddToggle(
    "fb",
    {
        Title = "FullBright",
        Default = getgenv().config.fb or false,
        Callback = function(value)
            getgenv().config.fb = value
            save()

            spawn(
                function()
                    if getgenv().config.fb then
                        if Loop then
                            Loop:Disconnect()
                        end

                        local function Func()
                            Light.Brightness = 2
                            Light.FogEnd = 100000
                            Light.GlobalShadows = false
                            Light.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                            Light.ClockTime = 14
                        end

                        Loop = rs.RenderStepped:Connect(Func)
                    else
                        if Loop then
                            Loop:Disconnect()
                        end
                    end
                end
            )
        end
    }
)

local esp_tab = {
    esp = Window:AddTab(
        {
            Title = "Esp",
            Icon = "eye"
        }
    )
}

local esp = esp_tab.esp:AddSection("")

esp:AddToggle(
    "machines",
    {
        Title = "Esp Machines",
        Default = getgenv().config.machines or false,
        Callback = function(value)
            getgenv().config.machines = value
            save()

            spawn(
                function()
                    if getgenv().config.machines then
                        while getgenv().config.machines do
                            task.wait()
                            if not currentRoom then
                                return
                            end

                            for _, room in ipairs(currentRoom:GetChildren()) do
                                if room.Name:match("^Floor") or room.Name == "Diner" then
                                    local generatorFolder = room:FindFirstChild("Generators")
                                    if generatorFolder then
                                        for _, generator in ipairs(generatorFolder:GetChildren()) do
                                            if generator.Name == "Generator" then
                                                local stat =
                                                    generator:FindFirstChild("Stats") and
                                                    generator.Stats:FindFirstChild("Completed")
                                                local high = generator:FindFirstChild("GnH")

                                                if stat and stat.Value then
                                                    if high and high.FillColor ~= Color3.new(0.666, 0.333, 0) then
                                                        high:Destroy()
                                                        high = nil
                                                    end

                                                    if not high then
                                                        local GnH = Instance.new("Highlight")
                                                        GnH.Name = "GnH"
                                                        GnH.Adornee = generator
                                                        GnH.FillColor = Color3.new(0.666, 0.333, 0) -- Marrom
                                                        GnH.OutlineColor = Color3.new(0.666, 0.333, 0)
                                                        GnH.FillTransparency = 0.37
                                                        GnH.OutlineTransparency = 0.87
                                                        GnH.Parent = generator
                                                    end
                                                else
                                                    if high and high.FillColor ~= Color3.new(0, 1, 0) then
                                                        high:Destroy()
                                                        high = nil
                                                    end

                                                    if not high then
                                                        local GnH = Instance.new("Highlight")
                                                        GnH.Name = "GnH"
                                                        GnH.Adornee = generator
                                                        GnH.FillColor = Color3.new(0, 1, 0) -- Verde
                                                        GnH.OutlineColor = Color3.new(1, 1, 1)
                                                        GnH.FillTransparency = 0.37
                                                        GnH.OutlineTransparency = 0.67
                                                        GnH.Parent = generator
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    else
                        for _, verify in ipairs(workspace:GetDescendants()) do
                            if verify.Name == "GnH" then
                                verify:Destroy()
                            end
                        end
                    end
                end
            )
        end
    }
)

local specialMonsters = {
    VeeMonster = true,
    DandyMonster = true,
    ShellyMonster = true,
    SproutMonster = true,
    AstroMonster = true,
    PebbleMonster = true,
    GlistenMonster = true
}

esp:AddToggle(
    "twisteds",
    {
        Title = "Esp Twisted's",
        Default = getgenv().config.twisteds or false,
        Callback = function(value)
            getgenv().config.twisteds = value
            save()

            spawn(
                function()
                    if getgenv().config.twisteds then
                        while getgenv().config.twisteds do
                            task.wait()
                            if not currentRoom then
                                return
                            end

                            for _, room in ipairs(currentRoom:GetChildren()) do
                                if room.Name:match("^Floor") or room.Name == "Diner" then
                                    local twistedsFolder = room:FindFirstChild("Monsters")
                                    if twistedsFolder then
                                        for _, monster in ipairs(twistedsFolder:GetChildren()) do
                                            local highlight = monster:FindFirstChild("MnH")
                                            if not highlight then
                                                highlight = Instance.new("Highlight")
                                                highlight.Name = "MnH"
                                                highlight.Adornee = monster
                                                highlight.Parent = monster
                                            end

                                            if specialMonsters[monster.Name] then
                                                highlight.FillColor = Color3.new(0, 0, 1) -- Azul
                                            else
                                                highlight.FillColor = Color3.new(1, 0, 0) -- Vermelho
                                            end
                                            highlight.OutlineColor = Color3.new(1, 1, 1)
                                            highlight.FillTransparency = 0.37
                                            highlight.OutlineTransparency = 0.67
                                        end
                                    end
                                end
                            end
                        end
                    else
                        for _, obj in ipairs(workspace:GetDescendants()) do
                            if obj:IsA("Highlight") and obj.Name == "MnH" then
                                obj:Destroy()
                            end
                        end
                    end
                end
            )
        end
    }
)

esp:AddToggle(
    "items",
    {
        Title = "Esp Items",
        Default = getgenv().config.items or false,
        Callback = function(value)
            getgenv().config.items = value
            save()

            spawn(
                function()
                    if getgenv().config.items then
                        while getgenv().config.items do
                            task.wait()
                            if not currentRoom then
                                return
                            end
                            for _, room in ipairs(currentRoom:GetChildren()) do
                                if room.Name:match("^Floor") or room.Name == "Diner" then
                                    local folder1 = room:FindFirstChild("Items")
                                    if folder1 then
                                        for _, item in ipairs(folder1:GetChildren()) do
                                            if item:IsA("Model") or item:IsA("BasePart") then
                                                local name = item.Name
                                                local properties = item:FindFirstChild("Properties")
                                                if properties and properties:IsA("StringValue") then
                                                    name = properties.Value
                                                end
                                                local high = item:FindFirstChild("ImH")
                                                local tag = item:FindFirstChild("NameTag")

                                                if not high then
                                                    high = Instance.new("Highlight")
                                                    high.Name = "ImH"
                                                    high.FillColor = Color3.new(1, 1, 0) -- yellow
                                                    high.FillTransparency = 0.37
                                                    high.OutlineColor = Color3.new(1, 1, 0)
                                                    high.OutlineTransparency = 0.87
                                                    high.Adornee = item
                                                    high.Parent = item
                                                end
                                                if not tag then
                                                    tag = Instance.new("BillboardGui")
                                                    tag.Name = "NameTag"
                                                    tag.Size = UDim2.new(0, 80, 0, 30)
                                                    tag.AlwaysOnTop = true
                                                    tag.StudsOffset = Vector3.new(0, 1.5, 0)
                                                    tag.Adornee = item:IsA("Model") and item.PrimaryPart or item
                                                    tag.Parent = item

                                                    label = Instance.new("TextLabel")
                                                    label.Size = UDim2.new(1, 0, 1, 0)
                                                    label.BackgroundTransparency = 1
                                                    label.TextScaled = true
                                                    label.TextColor3 = Color3.new(1, 1, 0) -- yellow
                                                    label.TextStrokeTransparency = 1
                                                    label.TextSize = 13
                                                    label.Font = fonte
                                                    label.Text = name
                                                    label.Parent = tag
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    else
                        for _, room in ipairs(currentRoom:GetChildren()) do
                            if room.Name:match("^Floor") then
                                local folder1 = room:FindFirstChild("Items")
                                if folder1 then
                                    for _, item in ipairs(folder1:GetChildren()) do
                                        local high = item:FindFirstChild("ImH")
                                        local tag = item:FindFirstChild("NameTag")
                                        if high and tag then
                                            high:Destroy()
                                            tag:Destroy()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            )
        end
    }
)

local esp_p = esp_tab.esp:AddSection("Players Esp")

-- box esp
-- Line esp
-- highlight esp
-- billboardgui

local plr_tab = {
    plrs = Window:AddTab(
        {
            Title = "LocalPlayer",
            Icon = "user"
        }
    )
}

local plr = plr_tab.plrs:AddSection("")

plr:AddToggle(
    "speed",
    {
        Title = "Speed Increase",
        Default = getgenv().config.speed or false,
        Callback = function(value)
            getgenv().config.speed = value
            save()

            spawn(
                function()
                    while getgenv().config.speed do
                        task.wait()
                        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
                            lp.Character.Humanoid.WalkSpeed = 30
                        end
                    end
                end
            )
        end
    }
)

plr:AddToggle(
    "jump",
    {
        Title = "Active JumpButton",
        Default = getgenv().config.jump or false,
        Callback = function(value)
            getgenv().config.jump = value
            save()

            spawn(
                function()
                    if getgenv().config.jump then
                        while getgenv().config.jump do
                            task.wait()
                            local gui = lp:WaitForChild("PlayerGui"):FindFirstChild("TouchGui")
                            local frame = gui and gui:FindFirstChild("TouchControlFrame")
                            local button = frame and frame:FindFirstChild("JumpButton")
                            if lp.Character:FindFirstChild("Humanoid") and button then
                                if button.Visible then
                                    return
                                end
                                lp.Character.Humanoid.UseJumpPower = true
                                lp.Character.Humanoid.JumpPower = 36
                                button.Visible = true
                                button.Position = UDim2.new(0.726999998, 33, 0.612000048, 37)
                                button.Size = UDim2.new(0.0791233853, 0, 0.16372034, 0)
                            end
                            if not getgenv().config.jump then
                                huma.UseJumpPower = false
                                button.Visible = false
                            end
                        end
                    end
                end
            )
        end
    }
)

local misc_tab = {
    misc = Window:AddTab(
        {
            Title = "Misc",
            Icon = "align-justify"
        }
    )
}

local Misc = misc_tab.misc:AddSection("")

Misc:AddButton(
    {
        Title = "Destroy Hub",
        Description = "",
        Callback = function()
            for _, v in pairs(cg:GetChildren()) do
                if v.Name == "Ocalism" then
                    local get = gethui() or cg
                    local gui = get:FindFirstChild("Library")
                    getgenv().Ocalism_dandy = false
                    v:Destroy()
                    gui:Destroy()
                    folder:Destroy()
                end
            end
        end
    }
)

local printedRooms = {}
local printedMonsters = {}

while true do
    task.wait()
    
    -- Verifica as salas
    for _, room in ipairs(currentRoom:GetChildren()) do
        if room.Name:match("^Floor") or room.Name == "Diner" then
            if not printedRooms[room] then
                print(room.Name)
                printedRooms[room] = true
            end
            
            -- Verifica os monstros dentro da sala
            local twistedsFolder = room:FindFirstChild("Monsters")
            if twistedsFolder then
                for _, monster in ipairs(twistedsFolder:GetChildren()) do
                    if not printedMonsters[monster] then
                        print("Monstro:", monster.Name)
                        printedMonsters[monster] = true
                    end
                end
            end
        end
    end
    
    -- Limpa os registros de objetos que foram destruídos
    for room in pairs(printedRooms) do
        if not room.Parent then
            printedRooms[room] = nil
        end
    end
    
    for monster in pairs(printedMonsters) do
        if not monster.Parent then
            printedMonsters[monster] = nil
        end
    end
end
