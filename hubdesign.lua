
-- LRD.dev UI Library
-- The most advanced, feature-rich UI library for Roblox with smooth animations
-- Version 2.0.0 - Premium Edition

local LRDLibrary = {}
LRDLibrary.Version = "2.0.0"
LRDLibrary.Author = "LRD.dev"

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local GuiService = game:GetService("GuiService")
local MarketplaceService = game:GetService("MarketplaceService")
local HttpService = game:GetService("HttpService")
local TextService = game:GetService("TextService")
local Debris = game:GetService("Debris")

-- Variables
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Mouse = LocalPlayer:GetMouse()

-- Configuration
LRDLibrary.Config = {
    AnimationSpeed = 0.3,
    SoundEnabled = true,
    SaveConfig = true,
    Theme = "Default",
    Language = "English",
    AutoSave = true,
    BlurBackground = true,
    Keybinds = true,
    Tooltips = true,
    Analytics = false,
    DebugMode = false
}

-- Sound Effects
LRDLibrary.Sounds = {
    Click = "rbxassetid://131961136",
    Hover = "rbxassetid://131961136",
    Success = "rbxassetid://131961136",
    Error = "rbxassetid://131961136",
    Notification = "rbxassetid://131961136",
    Tab = "rbxassetid://131961136",
    Toggle = "rbxassetid://131961136",
    Slider = "rbxassetid://131961136"
}

-- Advanced Theme System
LRDLibrary.Themes = {
    Default = {
        Name = "Default Dark",
        Primary = Color3.fromRGB(138, 43, 226),
        PrimaryHover = Color3.fromRGB(148, 63, 236),
        Secondary = Color3.fromRGB(75, 75, 85),
        Accent = Color3.fromRGB(255, 100, 150),
        
        Background = Color3.fromRGB(30, 30, 35),
        SecondaryBackground = Color3.fromRGB(25, 25, 30),
        TertiaryBackground = Color3.fromRGB(20, 20, 25),
        Topbar = Color3.fromRGB(35, 35, 40),
        Shadow = Color3.fromRGB(15, 15, 20),
        
        ElementBackground = Color3.fromRGB(40, 40, 45),
        ElementBackgroundHover = Color3.fromRGB(45, 45, 50),
        ElementBackgroundActive = Color3.fromRGB(50, 50, 55),
        ElementStroke = Color3.fromRGB(60, 60, 65),
        
        TabBackground = Color3.fromRGB(50, 50, 55),
        TabBackgroundSelected = Color3.fromRGB(138, 43, 226),
        TabStroke = Color3.fromRGB(65, 65, 70),
        
        TextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(200, 200, 200),
        DisabledTextColor = Color3.fromRGB(120, 120, 120),
        
        Success = Color3.fromRGB(46, 204, 113),
        Warning = Color3.fromRGB(241, 196, 15),
        Error = Color3.fromRGB(231, 76, 60),
        Info = Color3.fromRGB(52, 152, 219),
        
        ToggleEnabled = Color3.fromRGB(138, 43, 226),
        ToggleDisabled = Color3.fromRGB(70, 70, 75),
        
        SliderBackground = Color3.fromRGB(60, 60, 65),
        SliderProgress = Color3.fromRGB(138, 43, 226),
        
        NotificationBackground = Color3.fromRGB(35, 35, 40),
        NotificationBorder = Color3.fromRGB(138, 43, 226),
        
        GraphLine = Color3.fromRGB(138, 43, 226),
        GraphBackground = Color3.fromRGB(40, 40, 45),
        
        CodeBackground = Color3.fromRGB(25, 25, 30),
        CodeText = Color3.fromRGB(248, 248, 242),
        CodeKeyword = Color3.fromRGB(249, 38, 114),
        CodeString = Color3.fromRGB(230, 219, 116),
        CodeComment = Color3.fromRGB(117, 113, 94)
    },
    
    Light = {
        Name = "Light Mode",
        Primary = Color3.fromRGB(99, 102, 241),
        PrimaryHover = Color3.fromRGB(79, 70, 229),
        Secondary = Color3.fromRGB(156, 163, 175),
        Accent = Color3.fromRGB(236, 72, 153),
        
        Background = Color3.fromRGB(255, 255, 255),
        SecondaryBackground = Color3.fromRGB(249, 250, 251),
        TertiaryBackground = Color3.fromRGB(243, 244, 246),
        Topbar = Color3.fromRGB(243, 244, 246),
        Shadow = Color3.fromRGB(0, 0, 0),
        
        ElementBackground = Color3.fromRGB(249, 250, 251),
        ElementBackgroundHover = Color3.fromRGB(243, 244, 246),
        ElementBackgroundActive = Color3.fromRGB(229, 231, 235),
        ElementStroke = Color3.fromRGB(209, 213, 219),
        
        TabBackground = Color3.fromRGB(243, 244, 246),
        TabBackgroundSelected = Color3.fromRGB(99, 102, 241),
        TabStroke = Color3.fromRGB(209, 213, 219),
        
        TextColor = Color3.fromRGB(17, 24, 39),
        SecondaryTextColor = Color3.fromRGB(75, 85, 99),
        DisabledTextColor = Color3.fromRGB(156, 163, 175),
        
        Success = Color3.fromRGB(34, 197, 94),
        Warning = Color3.fromRGB(245, 158, 11),
        Error = Color3.fromRGB(239, 68, 68),
        Info = Color3.fromRGB(59, 130, 246),
        
        ToggleEnabled = Color3.fromRGB(99, 102, 241),
        ToggleDisabled = Color3.fromRGB(156, 163, 175),
        
        SliderBackground = Color3.fromRGB(209, 213, 219),
        SliderProgress = Color3.fromRGB(99, 102, 241),
        
        NotificationBackground = Color3.fromRGB(255, 255, 255),
        NotificationBorder = Color3.fromRGB(99, 102, 241),
        
        GraphLine = Color3.fromRGB(99, 102, 241),
        GraphBackground = Color3.fromRGB(249, 250, 251),
        
        CodeBackground = Color3.fromRGB(243, 244, 246),
        CodeText = Color3.fromRGB(17, 24, 39),
        CodeKeyword = Color3.fromRGB(147, 51, 234),
        CodeString = Color3.fromRGB(34, 197, 94),
        CodeComment = Color3.fromRGB(107, 114, 128)
    },
    
    Neon = {
        Name = "Neon Cyber",
        Primary = Color3.fromRGB(0, 255, 255),
        PrimaryHover = Color3.fromRGB(0, 230, 255),
        Secondary = Color3.fromRGB(255, 0, 255),
        Accent = Color3.fromRGB(255, 255, 0),
        
        Background = Color3.fromRGB(10, 10, 15),
        SecondaryBackground = Color3.fromRGB(5, 5, 10),
        TertiaryBackground = Color3.fromRGB(0, 0, 5),
        Topbar = Color3.fromRGB(15, 15, 20),
        Shadow = Color3.fromRGB(0, 0, 0),
        
        ElementBackground = Color3.fromRGB(20, 20, 25),
        ElementBackgroundHover = Color3.fromRGB(25, 25, 30),
        ElementBackgroundActive = Color3.fromRGB(30, 30, 35),
        ElementStroke = Color3.fromRGB(0, 255, 255),
        
        TabBackground = Color3.fromRGB(20, 20, 25),
        TabBackgroundSelected = Color3.fromRGB(0, 255, 255),
        TabStroke = Color3.fromRGB(255, 0, 255),
        
        TextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(0, 255, 255),
        DisabledTextColor = Color3.fromRGB(100, 100, 100),
        
        Success = Color3.fromRGB(0, 255, 0),
        Warning = Color3.fromRGB(255, 255, 0),
        Error = Color3.fromRGB(255, 0, 0),
        Info = Color3.fromRGB(0, 255, 255),
        
        ToggleEnabled = Color3.fromRGB(0, 255, 0),
        ToggleDisabled = Color3.fromRGB(50, 50, 50),
        
        SliderBackground = Color3.fromRGB(50, 50, 50),
        SliderProgress = Color3.fromRGB(0, 255, 255),
        
        NotificationBackground = Color3.fromRGB(15, 15, 20),
        NotificationBorder = Color3.fromRGB(0, 255, 255),
        
        GraphLine = Color3.fromRGB(0, 255, 255),
        GraphBackground = Color3.fromRGB(20, 20, 25),
        
        CodeBackground = Color3.fromRGB(10, 10, 15),
        CodeText = Color3.fromRGB(255, 255, 255),
        CodeKeyword = Color3.fromRGB(255, 0, 255),
        CodeString = Color3.fromRGB(0, 255, 0),
        CodeComment = Color3.fromRGB(100, 100, 100)
    }
}

-- Current theme reference
LRDLibrary.Theme = LRDLibrary.Themes.Default

-- Language System
LRDLibrary.Languages = {
    English = {
        Loading = "Loading",
        PleaseWait = "Please wait...",
        Close = "Close",
        Minimize = "Minimize",
        Maximize = "Maximize",
        Settings = "Settings",
        Theme = "Theme",
        Language = "Language",
        Save = "Save",
        Reset = "Reset",
        Cancel = "Cancel",
        Confirm = "Confirm",
        Success = "Success",
        Error = "Error",
        Warning = "Warning",
        Info = "Information",
        Copy = "Copy",
        Paste = "Paste",
        Delete = "Delete",
        Edit = "Edit",
        Search = "Search",
        Filter = "Filter",
        Sort = "Sort",
        Export = "Export",
        Import = "Import",
        Help = "Help",
        About = "About"
    },
    Spanish = {
        Loading = "Cargando",
        PleaseWait = "Por favor espere...",
        Close = "Cerrar",
        Minimize = "Minimizar",
        Maximize = "Maximizar",
        Settings = "Configuración",
        Theme = "Tema",
        Language = "Idioma",
        Save = "Guardar",
        Reset = "Restablecer",
        Cancel = "Cancelar",
        Confirm = "Confirmar",
        Success = "Éxito",
        Error = "Error",
        Warning = "Advertencia",
        Info = "Información",
        Copy = "Copiar",
        Paste = "Pegar",
        Delete = "Eliminar",
        Edit = "Editar",
        Search = "Buscar",
        Filter = "Filtrar",
        Sort = "Ordenar",
        Export = "Exportar",
        Import = "Importar",
        Help = "Ayuda",
        About = "Acerca de"
    },
    French = {
        Loading = "Chargement",
        PleaseWait = "Veuillez patienter...",
        Close = "Fermer",
        Minimize = "Réduire",
        Maximize = "Agrandir",
        Settings = "Paramètres",
        Theme = "Thème",
        Language = "Langue",
        Save = "Sauvegarder",
        Reset = "Réinitialiser",
        Cancel = "Annuler",
        Confirm = "Confirmer",
        Success = "Succès",
        Error = "Erreur",
        Warning = "Avertissement",
        Info = "Information",
        Copy = "Copier",
        Paste = "Coller",
        Delete = "Supprimer",
        Edit = "Modifier",
        Search = "Rechercher",
        Filter = "Filtrer",
        Sort = "Trier",
        Export = "Exporter",
        Import = "Importer",
        Help = "Aide",
        About = "À propos"
    }
}

-- Animation presets
LRDLibrary.Animations = {
    FadeIn = function(object, duration)
        object.Transparency = 1
        return TweenService:Create(object, TweenInfo.new(duration or 0.3, Enum.EasingStyle.Quad), {Transparency = 0})
    end,
    
    FadeOut = function(object, duration)
        return TweenService:Create(object, TweenInfo.new(duration or 0.3, Enum.EasingStyle.Quad), {Transparency = 1})
    end,
    
    SlideIn = function(object, direction, duration)
        local originalPos = object.Position
        local offscreenPos
        
        if direction == "Left" then
            offscreenPos = UDim2.new(-1, 0, originalPos.Y.Scale, originalPos.Y.Offset)
        elseif direction == "Right" then
            offscreenPos = UDim2.new(1, 0, originalPos.Y.Scale, originalPos.Y.Offset)
        elseif direction == "Top" then
            offscreenPos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset, -1, 0)
        else -- Bottom
            offscreenPos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset, 1, 0)
        end
        
        object.Position = offscreenPos
        return TweenService:Create(object, TweenInfo.new(duration or 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = originalPos})
    end,
    
    Scale = function(object, scale, duration)
        return TweenService:Create(object, TweenInfo.new(duration or 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(scale, 0, scale, 0)})
    end,
    
    Bounce = function(object, duration)
        local tween1 = TweenService:Create(object, TweenInfo.new(duration or 0.1, Enum.EasingStyle.Quad), {Size = object.Size + UDim2.new(0, 10, 0, 10)})
        local tween2 = TweenService:Create(object, TweenInfo.new(duration or 0.1, Enum.EasingStyle.Quad), {Size = object.Size})
        
        tween1:Play()
        tween1.Completed:Connect(function()
            tween2:Play()
        end)
        
        return tween1
    end,
    
    Shake = function(object, intensity, duration)
        local originalPos = object.Position
        local connection
        local elapsed = 0
        
        connection = RunService.Heartbeat:Connect(function(dt)
            elapsed = elapsed + dt
            if elapsed >= (duration or 0.5) then
                object.Position = originalPos
                connection:Disconnect()
                return
            end
            
            local x = math.random(-intensity, intensity)
            local y = math.random(-intensity, intensity)
            object.Position = originalPos + UDim2.new(0, x, 0, y)
        end)
    end
}

-- Icon system
LRDLibrary.Icons = {
    Home = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Settings = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    User = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Search = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Bell = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Star = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Heart = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Plus = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Minus = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Check = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    X = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Arrow = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Download = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Upload = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Play = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Pause = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    Stop = "rbxasset://textures/ui/GuiImagePlaceholder.png"
}

-- Advanced utility functions
local function playSound(soundId)
    if not LRDLibrary.Config.SoundEnabled then return end
    
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = 0.5
    sound.Parent = SoundService
    sound:Play()
    
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

local function generateUUID()
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    return string.gsub(template, "[xy]", function(c)
        local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format("%x", v)
    end)
end

local function lerp(a, b, t)
    return a + (b - a) * t
end

local function round(number, decimalPlaces)
    local multiplier = 10^(decimalPlaces or 0)
    return math.floor(number * multiplier + 0.5) / multiplier
end

local function formatNumber(num)
    if num >= 1000000000 then
        return string.format("%.1fB", num / 1000000000)
    elseif num >= 1000000 then
        return string.format("%.1fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.1fK", num / 1000)
    else
        return tostring(num)
    end
end

local function interpolateColor(color1, color2, t)
    return Color3.new(
        lerp(color1.R, color2.R, t),
        lerp(color1.G, color2.G, t),
        lerp(color1.B, color2.B, t)
    )
end

local function hexToColor3(hex)
    hex = hex:gsub("#", "")
    return Color3.fromRGB(
        tonumber("0x" .. hex:sub(1, 2)),
        tonumber("0x" .. hex:sub(3, 4)),
        tonumber("0x" .. hex:sub(5, 6))
    )
end

local function color3ToHex(color)
    return string.format("#%02X%02X%02X", 
        math.floor(color.R * 255),
        math.floor(color.G * 255),
        math.floor(color.B * 255)
    )
end

-- Create Screen GUI with blur effect
local function createScreenGui(name)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 100
    
    if LRDLibrary.Config.BlurBackground then
        local blur = Instance.new("BlurEffect")
        blur.Size = 10
        blur.Parent = Lighting
        
        screenGui.AncestryChanged:Connect(function()
            if not screenGui.Parent then
                blur:Destroy()
            end
        end)
    end
    
    screenGui.Parent = CoreGui
    return screenGui
end

-- Enhanced utility functions
local function tween(object, tweenInfo, properties, callback)
    local tweenObj = TweenService:Create(object, tweenInfo, properties)
    tweenObj:Play()
    
    if callback then
        tweenObj.Completed:Connect(callback)
    end
    
    return tweenObj
end

local function createFrame(properties)
    local frame = Instance.new("Frame")
    frame.BackgroundColor3 = LRDLibrary.Theme.Background
    frame.BorderSizePixel = 0
    
    for prop, value in pairs(properties or {}) do
        frame[prop] = value
    end
    
    return frame
end

local function createTextLabel(properties)
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextColor3 = LRDLibrary.Theme.TextColor
    label.TextScaled = false
    label.TextWrapped = true
    
    for prop, value in pairs(properties or {}) do
        label[prop] = value
    end
    
    return label
end

local function createTextButton(properties)
    local button = Instance.new("TextButton")
    button.BackgroundTransparency = 1
    button.Font = Enum.Font.Gotham
    button.TextColor3 = LRDLibrary.Theme.TextColor
    button.AutoButtonColor = false
    
    for prop, value in pairs(properties or {}) do
        button[prop] = value
    end
    
    return button
end

local function createImageButton(properties)
    local button = Instance.new("ImageButton")
    button.BackgroundTransparency = 1
    button.AutoButtonColor = false
    
    for prop, value in pairs(properties or {}) do
        button[prop] = value
    end
    
    return button
end

local function createImageLabel(properties)
    local image = Instance.new("ImageLabel")
    image.BackgroundTransparency = 1
    
    for prop, value in pairs(properties or {}) do
        image[prop] = value
    end
    
    return image
end

local function createTextBox(properties)
    local textBox = Instance.new("TextBox")
    textBox.BackgroundTransparency = 1
    textBox.Font = Enum.Font.Gotham
    textBox.TextColor3 = LRDLibrary.Theme.TextColor
    textBox.ClearTextOnFocus = false
    
    for prop, value in pairs(properties or {}) do
        textBox[prop] = value
    end
    
    return textBox
end

local function addCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 8)
    corner.Parent = parent
    return corner
end

local function addStroke(parent, color, thickness, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or LRDLibrary.Theme.ElementStroke
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0
    stroke.Parent = parent
    return stroke
end

local function addGradient(parent, colors, rotation)
    local gradient = Instance.new("UIGradient")
    gradient.Color = colors or ColorSequence.new{
        ColorSequenceKeypoint.new(0, LRDLibrary.Theme.Primary),
        ColorSequenceKeypoint.new(1, LRDLibrary.Theme.PrimaryHover)
    }
    gradient.Rotation = rotation or 0
    gradient.Parent = parent
    return gradient
end

local function addShadow(parent, size, transparency)
    local shadow = createFrame({
        Name = "Shadow",
        Size = UDim2.new(1, size or 20, 1, size or 20),
        Position = UDim2.new(0, -(size or 20)/2, 0, -(size or 20)/2),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = transparency or 0.8,
        ZIndex = parent.ZIndex - 1,
        Parent = parent
    })
    addCorner(shadow, (size or 20)/2)
    return shadow
end

local function addRipple(parent)
    local ripple = createFrame({
        Name = "Ripple",
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.8,
        ZIndex = parent.ZIndex + 1,
        Parent = parent
    })
    addCorner(ripple, 50)
    
    parent.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mousePos = UserInputService:GetMouseLocation()
            local parentPos = parent.AbsolutePosition
            local parentSize = parent.AbsoluteSize
            
            local relativeX = mousePos.X - parentPos.X
            local relativeY = mousePos.Y - parentPos.Y
            
            ripple.Position = UDim2.new(0, relativeX, 0, relativeY)
            ripple.Size = UDim2.new(0, 0, 0, 0)
            ripple.BackgroundTransparency = 0.5
            
            local maxSize = math.max(parentSize.X, parentSize.Y) * 2
            
            tween(ripple, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, maxSize, 0, maxSize),
                Position = UDim2.new(0, relativeX - maxSize/2, 0, relativeY - maxSize/2),
                BackgroundTransparency = 1
            })
        end
    end)
    
    return ripple
end

-- Advanced Notification System
local NotificationContainer
local notifications = {}

local function createNotificationContainer()
    if NotificationContainer then return end

    NotificationContainer = createFrame({
        Name = "LRD_Notifications",
        Size = UDim2.new(0, 350, 1, 0),
        Position = UDim2.new(1, -370, 0, 20),
        BackgroundTransparency = 1,
        ZIndex = 1000,
        Parent = createScreenGui("LRD_NotificationGui")
    })

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 10)
    layout.VerticalAlignment = Enum.VerticalAlignment.Top
    layout.Parent = NotificationContainer
end

function LRDLibrary:Notify(settings)
    createNotificationContainer()
    
    local notificationId = generateUUID()
    local notificationType = settings.Type or "Info"
    local typeColors = {
        Success = LRDLibrary.Theme.Success,
        Warning = LRDLibrary.Theme.Warning,
        Error = LRDLibrary.Theme.Error,
        Info = LRDLibrary.Theme.Info
    }
    
    local notification = createFrame({
        Name = "Notification_" .. notificationId,
        Size = UDim2.new(1, 0, 0, 100),
        BackgroundColor3 = LRDLibrary.Theme.NotificationBackground,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        LayoutOrder = #notifications + 1,
        Parent = NotificationContainer
    })

    addCorner(notification, 12)
    addStroke(notification, typeColors[notificationType] or LRDLibrary.Theme.NotificationBorder, 2)
    addShadow(notification, 10, 0.6)

    -- Icon
    local icon = createImageLabel({
        Size = UDim2.new(0, 24, 0, 24),
        Position = UDim2.new(0, 15, 0, 15),
        Image = LRDLibrary.Icons[notificationType] or LRDLibrary.Icons.Bell,
        ImageColor3 = typeColors[notificationType] or LRDLibrary.Theme.Primary,
        Parent = notification
    })

    -- Title
    local title = createTextLabel({
        Size = UDim2.new(1, -90, 0, 25),
        Position = UDim2.new(0, 50, 0, 10),
        Text = settings.Title or "Notification",
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = notification
    })

    -- Content
    local content = createTextLabel({
        Size = UDim2.new(1, -50, 0, 50),
        Position = UDim2.new(0, 50, 0, 35),
        Text = settings.Content or "No content provided",
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        Parent = notification
    })

    -- Close button
    local closeButton = createTextButton({
        Size = UDim2.new(0, 24, 0, 24),
        Position = UDim2.new(1, -35, 0, 10),
        Text = "×",
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
        Parent = notification
    })

    -- Progress bar
    local progressBar = createFrame({
        Size = UDim2.new(1, 0, 0, 3),
        Position = UDim2.new(0, 0, 1, -3),
        BackgroundColor3 = typeColors[notificationType] or LRDLibrary.Theme.Primary,
        BorderSizePixel = 0,
        Parent = notification
    })

    -- Animation
    notification.Position = UDim2.new(1, 0, 0, 0)
    LRDLibrary.Animations.SlideIn(notification, "Left", 0.5):Play()

    -- Sound
    playSound(LRDLibrary.Sounds.Notification)

    -- Auto-remove functionality
    local duration = settings.Duration or 5
    local startTime = tick()
    
    local connection
    connection = RunService.Heartbeat:Connect(function()
        local elapsed = tick() - startTime
        local progress = elapsed / duration
        
        if progress >= 1 then
            connection:Disconnect()
            
            LRDLibrary.Animations.SlideIn(notification, "Right", 0.3):Play()
            task.wait(0.3)
            
            notification:Destroy()
            
            -- Remove from notifications table
            for i, notif in ipairs(notifications) do
                if notif.id == notificationId then
                    table.remove(notifications, i)
                    break
                end
            end
        else
            progressBar.Size = UDim2.new(1 - progress, 0, 0, 3)
        end
    end)

    -- Close button functionality
    closeButton.MouseButton1Click:Connect(function()
        connection:Disconnect()
        
        LRDLibrary.Animations.SlideIn(notification, "Right", 0.3):Play()
        task.wait(0.3)
        notification:Destroy()
        
        for i, notif in ipairs(notifications) do
            if notif.id == notificationId then
                table.remove(notifications, i)
                break
            end
        end
    end)

    -- Add to notifications table
    table.insert(notifications, {
        id = notificationId,
        element = notification,
        type = notificationType,
        timestamp = tick()
    })

    return notificationId
end

-- Context Menu System
local ContextMenu = {}

function LRDLibrary:CreateContextMenu(items)
    local contextMenu = createFrame({
        Name = "ContextMenu",
        Size = UDim2.new(0, 200, 0, #items * 35 + 10),
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 999,
        Parent = createScreenGui("LRD_ContextMenu")
    })
    
    addCorner(contextMenu, 8)
    addStroke(contextMenu, LRDLibrary.Theme.ElementStroke, 1)
    addShadow(contextMenu, 15, 0.7)

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 2)
    layout.Parent = contextMenu

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingBottom = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.Parent = contextMenu

    for i, item in ipairs(items) do
        local menuItem = createTextButton({
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
            Text = "  " .. item.Text,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = i,
            Parent = contextMenu
        })
        
        addCorner(menuItem, 6)

        if item.Icon then
            local icon = createImageLabel({
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, 8, 0.5, -8),
                Image = item.Icon,
                Parent = menuItem
            })
        end

        menuItem.MouseEnter:Connect(function()
            tween(menuItem, TweenInfo.new(0.2), {
                BackgroundColor3 = LRDLibrary.Theme.ElementBackgroundHover
            })
        end)

        menuItem.MouseLeave:Connect(function()
            tween(menuItem, TweenInfo.new(0.2), {
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground
            })
        end)

        menuItem.MouseButton1Click:Connect(function()
            if item.Callback then
                item.Callback()
            end
            contextMenu.Visible = false
        end)
    end

    function ContextMenu:Show(position)
        contextMenu.Position = UDim2.new(0, position.X, 0, position.Y)
        contextMenu.Visible = true
        
        LRDLibrary.Animations.FadeIn(contextMenu, 0.2):Play()
    end

    function ContextMenu:Hide()
        LRDLibrary.Animations.FadeOut(contextMenu, 0.2):Play()
        task.wait(0.2)
        contextMenu.Visible = false
    end

    -- Hide on click outside
    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and contextMenu.Visible then
            local mousePos = UserInputService:GetMouseLocation()
            local menuPos = contextMenu.AbsolutePosition
            local menuSize = contextMenu.AbsoluteSize
            
            if mousePos.X < menuPos.X or mousePos.X > menuPos.X + menuSize.X or
               mousePos.Y < menuPos.Y or mousePos.Y > menuPos.Y + menuSize.Y then
                ContextMenu:Hide()
            end
        end
    end)

    return ContextMenu
end

-- Tooltip System
function LRDLibrary:CreateTooltip(parent, text, delay)
    if not LRDLibrary.Config.Tooltips then return end
    
    local tooltip = createFrame({
        Name = "Tooltip",
        Size = UDim2.new(0, 0, 0, 30),
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 1000,
        Parent = createScreenGui("LRD_Tooltip")
    })
    
    addCorner(tooltip, 6)
    addStroke(tooltip, LRDLibrary.Theme.ElementStroke, 1)

    local label = createTextLabel({
        Size = UDim2.new(1, -16, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        Text = text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = tooltip
    })

    -- Calculate text size
    local textBounds = TextService:GetTextSize(text, 12, Enum.Font.Gotham, Vector2.new(math.huge, 30))
    tooltip.Size = UDim2.new(0, textBounds.X + 16, 0, 30)

    local hoverConnection
    local leaveConnection
    local showTimer

    hoverConnection = parent.MouseEnter:Connect(function()
        showTimer = task.delay(delay or 0.5, function()
            local mousePos = UserInputService:GetMouseLocation()
            tooltip.Position = UDim2.new(0, mousePos.X + 10, 0, mousePos.Y - 40)
            tooltip.Visible = true
            
            LRDLibrary.Animations.FadeIn(tooltip, 0.2):Play()
        end)
    end)

    leaveConnection = parent.MouseLeave:Connect(function()
        if showTimer then
            task.cancel(showTimer)
        end
        
        if tooltip.Visible then
            LRDLibrary.Animations.FadeOut(tooltip, 0.2):Play()
            task.wait(0.2)
            tooltip.Visible = false
        end
    end)

    -- Cleanup
    parent.AncestryChanged:Connect(function()
        if not parent.Parent then
            hoverConnection:Disconnect()
            leaveConnection:Disconnect()
            tooltip:Destroy()
        end
    end)

    return tooltip
end

-- Configuration System
local function saveConfig()
    if not LRDLibrary.Config.SaveConfig then return end
    
    local data = {
        Theme = LRDLibrary.Config.Theme,
        Language = LRDLibrary.Config.Language,
        SoundEnabled = LRDLibrary.Config.SoundEnabled,
        BlurBackground = LRDLibrary.Config.BlurBackground,
        Tooltips = LRDLibrary.Config.Tooltips,
        AnimationSpeed = LRDLibrary.Config.AnimationSpeed
    }
    
    -- In a real implementation, you would save this to DataStore
    -- For now, we'll just store it locally
    _G.LRDConfig = data
end

local function loadConfig()
    if not LRDLibrary.Config.SaveConfig then return end
    
    local data = _G.LRDConfig
    if data then
        LRDLibrary.Config.Theme = data.Theme or "Default"
        LRDLibrary.Config.Language = data.Language or "English"
        LRDLibrary.Config.SoundEnabled = data.SoundEnabled ~= false
        LRDLibrary.Config.BlurBackground = data.BlurBackground ~= false
        LRDLibrary.Config.Tooltips = data.Tooltips ~= false
        LRDLibrary.Config.AnimationSpeed = data.AnimationSpeed or 0.3
        
        -- Update theme reference
        LRDLibrary.Theme = LRDLibrary.Themes[LRDLibrary.Config.Theme] or LRDLibrary.Themes.Default
    end
end

-- Theme Manager
function LRDLibrary:SetTheme(themeName)
    if LRDLibrary.Themes[themeName] then
        LRDLibrary.Theme = LRDLibrary.Themes[themeName]
        LRDLibrary.Config.Theme = themeName
        
        if LRDLibrary.Config.AutoSave then
            saveConfig()
        end
        
        -- Trigger theme update event
        if LRDLibrary.OnThemeChanged then
            LRDLibrary.OnThemeChanged(themeName)
        end
        
        return true
    end
    return false
end

function LRDLibrary:AddTheme(name, theme)
    LRDLibrary.Themes[name] = theme
end

-- Main Library Functions
function LRDLibrary:CreateWindow(settings)
    loadConfig()
    
    local Window = {}
    Window.Name = settings.Name or "LRD.dev Interface"
    Window.Tabs = {}
    Window.Settings = settings

    -- Create main GUI
    local screenGui = createScreenGui("LRD_Interface_" .. generateUUID())

    -- Main frame
    local mainFrame = createFrame({
        Name = "MainFrame",
        Size = UDim2.new(0, settings.Size and settings.Size.X or 700, 0, settings.Size and settings.Size.Y or 500),
        Position = UDim2.new(0.5, -(settings.Size and settings.Size.X or 700)/2, 0.5, -(settings.Size and settings.Size.Y or 500)/2),
        BackgroundColor3 = LRDLibrary.Theme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = screenGui
    })

    addCorner(mainFrame, 12)
    addShadow(mainFrame, 30, 0.6)

    -- Topbar
    local topbar = createFrame({
        Name = "Topbar",
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundColor3 = LRDLibrary.Theme.Topbar,
        BorderSizePixel = 0,
        Parent = mainFrame
    })
    addCorner(topbar, 12)

    -- Window icon
    local windowIcon = createImageLabel({
        Size = UDim2.new(0, 24, 0, 24),
        Position = UDim2.new(0, 20, 0.5, -12),
        Image = settings.Icon or LRDLibrary.Icons.Home,
        ImageColor3 = LRDLibrary.Theme.Primary,
        Parent = topbar
    })

    -- Title
    local title = createTextLabel({
        Size = UDim2.new(1, -200, 1, 0),
        Position = UDim2.new(0, 55, 0, 0),
        Text = Window.Name,
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = topbar
    })

    -- Window controls
    local controlsFrame = createFrame({
        Size = UDim2.new(0, 120, 0, 30),
        Position = UDim2.new(1, -140, 0.5, -15),
        BackgroundTransparency = 1,
        Parent = topbar
    })

    -- Minimize button
    local minimizeButton = createTextButton({
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(0, 0, 0, 0),
        Text = "−",
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        Parent = controlsFrame
    })
    addCorner(minimizeButton, 6)

    -- Settings button
    local settingsButton = createTextButton({
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(0, 35, 0, 0),
        Text = "⚙",
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        Parent = controlsFrame
    })
    addCorner(settingsButton, 6)

    -- Close button
    local closeButton = createTextButton({
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(0, 70, 0, 0),
        Text = "×",
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        BackgroundColor3 = LRDLibrary.Theme.Error,
        Parent = controlsFrame
    })
    addCorner(closeButton, 6)

    -- Add hover effects to control buttons
    for _, button in pairs({minimizeButton, settingsButton, closeButton}) do
        button.MouseEnter:Connect(function()
            LRDLibrary.Animations.Scale(button, 1.1, 0.1):Play()
        end)
        
        button.MouseLeave:Connect(function()
            LRDLibrary.Animations.Scale(button, 1, 0.1):Play()
        end)
    end

    -- Tab container
    local tabContainer = createFrame({
        Name = "TabContainer",
        Size = UDim2.new(0, 180, 1, -70),
        Position = UDim2.new(0, 10, 0, 70),
        BackgroundColor3 = LRDLibrary.Theme.SecondaryBackground,
        BorderSizePixel = 0,
        Parent = mainFrame
    })
    addCorner(tabContainer, 10)

    local tabScrollFrame = Instance.new("ScrollingFrame")
    tabScrollFrame.Name = "TabScroll"
    tabScrollFrame.Size = UDim2.new(1, 0, 1, 0)
    tabScrollFrame.BackgroundTransparency = 1
    tabScrollFrame.BorderSizePixel = 0
    tabScrollFrame.ScrollBarThickness = 4
    tabScrollFrame.ScrollBarImageColor3 = LRDLibrary.Theme.Primary
    tabScrollFrame.Parent = tabContainer

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 8)
    tabLayout.Parent = tabScrollFrame

    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingTop = UDim.new(0, 15)
    tabPadding.PaddingLeft = UDim.new(0, 15)
    tabPadding.PaddingRight = UDim.new(0, 15)
    tabPadding.Parent = tabScrollFrame

    -- Content container
    local contentContainer = createFrame({
        Name = "ContentContainer",
        Size = UDim2.new(1, -210, 1, -70),
        Position = UDim2.new(0, 200, 0, 70),
        BackgroundTransparency = 1,
        Parent = mainFrame
    })

    -- Make window draggable
    local dragging = false
    local dragStart = nil
    local startPos = nil

    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            
            playSound(LRDLibrary.Sounds.Click)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X, 
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- Window control functionality
    local minimized = false
    local originalSize = mainFrame.Size

    minimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        
        if minimized then
            tween(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 60)
            })
            minimizeButton.Text = "□"
        else
            tween(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = originalSize
            })
            minimizeButton.Text = "−"
        end
        
        playSound(LRDLibrary.Sounds.Click)
    end)

    closeButton.MouseButton1Click:Connect(function()
        playSound(LRDLibrary.Sounds.Click)
        
        LRDLibrary.Animations.FadeOut(mainFrame, 0.3):Play()
        task.wait(0.3)
        screenGui:Destroy()
    end)

    -- Tab management
    local currentTab = nil
    local tabCount = 0

    function Window:CreateTab(settings)
        local Tab = {}
        local tabName = settings.Name or ("Tab " .. (tabCount + 1))
        tabCount = tabCount + 1

        Tab.Name = tabName
        Tab.Elements = {}
        Tab.Visible = false

        -- Tab button
        local tabButton = createTextButton({
            Name = tabName,
            Size = UDim2.new(1, 0, 0, 45),
            BackgroundColor3 = LRDLibrary.Theme.TabBackground,
            Text = "",
            LayoutOrder = tabCount,
            Parent = tabScrollFrame
        })
        addCorner(tabButton, 8)
        addRipple(tabButton)

        -- Tab icon
        if settings.Icon then
            local tabIcon = createImageLabel({
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(0, 15, 0.5, -10),
                Image = settings.Icon,
                ImageColor3 = LRDLibrary.Theme.SecondaryTextColor,
                Parent = tabButton
            })
            Tab.Icon = tabIcon
        end

        -- Tab label
        local tabLabel = createTextLabel({
            Size = UDim2.new(1, settings.Icon and -45 or -20, 1, 0),
            Position = UDim2.new(0, settings.Icon and 45 or 20, 0, 0),
            Text = tabName,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
            Parent = tabButton
        })

        -- Tab content
        local tabContent = Instance.new("ScrollingFrame")
        tabContent.Name = tabName .. "_Content"
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.BackgroundTransparency = 1
        tabContent.BorderSizePixel = 0
        tabContent.ScrollBarThickness = 6
        tabContent.ScrollBarImageColor3 = LRDLibrary.Theme.Primary
        tabContent.Visible = false
        tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContent.Parent = contentContainer

        local contentLayout = Instance.new("UIListLayout")
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 12)
        contentLayout.Parent = tabContent

        local contentPadding = Instance.new("UIPadding")
        contentPadding.PaddingTop = UDim.new(0, 15)
        contentPadding.PaddingLeft = UDim.new(0, 15)
        contentPadding.PaddingRight = UDim.new(0, 15)
        contentPadding.PaddingBottom = UDim.new(0, 15)
        contentPadding.Parent = tabContent

        -- Auto-resize content
        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 30)
        end)

        -- Tab selection
        tabButton.MouseButton1Click:Connect(function()
            if currentTab then
                currentTab.content.Visible = false
                currentTab.button.BackgroundColor3 = LRDLibrary.Theme.TabBackground
                currentTab.label.TextColor3 = LRDLibrary.Theme.SecondaryTextColor
                if currentTab.icon then
                    currentTab.icon.ImageColor3 = LRDLibrary.Theme.SecondaryTextColor
                end
            end

            currentTab = {
                content = tabContent,
                button = tabButton,
                label = tabLabel,
                icon = Tab.Icon
            }
            
            tabContent.Visible = true
            tabButton.BackgroundColor3 = LRDLibrary.Theme.TabBackgroundSelected
            tabLabel.TextColor3 = LRDLibrary.Theme.TextColor
            if Tab.Icon then
                Tab.Icon.ImageColor3 = LRDLibrary.Theme.TextColor
            end
            
            playSound(LRDLibrary.Sounds.Tab)
        end)

        -- Auto-select first tab
        if not currentTab then
            task.wait()
            tabButton.MouseButton1Click()
        end

        -- Add tooltip
        if settings.Tooltip then
            LRDLibrary:CreateTooltip(tabButton, settings.Tooltip)
        end

        Window.Tabs[tabName] = Tab

        -- Tab functions
        function Tab:CreateSection(settings)
            local sectionName = settings.Name or "Section"
            local elementCount = #Tab.Elements + 1

            local sectionFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 50),
                BackgroundTransparency = 1,
                LayoutOrder = elementCount,
                Parent = tabContent
            })

            local sectionLabel = createTextLabel({
                Size = UDim2.new(1, 0, 0, 30),
                Position = UDim2.new(0, 0, 0, 0),
                Text = sectionName,
                TextSize = 16,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = LRDLibrary.Theme.Primary,
                Parent = sectionFrame
            })

            local sectionLine = createFrame({
                Size = UDim2.new(1, 0, 0, 2),
                Position = UDim2.new(0, 0, 0, 35),
                BackgroundColor3 = LRDLibrary.Theme.Primary,
                BorderSizePixel = 0,
                Parent = sectionFrame
            })
            addCorner(sectionLine, 1)

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, 0, 0, 15),
                    Position = UDim2.new(0, 0, 0, 32),
                    Text = settings.Description,
                    TextSize = 12,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = sectionFrame
                })
                
                sectionFrame.Size = UDim2.new(1, 0, 0, 65)
            end

            table.insert(Tab.Elements, {Type = "Section", Element = sectionFrame, Name = sectionName})
            return sectionFrame
        end

        function Tab:CreateButton(settings)
            local elementCount = #Tab.Elements + 1
            local buttonName = settings.Name or "Button"

            local buttonFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 45),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(buttonFrame, 8)
            addStroke(buttonFrame, LRDLibrary.Theme.ElementStroke, 1)
            addRipple(buttonFrame)

            local button = createTextButton({
                Size = UDim2.new(1, 0, 1, 0),
                Text = buttonName,
                TextSize = 14,
                Font = Enum.Font.Gotham,
                Parent = buttonFrame
            })

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -20, 0, 15),
                    Position = UDim2.new(0, 10, 0, 25),
                    Text = settings.Description,
                    TextSize = 11,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = buttonFrame
                })
                
                button.Size = UDim2.new(1, 0, 0, 20)
                button.Position = UDim2.new(0, 0, 0, 5)
                buttonFrame.Size = UDim2.new(1, 0, 0, 55)
            end

            -- Hover effects
            button.MouseEnter:Connect(function()
                tween(buttonFrame, TweenInfo.new(0.2), {
                    BackgroundColor3 = LRDLibrary.Theme.ElementBackgroundHover
                })
                playSound(LRDLibrary.Sounds.Hover)
            end)

            button.MouseLeave:Connect(function()
                tween(buttonFrame, TweenInfo.new(0.2), {
                    BackgroundColor3 = LRDLibrary.Theme.ElementBackground
                })
            end)

            button.MouseButton1Click:Connect(function()
                LRDLibrary.Animations.Bounce(buttonFrame, 0.1)
                playSound(LRDLibrary.Sounds.Click)
                
                if settings.Callback then
                    local success, error = pcall(settings.Callback)
                    if not success and LRDLibrary.Config.DebugMode then
                        LRDLibrary:Notify({
                            Title = "Error",
                            Content = "Button callback failed: " .. tostring(error),
                            Type = "Error",
                            Duration = 3
                        })
                    end
                end
            end)

            if settings.Tooltip then
                LRDLibrary:CreateTooltip(buttonFrame, settings.Tooltip)
            end

            local ButtonAPI = {}
            
            function ButtonAPI:SetText(text)
                button.Text = text
            end
            
            function ButtonAPI:SetCallback(callback)
                settings.Callback = callback
            end

            table.insert(Tab.Elements, {Type = "Button", Element = buttonFrame, Name = buttonName, API = ButtonAPI})
            return ButtonAPI
        end

        function Tab:CreateToggle(settings)
            local elementCount = #Tab.Elements + 1
            local toggleName = settings.Name or "Toggle"
            local currentValue = settings.CurrentValue or false

            local toggleFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 45),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(toggleFrame, 8)
            addStroke(toggleFrame, LRDLibrary.Theme.ElementStroke, 1)

            local label = createTextLabel({
                Size = UDim2.new(1, -70, 1, 0),
                Position = UDim2.new(0, 15, 0, 0),
                Text = toggleName,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = toggleFrame
            })

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -70, 0, 15),
                    Position = UDim2.new(0, 15, 0, 25),
                    Text = settings.Description,
                    TextSize = 11,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = toggleFrame
                })
                
                label.Size = UDim2.new(1, -70, 0, 20)
                label.Position = UDim2.new(0, 15, 0, 5)
                toggleFrame.Size = UDim2.new(1, 0, 0, 55)
            end

            local toggleBackground = createFrame({
                Size = UDim2.new(0, 50, 0, 25),
                Position = UDim2.new(1, -65, 0.5, -12.5),
                BackgroundColor3 = currentValue and LRDLibrary.Theme.ToggleEnabled or LRDLibrary.Theme.ToggleDisabled,
                BorderSizePixel = 0,
                Parent = toggleFrame
            })
            addCorner(toggleBackground, 12.5)

            local toggleIndicator = createFrame({
                Size = UDim2.new(0, 20, 0, 20),
                Position = currentValue and UDim2.new(1, -22.5, 0.5, -10) or UDim2.new(0, 2.5, 0.5, -10),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Parent = toggleBackground
            })
            addCorner(toggleIndicator, 10)
            addShadow(toggleIndicator, 4, 0.3)

            local button = createTextButton({
                Size = UDim2.new(1, 0, 1, 0),
                Text = "",
                BackgroundTransparency = 1,
                Parent = toggleFrame
            })

            button.MouseButton1Click:Connect(function()
                currentValue = not currentValue

                local newToggleColor = currentValue and LRDLibrary.Theme.ToggleEnabled or LRDLibrary.Theme.ToggleDisabled
                local newPosition = currentValue and UDim2.new(1, -22.5, 0.5, -10) or UDim2.new(0, 2.5, 0.5, -10)

                tween(toggleBackground, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {BackgroundColor3 = newToggleColor})
                tween(toggleIndicator, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = newPosition})

                playSound(LRDLibrary.Sounds.Toggle)

                if settings.Callback then
                    local success, error = pcall(settings.Callback, currentValue)
                    if not success and LRDLibrary.Config.DebugMode then
                        LRDLibrary:Notify({
                            Title = "Error",
                            Content = "Toggle callback failed: " .. tostring(error),
                            Type = "Error",
                            Duration = 3
                        })
                    end
                end
            end)

            if settings.Tooltip then
                LRDLibrary:CreateTooltip(toggleFrame, settings.Tooltip)
            end

            local ToggleAPI = {}
            
            function ToggleAPI:Set(value)
                currentValue = value
                local newToggleColor = currentValue and LRDLibrary.Theme.ToggleEnabled or LRDLibrary.Theme.ToggleDisabled
                local newPosition = currentValue and UDim2.new(1, -22.5, 0.5, -10) or UDim2.new(0, 2.5, 0.5, -10)

                tween(toggleBackground, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {BackgroundColor3 = newToggleColor})
                tween(toggleIndicator, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = newPosition})
            end
            
            function ToggleAPI:Get()
                return currentValue
            end

            table.insert(Tab.Elements, {Type = "Toggle", Element = toggleFrame, Name = toggleName, API = ToggleAPI})
            return ToggleAPI
        end

        function Tab:CreateSlider(settings)
            local elementCount = #Tab.Elements + 1
            local sliderName = settings.Name or "Slider"
            local min = settings.Min or 0
            local max = settings.Max or 100
            local currentValue = settings.CurrentValue or min
            local increment = settings.Increment or 1

            local sliderFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 70),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(sliderFrame, 8)
            addStroke(sliderFrame, LRDLibrary.Theme.ElementStroke, 1)

            local label = createTextLabel({
                Size = UDim2.new(1, -80, 0, 25),
                Position = UDim2.new(0, 15, 0, 10),
                Text = sliderName,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = sliderFrame
            })

            local valueLabel = createTextLabel({
                Size = UDim2.new(0, 60, 0, 25),
                Position = UDim2.new(1, -75, 0, 10),
                Text = tostring(currentValue),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextColor3 = LRDLibrary.Theme.Primary,
                Font = Enum.Font.GothamBold,
                Parent = sliderFrame
            })

            local sliderTrack = createFrame({
                Size = UDim2.new(1, -30, 0, 8),
                Position = UDim2.new(0, 15, 0, 45),
                BackgroundColor3 = LRDLibrary.Theme.SliderBackground,
                BorderSizePixel = 0,
                Parent = sliderFrame
            })
            addCorner(sliderTrack, 4)

            local sliderFill = createFrame({
                Size = UDim2.new(0, 0, 1, 0),
                BackgroundColor3 = LRDLibrary.Theme.SliderProgress,
                BorderSizePixel = 0,
                Parent = sliderTrack
            })
            addCorner(sliderFill, 4)

            local sliderHandle = createFrame({
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, -8, 0.5, -8),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Parent = sliderFill
            })
            addCorner(sliderHandle, 8)
            addShadow(sliderHandle, 6, 0.4)

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -15, 0, 12),
                    Position = UDim2.new(0, 15, 0, 58),
                    Text = settings.Description,
                    TextSize = 10,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = sliderFrame
                })
                
                sliderFrame.Size = UDim2.new(1, 0, 0, 85)
            end

            -- Slider logic
            local dragging = false

            local function updateSlider(value)
                currentValue = math.clamp(round(value / increment) * increment, min, max)
                local percentage = (currentValue - min) / (max - min)
                
                tween(sliderFill, TweenInfo.new(0.1), {Size = UDim2.new(percentage, 0, 1, 0)})
                valueLabel.Text = settings.Suffix and (tostring(currentValue) .. settings.Suffix) or tostring(currentValue)

                if settings.Callback then
                    local success, error = pcall(settings.Callback, currentValue)
                    if not success and LRDLibrary.Config.DebugMode then
                        LRDLibrary:Notify({
                            Title = "Error",
                            Content = "Slider callback failed: " .. tostring(error),
                            Type = "Error",
                            Duration = 3
                        })
                    end
                end
            end

            updateSlider(currentValue)

            sliderTrack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    playSound(LRDLibrary.Sounds.Slider)
                    
                    LRDLibrary.Animations.Scale(sliderHandle, 1.2, 0.1):Play()
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
                    dragging = false
                    LRDLibrary.Animations.Scale(sliderHandle, 1, 0.1):Play()
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local mouseX = input.Position.X
                    local trackX = sliderTrack.AbsolutePosition.X
                    local trackWidth = sliderTrack.AbsoluteSize.X
                    local percentage = math.clamp((mouseX - trackX) / trackWidth, 0, 1)
                    local value = min + (percentage * (max - min))
                    updateSlider(value)
                end
            end)

            if settings.Tooltip then
                LRDLibrary:CreateTooltip(sliderFrame, settings.Tooltip)
            end

            local SliderAPI = {}
            
            function SliderAPI:Set(value)
                updateSlider(value)
            end
            
            function SliderAPI:Get()
                return currentValue
            end

            table.insert(Tab.Elements, {Type = "Slider", Element = sliderFrame, Name = sliderName, API = SliderAPI})
            return SliderAPI
        end

        function Tab:CreateDropdown(settings)
            local elementCount = #Tab.Elements + 1
            local dropdownName = settings.Name or "Dropdown"
            local options = settings.Options or {"Option 1", "Option 2", "Option 3"}
            local currentValue = settings.CurrentValue or options[1]

            local dropdownFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 45),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(dropdownFrame, 8)
            addStroke(dropdownFrame, LRDLibrary.Theme.ElementStroke, 1)

            local label = createTextLabel({
                Size = UDim2.new(1, -120, 0, 25),
                Position = UDim2.new(0, 15, 0, 10),
                Text = dropdownName,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = dropdownFrame
            })

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -120, 0, 15),
                    Position = UDim2.new(0, 15, 0, 25),
                    Text = settings.Description,
                    TextSize = 11,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = dropdownFrame
                })
                
                label.Size = UDim2.new(1, -120, 0, 20)
                label.Position = UDim2.new(0, 15, 0, 5)
                dropdownFrame.Size = UDim2.new(1, 0, 0, 55)
            end

            local dropdownButton = createTextButton({
                Size = UDim2.new(0, 100, 0, 25),
                Position = UDim2.new(1, -115, 0, 10),
                BackgroundColor3 = LRDLibrary.Theme.SecondaryBackground,
                Text = currentValue,
                TextSize = 12,
                Parent = dropdownFrame
            })
            addCorner(dropdownButton, 6)
            addStroke(dropdownButton, LRDLibrary.Theme.ElementStroke, 1)

            local dropdownArrow = createTextLabel({
                Size = UDim2.new(0, 20, 1, 0),
                Position = UDim2.new(1, -20, 0, 0),
                Text = "▼",
                TextSize = 10,
                TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                Parent = dropdownButton
            })

            local dropdownList = createFrame({
                Size = UDim2.new(0, 100, 0, math.min(#options * 25, 150)),
                Position = UDim2.new(1, -115, 0, 35),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                Visible = false,
                ZIndex = dropdownFrame.ZIndex + 10,
                Parent = dropdownFrame
            })
            addCorner(dropdownList, 6)
            addStroke(dropdownList, LRDLibrary.Theme.ElementStroke, 1)
            addShadow(dropdownList, 8, 0.5)

            local listScrollFrame = Instance.new("ScrollingFrame")
            listScrollFrame.Size = UDim2.new(1, 0, 1, 0)
            listScrollFrame.BackgroundTransparency = 1
            listScrollFrame.BorderSizePixel = 0
            listScrollFrame.ScrollBarThickness = 4
            listScrollFrame.ScrollBarImageColor3 = LRDLibrary.Theme.Primary
            listScrollFrame.CanvasSize = UDim2.new(0, 0, 0, #options * 25)
            listScrollFrame.Parent = dropdownList

            local listLayout = Instance.new("UIListLayout")
            listLayout.SortOrder = Enum.SortOrder.LayoutOrder
            listLayout.Parent = listScrollFrame

            for i, option in ipairs(options) do
                local optionButton = createTextButton({
                    Size = UDim2.new(1, 0, 0, 25),
                    BackgroundColor3 = option == currentValue and LRDLibrary.Theme.Primary or Color3.fromRGB(0, 0, 0),
                    BackgroundTransparency = option == currentValue and 0.2 or 1,
                    Text = "  " .. option,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    LayoutOrder = i,
                    Parent = listScrollFrame
                })

                optionButton.MouseEnter:Connect(function()
                    if option ~= currentValue then
                        optionButton.BackgroundTransparency = 0.5
                        optionButton.BackgroundColor3 = LRDLibrary.Theme.ElementBackgroundHover
                    end
                end)

                optionButton.MouseLeave:Connect(function()
                    if option ~= currentValue then
                        optionButton.BackgroundTransparency = 1
                    end
                end)

                optionButton.MouseButton1Click:Connect(function()
                    currentValue = option
                    dropdownButton.Text = currentValue
                    dropdownList.Visible = false
                    dropdownArrow.Text = "▼"

                    -- Update option appearances
                    for _, child in pairs(listScrollFrame:GetChildren()) do
                        if child:IsA("TextButton") then
                            if child.Text:sub(3) == currentValue then
                                child.BackgroundTransparency = 0.2
                                child.BackgroundColor3 = LRDLibrary.Theme.Primary
                            else
                                child.BackgroundTransparency = 1
                            end
                        end
                    end

                    playSound(LRDLibrary.Sounds.Click)

                    if settings.Callback then
                        local success, error = pcall(settings.Callback, currentValue)
                        if not success and LRDLibrary.Config.DebugMode then
                            LRDLibrary:Notify({
                                Title = "Error",
                                Content = "Dropdown callback failed: " .. tostring(error),
                                Type = "Error",
                                Duration = 3
                            })
                        end
                    end
                end)
            end

            dropdownButton.MouseButton1Click:Connect(function()
                dropdownList.Visible = not dropdownList.Visible
                dropdownArrow.Text = dropdownList.Visible and "▲" or "▼"
                
                if dropdownList.Visible then
                    LRDLibrary.Animations.FadeIn(dropdownList, 0.2):Play()
                else
                    LRDLibrary.Animations.FadeOut(dropdownList, 0.2):Play()
                end
                
                playSound(LRDLibrary.Sounds.Click)
            end)

            -- Hide dropdown when clicking outside
            UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and dropdownList.Visible then
                    local mousePos = UserInputService:GetMouseLocation()
                    local listPos = dropdownList.AbsolutePosition
                    local listSize = dropdownList.AbsoluteSize
                    local buttonPos = dropdownButton.AbsolutePosition
                    local buttonSize = dropdownButton.AbsoluteSize
                    
                    if (mousePos.X < listPos.X or mousePos.X > listPos.X + listSize.X or
                        mousePos.Y < listPos.Y or mousePos.Y > listPos.Y + listSize.Y) and
                       (mousePos.X < buttonPos.X or mousePos.X > buttonPos.X + buttonSize.X or
                        mousePos.Y < buttonPos.Y or mousePos.Y > buttonPos.Y + buttonSize.Y) then
                        dropdownList.Visible = false
                        dropdownArrow.Text = "▼"
                    end
                end
            end)

            if settings.Tooltip then
                LRDLibrary:CreateTooltip(dropdownFrame, settings.Tooltip)
            end

            local DropdownAPI = {}
            
            function DropdownAPI:Set(value)
                if table.find(options, value) then
                    currentValue = value
                    dropdownButton.Text = currentValue
                    
                    -- Update option appearances
                    for _, child in pairs(listScrollFrame:GetChildren()) do
                        if child:IsA("TextButton") then
                            if child.Text:sub(3) == currentValue then
                                child.BackgroundTransparency = 0.2
                                child.BackgroundColor3 = LRDLibrary.Theme.Primary
                            else
                                child.BackgroundTransparency = 1
                            end
                        end
                    end
                end
            end
            
            function DropdownAPI:Get()
                return currentValue
            end
            
            function DropdownAPI:SetOptions(newOptions)
                options = newOptions
                
                -- Clear existing options
                for _, child in pairs(listScrollFrame:GetChildren()) do
                    if child:IsA("TextButton") then
                        child:Destroy()
                    end
                end
                
                -- Add new options
                for i, option in ipairs(options) do
                    local optionButton = createTextButton({
                        Size = UDim2.new(1, 0, 0, 25),
                        BackgroundColor3 = option == currentValue and LRDLibrary.Theme.Primary or Color3.fromRGB(0, 0, 0),
                        BackgroundTransparency = option == currentValue and 0.2 or 1,
                        Text = "  " .. option,
                        TextSize = 12,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        LayoutOrder = i,
                        Parent = listScrollFrame
                    })
                    
                    -- Add event handlers for new option
                    optionButton.MouseButton1Click:Connect(function()
                        currentValue = option
                        dropdownButton.Text = currentValue
                        dropdownList.Visible = false
                        dropdownArrow.Text = "▼"
                        
                        if settings.Callback then
                            settings.Callback(currentValue)
                        end
                    end)
                end
                
                -- Update list size
                dropdownList.Size = UDim2.new(0, 100, 0, math.min(#options * 25, 150))
                listScrollFrame.CanvasSize = UDim2.new(0, 0, 0, #options * 25)
            end

            table.insert(Tab.Elements, {Type = "Dropdown", Element = dropdownFrame, Name = dropdownName, API = DropdownAPI})
            return DropdownAPI
        end

        function Tab:CreateTextBox(settings)
            local elementCount = #Tab.Elements + 1
            local textBoxName = settings.Name or "TextBox"
            local currentValue = settings.CurrentValue or ""

            local textBoxFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 45),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(textBoxFrame, 8)
            addStroke(textBoxFrame, LRDLibrary.Theme.ElementStroke, 1)

            local label = createTextLabel({
                Size = UDim2.new(1, -120, 0, 25),
                Position = UDim2.new(0, 15, 0, 10),
                Text = textBoxName,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = textBoxFrame
            })

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -120, 0, 15),
                    Position = UDim2.new(0, 15, 0, 25),
                    Text = settings.Description,
                    TextSize = 11,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = textBoxFrame
                })
                
                label.Size = UDim2.new(1, -120, 0, 20)
                label.Position = UDim2.new(0, 15, 0, 5)
                textBoxFrame.Size = UDim2.new(1, 0, 0, 55)
            end

            local textBox = createTextBox({
                Size = UDim2.new(0, 100, 0, 25),
                Position = UDim2.new(1, -115, 0, 10),
                BackgroundColor3 = LRDLibrary.Theme.SecondaryBackground,
                Text = currentValue,
                PlaceholderText = settings.PlaceholderText or "Enter text...",
                TextSize = 12,
                Parent = textBoxFrame
            })
            addCorner(textBox, 6)
            addStroke(textBox, LRDLibrary.Theme.ElementStroke, 1)

            local focused = false

            textBox.Focused:Connect(function()
                focused = true
                tween(textBox, TweenInfo.new(0.2), {
                    BackgroundColor3 = LRDLibrary.Theme.ElementBackgroundActive
                })
                playSound(LRDLibrary.Sounds.Click)
            end)

            textBox.FocusLost:Connect(function(enterPressed)
                focused = false
                currentValue = textBox.Text
                
                tween(textBox, TweenInfo.new(0.2), {
                    BackgroundColor3 = LRDLibrary.Theme.SecondaryBackground
                })

                if settings.Callback then
                    local success, error = pcall(settings.Callback, currentValue, enterPressed)
                    if not success and LRDLibrary.Config.DebugMode then
                        LRDLibrary:Notify({
                            Title = "Error",
                            Content = "TextBox callback failed: " .. tostring(error),
                            Type = "Error",
                            Duration = 3
                        })
                    end
                end
            end)

            if settings.Tooltip then
                LRDLibrary:CreateTooltip(textBoxFrame, settings.Tooltip)
            end

            local TextBoxAPI = {}
            
            function TextBoxAPI:Set(value)
                currentValue = value
                textBox.Text = value
            end
            
            function TextBoxAPI:Get()
                return currentValue
            end

            table.insert(Tab.Elements, {Type = "TextBox", Element = textBoxFrame, Name = textBoxName, API = TextBoxAPI})
            return TextBoxAPI
        end

        function Tab:CreateColorPicker(settings)
            local elementCount = #Tab.Elements + 1
            local colorPickerName = settings.Name or "Color Picker"
            local currentColor = settings.CurrentColor or Color3.fromRGB(255, 255, 255)

            local colorPickerFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 45),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(colorPickerFrame, 8)
            addStroke(colorPickerFrame, LRDLibrary.Theme.ElementStroke, 1)

            local label = createTextLabel({
                Size = UDim2.new(1, -70, 0, 25),
                Position = UDim2.new(0, 15, 0, 10),
                Text = colorPickerName,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = colorPickerFrame
            })

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -70, 0, 15),
                    Position = UDim2.new(0, 15, 0, 25),
                    Text = settings.Description,
                    TextSize = 11,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = colorPickerFrame
                })
                
                label.Size = UDim2.new(1, -70, 0, 20)
                label.Position = UDim2.new(0, 15, 0, 5)
                colorPickerFrame.Size = UDim2.new(1, 0, 0, 55)
            end

            local colorDisplay = createFrame({
                Size = UDim2.new(0, 50, 0, 25),
                Position = UDim2.new(1, -65, 0, 10),
                BackgroundColor3 = currentColor,
                BorderSizePixel = 0,
                Parent = colorPickerFrame
            })
            addCorner(colorDisplay, 6)
            addStroke(colorDisplay, LRDLibrary.Theme.ElementStroke, 1)

            local colorButton = createTextButton({
                Size = UDim2.new(1, 0, 1, 0),
                Text = "",
                BackgroundTransparency = 1,
                Parent = colorDisplay
            })

            -- Color picker window
            local colorPickerWindow = createFrame({
                Size = UDim2.new(0, 300, 0, 350),
                Position = UDim2.new(0.5, -150, 0.5, -175),
                BackgroundColor3 = LRDLibrary.Theme.Background,
                BorderSizePixel = 0,
                Visible = false,
                ZIndex = 1000,
                Parent = createScreenGui("LRD_ColorPicker")
            })
            addCorner(colorPickerWindow, 12)
            addShadow(colorPickerWindow, 20, 0.7)

            -- Color picker controls would go here (HSV selector, RGB inputs, etc.)
            -- This is a simplified version

            local hue = 0
            local saturation = 1
            local value = 1

            local function updateColor()
                currentColor = Color3.fromHSV(hue, saturation, value)
                colorDisplay.BackgroundColor3 = currentColor
                
                if settings.Callback then
                    local success, error = pcall(settings.Callback, currentColor)
                    if not success and LRDLibrary.Config.DebugMode then
                        LRDLibrary:Notify({
                            Title = "Error",
                            Content = "Color picker callback failed: " .. tostring(error),
                            Type = "Error",
                            Duration = 3
                        })
                    end
                end
            end

            colorButton.MouseButton1Click:Connect(function()
                colorPickerWindow.Visible = not colorPickerWindow.Visible
                
                if colorPickerWindow.Visible then
                    LRDLibrary.Animations.FadeIn(colorPickerWindow, 0.3):Play()
                else
                    LRDLibrary.Animations.FadeOut(colorPickerWindow, 0.3):Play()
                end
                
                playSound(LRDLibrary.Sounds.Click)
            end)

            if settings.Tooltip then
                LRDLibrary:CreateTooltip(colorPickerFrame, settings.Tooltip)
            end

            local ColorPickerAPI = {}
            
            function ColorPickerAPI:Set(color)
                currentColor = color
                colorDisplay.BackgroundColor3 = color
                
                -- Convert to HSV
                local h, s, v = Color3.toHSV(color)
                hue = h
                saturation = s
                value = v
            end
            
            function ColorPickerAPI:Get()
                return currentColor
            end

            table.insert(Tab.Elements, {Type = "ColorPicker", Element = colorPickerFrame, Name = colorPickerName, API = ColorPickerAPI})
            return ColorPickerAPI
        end

        function Tab:CreateKeybind(settings)
            local elementCount = #Tab.Elements + 1
            local keybindName = settings.Name or "Keybind"
            local currentKey = settings.CurrentKey or Enum.KeyCode.Unknown

            local keybindFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 45),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(keybindFrame, 8)
            addStroke(keybindFrame, LRDLibrary.Theme.ElementStroke, 1)

            local label = createTextLabel({
                Size = UDim2.new(1, -120, 0, 25),
                Position = UDim2.new(0, 15, 0, 10),
                Text = keybindName,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = keybindFrame
            })

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -120, 0, 15),
                    Position = UDim2.new(0, 15, 0, 25),
                    Text = settings.Description,
                    TextSize = 11,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = keybindFrame
                })
                
                label.Size = UDim2.new(1, -120, 0, 20)
                label.Position = UDim2.new(0, 15, 0, 5)
                keybindFrame.Size = UDim2.new(1, 0, 0, 55)
            end

            local keybindButton = createTextButton({
                Size = UDim2.new(0, 100, 0, 25),
                Position = UDim2.new(1, -115, 0, 10),
                BackgroundColor3 = LRDLibrary.Theme.SecondaryBackground,
                Text = currentKey.Name,
                TextSize = 12,
                Parent = keybindFrame
            })
            addCorner(keybindButton, 6)
            addStroke(keybindButton, LRDLibrary.Theme.ElementStroke, 1)

            local listening = false

            keybindButton.MouseButton1Click:Connect(function()
                if not listening then
                    listening = true
                    keybindButton.Text = "Press a key..."
                    keybindButton.BackgroundColor3 = LRDLibrary.Theme.Primary
                    
                    playSound(LRDLibrary.Sounds.Click)
                end
            end)

            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                    currentKey = input.KeyCode
                    keybindButton.Text = currentKey.Name
                    keybindButton.BackgroundColor3 = LRDLibrary.Theme.SecondaryBackground
                    listening = false
                    
                    playSound(LRDLibrary.Sounds.Click)
                end
            end)

            -- Handle keybind activation
            if LRDLibrary.Config.Keybinds then
                UserInputService.InputBegan:Connect(function(input, gameProcessed)
                    if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == currentKey and not listening then
                        if settings.Callback then
                            local success, error = pcall(settings.Callback)
                            if not success and LRDLibrary.Config.DebugMode then
                                LRDLibrary:Notify({
                                    Title = "Error",
                                    Content = "Keybind callback failed: " .. tostring(error),
                                    Type = "Error",
                                    Duration = 3
                                })
                            end
                        end
                    end
                end)
            end

            if settings.Tooltip then
                LRDLibrary:CreateTooltip(keybindFrame, settings.Tooltip)
            end

            local KeybindAPI = {}
            
            function KeybindAPI:Set(keyCode)
                currentKey = keyCode
                keybindButton.Text = keyCode.Name
            end
            
            function KeybindAPI:Get()
                return currentKey
            end

            table.insert(Tab.Elements, {Type = "Keybind", Element = keybindFrame, Name = keybindName, API = KeybindAPI})
            return KeybindAPI
        end

        return Tab
    end

    -- Loading screen with enhanced animation
    local loadingFrame = createFrame({
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = LRDLibrary.Theme.Background,
        BorderSizePixel = 0,
        Parent = mainFrame
    })
    addCorner(loadingFrame, 12)

    local loadingText = createTextLabel({
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0.5, -40),
        Text = settings.LoadingTitle or "Loading LRD.dev Interface...",
        TextSize = 20,
        Font = Enum.Font.GothamBold,
        Parent = loadingFrame
    })

    local loadingSubtitle = createTextLabel({
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0.5, -10),
        Text = settings.LoadingSubtitle or "Please wait...",
        TextSize = 14,
        TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
        Parent = loadingFrame
    })

    local loadingBar = createFrame({
        Size = UDim2.new(0, 200, 0, 4),
        Position = UDim2.new(0.5, -100, 0.5, 20),
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BorderSizePixel = 0,
        Parent = loadingFrame
    })
    addCorner(loadingBar, 2)

    local loadingProgress = createFrame({
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = LRDLibrary.Theme.Primary,
        BorderSizePixel = 0,
        Parent = loadingBar
    })
    addCorner(loadingProgress, 2)

    -- Animate loading progress
    local progressTween = tween(loadingProgress, TweenInfo.new(2, Enum.EasingStyle.Quad), {
        Size = UDim2.new(1, 0, 1, 0)
    })

    progressTween.Completed:Connect(function()
        task.wait(0.5)
        
        LRDLibrary.Animations.FadeOut(loadingFrame, 0.5):Play()
        task.wait(0.5)
        loadingFrame:Destroy()
        
        -- Show welcome notification
        if settings.WelcomeMessage ~= false then
            LRDLibrary:Notify({
                Title = "Welcome!",
                Content = "Welcome to " .. Window.Name .. "!",
                Type = "Success",
                Duration = 3
            })
        end
    end)

    -- Window API
    function Window:SetTitle(title)
        Window.Name = title
        title.Text = title
    end

    function Window:SetSize(size)
        mainFrame.Size = size
    end

    function Window:SetPosition(position)
        mainFrame.Position = position
    end

    function Window:Destroy()
        screenGui:Destroy()
    end

    function Window:Hide()
        screenGui.Enabled = false
    end

    function Window:Show()
        screenGui.Enabled = true
    end

    function Window:ToggleVisibility()
        screenGui.Enabled = not screenGui.Enabled
    end

    return Window
end

-- Initialize the library
loadConfig()

-- Example usage demonstration
if game.Players.LocalPlayer.Name == "TestUser" or true then -- Set to your username for testing
    local ExampleWindow = LRDLibrary:CreateWindow({
        Name = "LRD.dev Example Suite",
        LoadingTitle = "LRD.dev Interface",
        LoadingSubtitle = "Loading premium features...",
        Size = {X = 800, Y = 600}
    })

    -- Player Controls Tab
    local PlayerTab = ExampleWindow:CreateTab({
        Name = "Player",
        Icon = LRDLibrary.Icons.User,
        Tooltip = "Player movement and character controls"
    })

    PlayerTab:CreateSection({
        Name = "Movement Controls",
        Description = "Modify your character's movement properties"
    })

    local walkSpeedSlider = PlayerTab:CreateSlider({
        Name = "Walk Speed",
        Description = "Adjust your character's walking speed",
        Min = 0,
        Max = 100,
        CurrentValue = 16,
        Increment = 1,
        Suffix = " studs/s",
        Tooltip = "Default: 16 studs/s",
        Callback = function(value)
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
            end
        end
    })

    local jumpPowerSlider = PlayerTab:CreateSlider({
        Name = "Jump Power",
        Description = "Control how high your character can jump",
        Min = 0,
        Max = 200,
        CurrentValue = 50,
        Increment = 5,
        Suffix = " power",
        Tooltip = "Default: 50 power",
        Callback = function(value)
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
            end
        end
    })

    PlayerTab:CreateSection({
        Name = "Character Actions"
    })

    PlayerTab:CreateButton({
        Name = "Reset Character",
        Description = "Respawn your character",
        Tooltip = "This will kill and respawn your character",
        Callback = function()
            if game.Players.LocalPlayer.Character then
                game.Players.LocalPlayer.Character:BreakJoints()
                LRDLibrary:Notify({
                    Title = "Character Reset",
                    Content = "Your character has been reset successfully!",
                    Type = "Success",
                    Duration = 3
                })
            end
        end
    })

    -- Visual Tab
    local VisualTab = ExampleWindow:CreateTab({
        Name = "Visual",
        Icon = LRDLibrary.Icons.Eye,
        Tooltip = "Lighting and visual effects"
    })

    VisualTab:CreateSection({
        Name = "Lighting Controls",
        Description = "Modify the game's lighting and atmosphere"
    })

    local fullBrightToggle = VisualTab:CreateToggle({
        Name = "Full Brightness",
        Description = "Makes the game completely bright",
        CurrentValue = false,
        Tooltip = "Removes all shadows and darkness",
        Callback = function(value)
            if value then
                game.Lighting.Brightness = 2
                game.Lighting.ClockTime = 14
                game.Lighting.FogEnd = 100000
                game.Lighting.GlobalShadows = false
            else
                game.Lighting.Brightness = 1
                game.Lighting.ClockTime = 12
                game.Lighting.FogEnd = 786543
                game.Lighting.GlobalShadows = true
            end
        end
    })

    local themeDropdown = VisualTab:CreateDropdown({
        Name = "UI Theme",
        Description = "Choose your preferred interface theme",
        Options = {"Default", "Light", "Neon"},
        CurrentValue = "Default",
        Tooltip = "Changes the entire UI appearance",
        Callback = function(value)
            LRDLibrary:SetTheme(value)
            LRDLibrary:Notify({
                Title = "Theme Changed",
                Content = "Interface theme changed to " .. value,
                Type = "Info",
                Duration = 3
            })
        end
    })

    -- Settings Tab
    local SettingsTab = ExampleWindow:CreateTab({
        Name = "Settings",
        Icon = LRDLibrary.Icons.Settings,
        Tooltip = "Application settings and preferences"
    })

    SettingsTab:CreateSection({
        Name = "Audio Settings"
    })

    local soundToggle = SettingsTab:CreateToggle({
        Name = "Sound Effects",
        Description = "Enable or disable UI sound effects",
        CurrentValue = LRDLibrary.Config.SoundEnabled,
        Callback = function(value)
            LRDLibrary.Config.SoundEnabled = value
            saveConfig()
        end
    })

    SettingsTab:CreateSection({
        Name = "Interface Settings"
    })

    local tooltipToggle = SettingsTab:CreateToggle({
        Name = "Show Tooltips",
        Description = "Display helpful tooltips when hovering over elements",
        CurrentValue = LRDLibrary.Config.Tooltips,
        Callback = function(value)
            LRDLibrary.Config.Tooltips = value
            saveConfig()
        end
    })

    local keybindInput = SettingsTab:CreateKeybind({
        Name = "Toggle UI",
        Description = "Set a key to show/hide the interface",
        CurrentKey = Enum.KeyCode.RightShift,
        Callback = function()
            ExampleWindow:ToggleVisibility()
        end
    })

    -- Advanced Tab
    local AdvancedTab = ExampleWindow:CreateTab({
        Name = "Advanced",
        Icon = LRDLibrary.Icons.Settings,
        Tooltip = "Advanced features and tools"
    })

    AdvancedTab:CreateSection({
        Name = "Development Tools"
    })

    local debugToggle = AdvancedTab:CreateToggle({
        Name = "Debug Mode",
        Description = "Show error messages and debug information",
        CurrentValue = LRDLibrary.Config.DebugMode,
        Callback = function(value)
            LRDLibrary.Config.DebugMode = value
            saveConfig()
        end
    })

    local serverInfoTextBox = AdvancedTab:CreateTextBox({
        Name = "Server Info",
        Description = "Display server information",
        PlaceholderText = "Server details...",
        CurrentValue = "Game: " .. game.Name,
        Callback = function(text, enterPressed)
            if enterPressed then
                LRDLibrary:Notify({
                    Title = "Server Info Updated",
                    Content = "Information: " .. text,
                    Type = "Info",
                    Duration = 4
                })
            end
        end
    })

    local accentColorPicker = AdvancedTab:CreateColorPicker({
        Name = "Accent Color",
        Description = "Customize the primary accent color",
        CurrentColor = LRDLibrary.Theme.Primary,
        Callback = function(color)
            LRDLibrary.Theme.Primary = color
            LRDLibrary.Theme.PrimaryHover = interpolateColor(color, Color3.fromRGB(255, 255, 255), 0.2)
        end
    })
end

return LRDLibrary
