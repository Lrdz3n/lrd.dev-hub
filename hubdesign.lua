
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
    DebugMode = false,
    RippleEffects = true,
    ParticleEffects = true,
    GlassmorphismEnabled = true,
    SpringAnimations = true
}

-- Sound Effects
LRDLibrary.Sounds = {
    Click = "rbxassetid://6895079853",
    Hover = "rbxassetid://6895079853", 
    Success = "rbxassetid://6026984976",
    Error = "rbxassetid://6026984976",
    Notification = "rbxassetid://6026984976",
    Tab = "rbxassetid://6895079853",
    Toggle = "rbxassetid://6895079853",
    Slider = "rbxassetid://6895079853",
    Whoosh = "rbxassetid://6895079853",
    Pop = "rbxassetid://6026984976"
}

-- Advanced Theme System with Glassmorphism
LRDLibrary.Themes = {
    Default = {
        Name = "Midnight Pro",
        Primary = Color3.fromRGB(138, 43, 226),
        PrimaryHover = Color3.fromRGB(148, 63, 236),
        Secondary = Color3.fromRGB(75, 75, 85),
        Accent = Color3.fromRGB(255, 100, 150),
        
        Background = Color3.fromRGB(15, 15, 20),
        SecondaryBackground = Color3.fromRGB(20, 20, 25),
        TertiaryBackground = Color3.fromRGB(25, 25, 30),
        Topbar = Color3.fromRGB(18, 18, 23),
        Shadow = Color3.fromRGB(0, 0, 0),
        
        ElementBackground = Color3.fromRGB(30, 30, 35),
        ElementBackgroundHover = Color3.fromRGB(35, 35, 40),
        ElementBackgroundActive = Color3.fromRGB(40, 40, 45),
        ElementStroke = Color3.fromRGB(60, 60, 65),
        
        TabBackground = Color3.fromRGB(25, 25, 30),
        TabBackgroundSelected = Color3.fromRGB(138, 43, 226),
        TabStroke = Color3.fromRGB(45, 45, 50),
        
        TextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(200, 200, 200),
        DisabledTextColor = Color3.fromRGB(120, 120, 120),
        
        Success = Color3.fromRGB(46, 204, 113),
        Warning = Color3.fromRGB(241, 196, 15),
        Error = Color3.fromRGB(231, 76, 60),
        Info = Color3.fromRGB(52, 152, 219),
        
        ToggleEnabled = Color3.fromRGB(138, 43, 226),
        ToggleDisabled = Color3.fromRGB(70, 70, 75),
        
        SliderBackground = Color3.fromRGB(40, 40, 45),
        SliderProgress = Color3.fromRGB(138, 43, 226),
        
        NotificationBackground = Color3.fromRGB(25, 25, 30),
        NotificationBorder = Color3.fromRGB(138, 43, 226),
        
        GraphLine = Color3.fromRGB(138, 43, 226),
        GraphBackground = Color3.fromRGB(30, 30, 35),
        
        CodeBackground = Color3.fromRGB(18, 18, 23),
        CodeText = Color3.fromRGB(248, 248, 242),
        CodeKeyword = Color3.fromRGB(249, 38, 114),
        CodeString = Color3.fromRGB(230, 219, 116),
        CodeComment = Color3.fromRGB(117, 113, 94),
        
        GlassBackground = Color3.fromRGB(255, 255, 255),
        GlassTransparency = 0.95,
        BlurIntensity = 15
    },
    
    Light = {
        Name = "Arctic Light",
        Primary = Color3.fromRGB(99, 102, 241),
        PrimaryHover = Color3.fromRGB(79, 70, 229),
        Secondary = Color3.fromRGB(156, 163, 175),
        Accent = Color3.fromRGB(236, 72, 153),
        
        Background = Color3.fromRGB(248, 250, 252),
        SecondaryBackground = Color3.fromRGB(241, 245, 249),
        TertiaryBackground = Color3.fromRGB(226, 232, 240),
        Topbar = Color3.fromRGB(255, 255, 255),
        Shadow = Color3.fromRGB(0, 0, 0),
        
        ElementBackground = Color3.fromRGB(255, 255, 255),
        ElementBackgroundHover = Color3.fromRGB(248, 250, 252),
        ElementBackgroundActive = Color3.fromRGB(241, 245, 249),
        ElementStroke = Color3.fromRGB(226, 232, 240),
        
        TabBackground = Color3.fromRGB(241, 245, 249),
        TabBackgroundSelected = Color3.fromRGB(99, 102, 241),
        TabStroke = Color3.fromRGB(226, 232, 240),
        
        TextColor = Color3.fromRGB(15, 23, 42),
        SecondaryTextColor = Color3.fromRGB(71, 85, 105),
        DisabledTextColor = Color3.fromRGB(148, 163, 184),
        
        Success = Color3.fromRGB(34, 197, 94),
        Warning = Color3.fromRGB(245, 158, 11),
        Error = Color3.fromRGB(239, 68, 68),
        Info = Color3.fromRGB(59, 130, 246),
        
        ToggleEnabled = Color3.fromRGB(99, 102, 241),
        ToggleDisabled = Color3.fromRGB(156, 163, 175),
        
        SliderBackground = Color3.fromRGB(226, 232, 240),
        SliderProgress = Color3.fromRGB(99, 102, 241),
        
        NotificationBackground = Color3.fromRGB(255, 255, 255),
        NotificationBorder = Color3.fromRGB(99, 102, 241),
        
        GraphLine = Color3.fromRGB(99, 102, 241),
        GraphBackground = Color3.fromRGB(248, 250, 252),
        
        CodeBackground = Color3.fromRGB(241, 245, 249),
        CodeText = Color3.fromRGB(15, 23, 42),
        CodeKeyword = Color3.fromRGB(147, 51, 234),
        CodeString = Color3.fromRGB(34, 197, 94),
        CodeComment = Color3.fromRGB(100, 116, 139),
        
        GlassBackground = Color3.fromRGB(255, 255, 255),
        GlassTransparency = 0.7,
        BlurIntensity = 10
    },
    
    Neon = {
        Name = "Cyber Neon",
        Primary = Color3.fromRGB(0, 255, 255),
        PrimaryHover = Color3.fromRGB(0, 230, 255),
        Secondary = Color3.fromRGB(255, 0, 255),
        Accent = Color3.fromRGB(255, 255, 0),
        
        Background = Color3.fromRGB(5, 5, 10),
        SecondaryBackground = Color3.fromRGB(10, 10, 15),
        TertiaryBackground = Color3.fromRGB(15, 15, 20),
        Topbar = Color3.fromRGB(8, 8, 13),
        Shadow = Color3.fromRGB(0, 0, 0),
        
        ElementBackground = Color3.fromRGB(15, 15, 20),
        ElementBackgroundHover = Color3.fromRGB(20, 20, 25),
        ElementBackgroundActive = Color3.fromRGB(25, 25, 30),
        ElementStroke = Color3.fromRGB(0, 255, 255),
        
        TabBackground = Color3.fromRGB(10, 10, 15),
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
        
        SliderBackground = Color3.fromRGB(30, 30, 35),
        SliderProgress = Color3.fromRGB(0, 255, 255),
        
        NotificationBackground = Color3.fromRGB(10, 10, 15),
        NotificationBorder = Color3.fromRGB(0, 255, 255),
        
        GraphLine = Color3.fromRGB(0, 255, 255),
        GraphBackground = Color3.fromRGB(15, 15, 20),
        
        CodeBackground = Color3.fromRGB(5, 5, 10),
        CodeText = Color3.fromRGB(255, 255, 255),
        CodeKeyword = Color3.fromRGB(255, 0, 255),
        CodeString = Color3.fromRGB(0, 255, 0),
        CodeComment = Color3.fromRGB(100, 100, 100),
        
        GlassBackground = Color3.fromRGB(0, 255, 255),
        GlassTransparency = 0.9,
        BlurIntensity = 20
    },
    
    Ocean = {
        Name = "Ocean Depths",
        Primary = Color3.fromRGB(14, 165, 233),
        PrimaryHover = Color3.fromRGB(2, 132, 199),
        Secondary = Color3.fromRGB(71, 85, 105),
        Accent = Color3.fromRGB(34, 211, 238),
        
        Background = Color3.fromRGB(8, 47, 73),
        SecondaryBackground = Color3.fromRGB(12, 74, 110),
        TertiaryBackground = Color3.fromRGB(14, 116, 144),
        Topbar = Color3.fromRGB(7, 89, 133),
        Shadow = Color3.fromRGB(0, 0, 0),
        
        ElementBackground = Color3.fromRGB(15, 118, 110),
        ElementBackgroundHover = Color3.fromRGB(17, 94, 89),
        ElementBackgroundActive = Color3.fromRGB(20, 83, 45),
        ElementStroke = Color3.fromRGB(34, 211, 238),
        
        TabBackground = Color3.fromRGB(12, 74, 110),
        TabBackgroundSelected = Color3.fromRGB(14, 165, 233),
        TabStroke = Color3.fromRGB(30, 58, 138),
        
        TextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(186, 230, 253),
        DisabledTextColor = Color3.fromRGB(100, 116, 139),
        
        Success = Color3.fromRGB(34, 197, 94),
        Warning = Color3.fromRGB(251, 191, 36),
        Error = Color3.fromRGB(248, 113, 113),
        Info = Color3.fromRGB(56, 189, 248),
        
        ToggleEnabled = Color3.fromRGB(14, 165, 233),
        ToggleDisabled = Color3.fromRGB(71, 85, 105),
        
        SliderBackground = Color3.fromRGB(30, 58, 138),
        SliderProgress = Color3.fromRGB(14, 165, 233),
        
        NotificationBackground = Color3.fromRGB(12, 74, 110),
        NotificationBorder = Color3.fromRGB(14, 165, 233),
        
        GraphLine = Color3.fromRGB(34, 211, 238),
        GraphBackground = Color3.fromRGB(15, 118, 110),
        
        CodeBackground = Color3.fromRGB(8, 47, 73),
        CodeText = Color3.fromRGB(186, 230, 253),
        CodeKeyword = Color3.fromRGB(34, 211, 238),
        CodeString = Color3.fromRGB(52, 211, 153),
        CodeComment = Color3.fromRGB(100, 116, 139),
        
        GlassBackground = Color3.fromRGB(14, 165, 233),
        GlassTransparency = 0.85,
        BlurIntensity = 12
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
        About = "About",
        Premium = "Premium",
        Advanced = "Advanced",
        Basic = "Basic"
    }
}

-- Advanced Animation System with Spring Physics
LRDLibrary.Animations = {
    -- Spring-based animations
    SpringIn = function(object, targetProperties, duration, dampening, frequency)
        local info = TweenInfo.new(
            duration or 0.5,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.Out,
            0,
            false,
            0
        )
        return TweenService:Create(object, info, targetProperties)
    end,
    
    -- Elastic bounce
    ElasticBounce = function(object, targetProperties, duration)
        local info = TweenInfo.new(
            duration or 0.6,
            Enum.EasingStyle.Elastic,
            Enum.EasingDirection.Out,
            0,
            false,
            0
        )
        return TweenService:Create(object, info, targetProperties)
    end,
    
    -- Smooth fade with easing
    FadeIn = function(object, duration, delay)
        object.Transparency = 1
        local info = TweenInfo.new(
            duration or 0.3,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out,
            0,
            false,
            delay or 0
        )
        return TweenService:Create(object, info, {Transparency = 0})
    end,
    
    FadeOut = function(object, duration, delay)
        local info = TweenInfo.new(
            duration or 0.3,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out,
            0,
            false,
            delay or 0
        )
        return TweenService:Create(object, info, {Transparency = 1})
    end,
    
    -- Advanced slide animations
    SlideIn = function(object, direction, duration, easing)
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
        local info = TweenInfo.new(
            duration or 0.4,
            easing or Enum.EasingStyle.Back,
            Enum.EasingDirection.Out
        )
        return TweenService:Create(object, info, {Position = originalPos})
    end,
    
    -- Scale with overshoot
    ScaleIn = function(object, targetScale, duration)
        object.Size = UDim2.new(0, 0, 0, 0)
        local info = TweenInfo.new(
            duration or 0.4,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.Out
        )
        return TweenService:Create(object, info, {Size = targetScale})
    end,
    
    -- Rotation animation
    Rotate = function(object, degrees, duration)
        local info = TweenInfo.new(
            duration or 0.5,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        )
        return TweenService:Create(object, info, {Rotation = degrees})
    end,
    
    -- Pulse effect
    Pulse = function(object, intensity, duration)
        local originalSize = object.Size
        local pulseSize = UDim2.new(
            originalSize.X.Scale + intensity,
            originalSize.X.Offset,
            originalSize.Y.Scale + intensity,
            originalSize.Y.Offset
        )
        
        local tween1 = TweenService:Create(object, 
            TweenInfo.new(duration/2 or 0.15, Enum.EasingStyle.Quad), 
            {Size = pulseSize}
        )
        local tween2 = TweenService:Create(object, 
            TweenInfo.new(duration/2 or 0.15, Enum.EasingStyle.Quad), 
            {Size = originalSize}
        )
        
        tween1:Play()
        tween1.Completed:Connect(function()
            tween2:Play()
        end)
        
        return tween1
    end,
    
    -- Shake animation with decay
    Shake = function(object, intensity, duration)
        local originalPos = object.Position
        local connection
        local elapsed = 0
        local frequency = 20 -- Shakes per second
        
        connection = RunService.Heartbeat:Connect(function(dt)
            elapsed = elapsed + dt
            if elapsed >= (duration or 0.5) then
                object.Position = originalPos
                connection:Disconnect()
                return
            end
            
            local progress = elapsed / (duration or 0.5)
            local currentIntensity = intensity * (1 - progress) -- Decay over time
            
            local x = math.sin(elapsed * frequency) * currentIntensity
            local y = math.cos(elapsed * frequency * 1.5) * currentIntensity
            
            object.Position = originalPos + UDim2.new(0, x, 0, y)
        end)
        
        return connection
    end,
    
    -- Typewriter effect for text
    TypeWriter = function(textLabel, fullText, speed)
        textLabel.Text = ""
        local currentText = ""
        
        for i = 1, #fullText do
            currentText = fullText:sub(1, i)
            textLabel.Text = currentText
            wait(speed or 0.05)
        end
    end,
    
    -- Morphing animation
    Morph = function(object, targetProperties, duration, style)
        local info = TweenInfo.new(
            duration or 0.5,
            style or Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        )
        return TweenService:Create(object, info, targetProperties)
    end
}

-- Enhanced Icon System with Unicode
LRDLibrary.Icons = {
    -- Basic Icons
    Home = "🏠",
    Settings = "⚙️",
    User = "👤",
    Search = "🔍",
    Bell = "🔔",
    Star = "⭐",
    Heart = "❤️",
    Plus = "➕",
    Minus = "➖",
    Check = "✅",
    X = "❌",
    Arrow = "➡️",
    Download = "⬇️",
    Upload = "⬆️",
    Play = "▶️",
    Pause = "⏸️",
    Stop = "⏹️",
    
    -- Advanced Icons
    Code = "💻",
    Terminal = "🖥️",
    Database = "🗄️",
    Cloud = "☁️",
    Lock = "🔒",
    Unlock = "🔓",
    Key = "🔑",
    Shield = "🛡️",
    Lightning = "⚡",
    Fire = "🔥",
    Water = "💧",
    Earth = "🌍",
    Moon = "🌙",
    Sun = "☀️",
    
    -- UI Icons
    Menu = "☰",
    Grid = "▦",
    List = "☰",
    Card = "🃏",
    Chart = "📊",
    Graph = "📈",
    Pie = "🥧",
    Calendar = "📅",
    Clock = "🕐",
    Timer = "⏱️",
    
    -- Status Icons
    Success = "✅",
    Warning = "⚠️",
    Error = "❌",
    Info = "ℹ️",
    Question = "❓",
    Exclamation = "❗",
    
    -- Navigation Icons
    Back = "⬅️",
    Forward = "➡️",
    Up = "⬆️",
    Down = "⬇️",
    Refresh = "🔄",
    Sync = "🔄",
    
    -- Media Icons
    Volume = "🔊",
    Mute = "🔇",
    Camera = "📷",
    Video = "📹",
    Image = "🖼️",
    Music = "🎵"
}

-- Advanced utility functions
local function playSound(soundId, volume, pitch)
    if not LRDLibrary.Config.SoundEnabled then return end
    
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = volume or 0.5
    sound.PlaybackSpeed = pitch or 1
    sound.Parent = SoundService
    sound:Play()
    
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
    
    return sound
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

-- Create Screen GUI with advanced effects
local function createScreenGui(name)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 100
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Add blur effect if enabled
    if LRDLibrary.Config.BlurBackground then
        local blur = Instance.new("BlurEffect")
        blur.Size = LRDLibrary.Theme.BlurIntensity or 15
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
    frame.Size = UDim2.new(1, 0, 1, 0)
    
    for prop, value in pairs(properties or {}) do
        frame[prop] = value
    end
    
    return frame
end

local function createTextLabel(properties)
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = LRDLibrary.Theme.TextColor
    label.TextScaled = false
    label.TextWrapped = true
    label.TextSize = 14
    label.Size = UDim2.new(1, 0, 1, 0)
    
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
    button.TextSize = 14
    button.Size = UDim2.new(1, 0, 1, 0)
    
    for prop, value in pairs(properties or {}) do
        button[prop] = value
    end
    
    return button
end

local function createImageButton(properties)
    local button = Instance.new("ImageButton")
    button.BackgroundTransparency = 1
    button.AutoButtonColor = false
    button.Size = UDim2.new(1, 0, 1, 0)
    
    for prop, value in pairs(properties or {}) do
        button[prop] = value
    end
    
    return button
end

local function createImageLabel(properties)
    local image = Instance.new("ImageLabel")
    image.BackgroundTransparency = 1
    image.Size = UDim2.new(1, 0, 1, 0)
    
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
    textBox.TextSize = 14
    textBox.Size = UDim2.new(1, 0, 1, 0)
    
    for prop, value in pairs(properties or {}) do
        textBox[prop] = value
    end
    
    return textBox
end

-- Enhanced UI element creators
local function addCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 12)
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

local function addGradient(parent, colors, rotation, transparency)
    local gradient = Instance.new("UIGradient")
    gradient.Color = colors or ColorSequence.new{
        ColorSequenceKeypoint.new(0, LRDLibrary.Theme.Primary),
        ColorSequenceKeypoint.new(1, LRDLibrary.Theme.PrimaryHover)
    }
    gradient.Rotation = rotation or 0
    gradient.Transparency = transparency or NumberSequence.new(0)
    gradient.Parent = parent
    return gradient
end

local function addShadow(parent, size, transparency, color)
    local shadow = createFrame({
        Name = "DropShadow",
        Size = UDim2.new(1, size or 20, 1, size or 20),
        Position = UDim2.new(0, -(size or 20)/2, 0, -(size or 20)/2),
        BackgroundColor3 = color or Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = transparency or 0.7,
        ZIndex = (parent.ZIndex or 1) - 1,
        Parent = parent.Parent
    })
    addCorner(shadow, (size or 20)/2)
    return shadow
end

-- Advanced Glassmorphism Effect
local function addGlassmorphism(parent, intensity)
    if not LRDLibrary.Config.GlassmorphismEnabled then return end
    
    local glass = createFrame({
        Name = "GlassEffect",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = LRDLibrary.Theme.GlassBackground,
        BackgroundTransparency = LRDLibrary.Theme.GlassTransparency or 0.9,
        ZIndex = parent.ZIndex + 1,
        Parent = parent
    })
    
    addCorner(glass, 12)
    addStroke(glass, Color3.fromRGB(255, 255, 255), 1, 0.8)
    
    -- Add subtle gradient
    local gradient = addGradient(glass, ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 255))
    }, 45, NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0.95),
        NumberSequenceKeypoint.new(1, 0.98)
    })
    
    return glass
end

-- Advanced Ripple Effect System
local function addRipple(parent, color)
    if not LRDLibrary.Config.RippleEffects then return end
    
    local rippleContainer = createFrame({
        Name = "RippleContainer",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = parent.ZIndex + 2,
        Parent = parent
    })
    
    parent.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mousePos = UserInputService:GetMouseLocation()
            local parentPos = parent.AbsolutePosition
            local parentSize = parent.AbsoluteSize
            
            local relativeX = mousePos.X - parentPos.X
            local relativeY = mousePos.Y - parentPos.Y
            
            local ripple = createFrame({
                Name = "Ripple",
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0, relativeX, 0, relativeY),
                BackgroundColor3 = color or Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0.7,
                ZIndex = rippleContainer.ZIndex + 1,
                Parent = rippleContainer
            })
            addCorner(ripple, 100)
            
            local maxSize = math.max(parentSize.X, parentSize.Y) * 2.5
            
            -- Animate ripple expansion
            local expandTween = tween(ripple, 
                TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
                {
                    Size = UDim2.new(0, maxSize, 0, maxSize),
                    Position = UDim2.new(0, relativeX - maxSize/2, 0, relativeY - maxSize/2),
                    BackgroundTransparency = 1
                }
            )
            
            expandTween.Completed:Connect(function()
                ripple:Destroy()
            end)
            
            -- Play ripple sound
            playSound(LRDLibrary.Sounds.Pop, 0.3, 1.2)
        end
    end)
    
    return rippleContainer
end

-- Particle Effect System
local function createParticleEffect(parent, particleType, duration)
    if not LRDLibrary.Config.ParticleEffects then return end
    
    local particles = {}
    local particleCount = particleType == "confetti" and 20 or 10
    
    for i = 1, particleCount do
        local particle = createFrame({
            Name = "Particle",
            Size = UDim2.new(0, math.random(3, 8), 0, math.random(3, 8)),
            Position = UDim2.new(0.5, math.random(-50, 50), 0.5, math.random(-50, 50)),
            BackgroundColor3 = Color3.fromHSV(math.random(), 0.8, 1),
            ZIndex = parent.ZIndex + 10,
            Parent = parent
        })
        addCorner(particle, 50)
        
        -- Animate particle
        local endPos = UDim2.new(
            math.random(0, 100) / 100,
            math.random(-100, 100),
            math.random(0, 100) / 100,
            math.random(-100, 100)
        )
        
        local moveTween = tween(particle,
            TweenInfo.new(duration or 2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                Position = endPos,
                BackgroundTransparency = 1,
                Rotation = math.random(0, 360)
            }
        )
        
        moveTween.Completed:Connect(function()
            particle:Destroy()
        end)
        
        table.insert(particles, particle)
    end
    
    return particles
end

-- Advanced Notification System
local NotificationContainer
local notifications = {}

local function createNotificationContainer()
    if NotificationContainer then return end

    NotificationContainer = createFrame({
        Name = "LRD_Notifications",
        Size = UDim2.new(0, 380, 1, 0),
        Position = UDim2.new(1, -400, 0, 20),
        BackgroundTransparency = 1,
        ZIndex = 1000,
        Parent = createScreenGui("LRD_NotificationGui")
    })

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 12)
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
        Size = UDim2.new(1, 0, 0, 120),
        BackgroundColor3 = LRDLibrary.Theme.NotificationBackground,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        LayoutOrder = #notifications + 1,
        Parent = NotificationContainer
    })

    addCorner(notification, 16)
    addStroke(notification, typeColors[notificationType] or LRDLibrary.Theme.NotificationBorder, 2, 0.3)
    addShadow(notification, 15, 0.4)
    addGlassmorphism(notification)

    -- Icon with background
    local iconBg = createFrame({
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 20, 0, 20),
        BackgroundColor3 = typeColors[notificationType] or LRDLibrary.Theme.Primary,
        BackgroundTransparency = 0.1,
        Parent = notification
    })
    addCorner(iconBg, 20)

    local icon = createTextLabel({
        Size = UDim2.new(1, 0, 1, 0),
        Text = LRDLibrary.Icons[notificationType] or LRDLibrary.Icons.Bell,
        TextSize = 20,
        TextColor3 = typeColors[notificationType] or LRDLibrary.Theme.Primary,
        Parent = iconBg
    })

    -- Title with enhanced styling
    local title = createTextLabel({
        Size = UDim2.new(1, -100, 0, 25),
        Position = UDim2.new(0, 75, 0, 15),
        Text = settings.Title or "Notification",
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = LRDLibrary.Theme.TextColor,
        Parent = notification
    })

    -- Content with better formatting
    local content = createTextLabel({
        Size = UDim2.new(1, -75, 0, 60),
        Position = UDim2.new(0, 75, 0, 40),
        Text = settings.Content or "No content provided",
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
        Parent = notification
    })

    -- Close button with hover effect
    local closeButton = createTextButton({
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -40, 0, 10),
        Text = LRDLibrary.Icons.X,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BackgroundTransparency = 0.3,
        Parent = notification
    })
    addCorner(closeButton, 15)
    addRipple(closeButton)

    -- Progress bar with gradient
    local progressBg = createFrame({
        Size = UDim2.new(1, 0, 0, 4),
        Position = UDim2.new(0, 0, 1, -4),
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BorderSizePixel = 0,
        Parent = notification
    })

    local progressBar = createFrame({
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = typeColors[notificationType] or LRDLibrary.Theme.Primary,
        BorderSizePixel = 0,
        Parent = progressBg
    })
    addGradient(progressBar, ColorSequence.new{
        ColorSequenceKeypoint.new(0, typeColors[notificationType] or LRDLibrary.Theme.Primary),
        ColorSequenceKeypoint.new(1, typeColors[notificationType] or LRDLibrary.Theme.PrimaryHover)
    })

    -- Entrance animation
    notification.Position = UDim2.new(1, 50, 0, 0)
    notification.BackgroundTransparency = 1
    
    LRDLibrary.Animations.SlideIn(notification, "Left", 0.5, Enum.EasingStyle.Back):Play()
    LRDLibrary.Animations.FadeIn(notification, 0.3):Play()

    -- Sound effect
    playSound(LRDLibrary.Sounds.Notification, 0.6, 1)

    -- Auto-remove functionality with smooth progress
    local duration = settings.Duration or 5
    local startTime = tick()
    
    local connection
    connection = RunService.Heartbeat:Connect(function()
        local elapsed = tick() - startTime
        local progress = elapsed / duration
        
        if progress >= 1 then
            connection:Disconnect()
            
            -- Exit animation
            LRDLibrary.Animations.SlideIn(notification, "Right", 0.4):Play()
            LRDLibrary.Animations.FadeOut(notification, 0.3):Play()
            
            task.wait(0.4)
            notification:Destroy()
            
            -- Remove from notifications table
            for i, notif in ipairs(notifications) do
                if notif.id == notificationId then
                    table.remove(notifications, i)
                    break
                end
            end
        else
            progressBar.Size = UDim2.new(1 - progress, 0, 1, 0)
        end
    end)

    -- Close button functionality
    closeButton.MouseButton1Click:Connect(function()
        connection:Disconnect()
        
        LRDLibrary.Animations.SlideIn(notification, "Right", 0.3):Play()
        LRDLibrary.Animations.FadeOut(notification, 0.2):Play()
        
        task.wait(0.3)
        notification:Destroy()
        
        for i, notif in ipairs(notifications) do
            if notif.id == notificationId then
                table.remove(notifications, i)
                break
            end
        end
        
        playSound(LRDLibrary.Sounds.Click, 0.4)
    end)

    -- Hover effects
    closeButton.MouseEnter:Connect(function()
        tween(closeButton, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.1,
            TextColor3 = LRDLibrary.Theme.Error
        })
    end)

    closeButton.MouseLeave:Connect(function()
        tween(closeButton, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.3,
            TextColor3 = LRDLibrary.Theme.SecondaryTextColor
        })
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

-- Enhanced Context Menu System
local ContextMenu = {}

function LRDLibrary:CreateContextMenu(items)
    local contextMenu = createFrame({
        Name = "ContextMenu",
        Size = UDim2.new(0, 220, 0, #items * 40 + 16),
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 999,
        Parent = createScreenGui("LRD_ContextMenu")
    })
    
    addCorner(contextMenu, 12)
    addStroke(contextMenu, LRDLibrary.Theme.ElementStroke, 1, 0.5)
    addShadow(contextMenu, 20, 0.6)
    addGlassmorphism(contextMenu)

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 4)
    layout.Parent = contextMenu

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 8)
    padding.PaddingBottom = UDim.new(0, 8)
    padding.PaddingLeft = UDim.new(0, 8)
    padding.PaddingRight = UDim.new(0, 8)
    padding.Parent = contextMenu

    for i, item in ipairs(items) do
        local menuItem = createTextButton({
            Size = UDim2.new(1, 0, 0, 36),
            BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
            BackgroundTransparency = 1,
            Text = "",
            LayoutOrder = i,
            Parent = contextMenu
        })
        
        addCorner(menuItem, 8)
        addRipple(menuItem)

        -- Icon
        if item.Icon then
            local icon = createTextLabel({
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(0, 12, 0.5, -10),
                Text = item.Icon,
                TextSize = 16,
                TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                Parent = menuItem
            })
        end

        -- Text
        local text = createTextLabel({
            Size = UDim2.new(1, item.Icon and -50 or -20, 1, 0),
            Position = UDim2.new(0, item.Icon and 40 or 12, 0, 0),
            Text = item.Text,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = LRDLibrary.Theme.TextColor,
            Parent = menuItem
        })

        -- Hover effects
        menuItem.MouseEnter:Connect(function()
            tween(menuItem, TweenInfo.new(0.2), {
                BackgroundColor3 = LRDLibrary.Theme.ElementBackgroundHover,
                BackgroundTransparency = 0.3
            })
            playSound(LRDLibrary.Sounds.Hover, 0.3)
        end)

        menuItem.MouseLeave:Connect(function()
            tween(menuItem, TweenInfo.new(0.2), {
                BackgroundTransparency = 1
            })
        end)

        menuItem.MouseButton1Click:Connect(function()
            if item.Callback then
                item.Callback()
            end
            ContextMenu:Hide()
            playSound(LRDLibrary.Sounds.Click, 0.5)
        end)
    end

    function ContextMenu:Show(position)
        contextMenu.Position = UDim2.new(0, position.X, 0, position.Y)
        contextMenu.Visible = true
        
        LRDLibrary.Animations.ScaleIn(contextMenu, contextMenu.Size, 0.3):Play()
        LRDLibrary.Animations.FadeIn(contextMenu, 0.2):Play()
        
        playSound(LRDLibrary.Sounds.Whoosh, 0.4)
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

-- Enhanced Tooltip System
function LRDLibrary:CreateTooltip(parent, text, delay, position)
    if not LRDLibrary.Config.Tooltips then return end
    
    local tooltip = createFrame({
        Name = "Tooltip",
        Size = UDim2.new(0, 0, 0, 36),
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 1000,
        Parent = createScreenGui("LRD_Tooltip")
    })
    
    addCorner(tooltip, 8)
    addStroke(tooltip, LRDLibrary.Theme.ElementStroke, 1, 0.5)
    addShadow(tooltip, 8, 0.5)
    addGlassmorphism(tooltip)

    local label = createTextLabel({
        Size = UDim2.new(1, -16, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        Text = text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextColor3 = LRDLibrary.Theme.TextColor,
        Parent = tooltip
    })

    -- Calculate text size
    local textBounds = TextService:GetTextSize(text, 12, Enum.Font.Gotham, Vector2.new(math.huge, 36))
    tooltip.Size = UDim2.new(0, textBounds.X + 16, 0, 36)

    local hoverConnection
    local leaveConnection
    local showTimer

    hoverConnection = parent.MouseEnter:Connect(function()
        showTimer = task.delay(delay or 0.5, function()
            local mousePos = UserInputService:GetMouseLocation()
            local offsetX, offsetY = 10, -46
            
            if position == "top" then
                offsetY = -46
            elseif position == "bottom" then
                offsetY = 10
            elseif position == "left" then
                offsetX = -tooltip.AbsoluteSize.X - 10
                offsetY = -18
            elseif position == "right" then
                offsetX = 10
                offsetY = -18
            end
            
            tooltip.Position = UDim2.new(0, mousePos.X + offsetX, 0, mousePos.Y + offsetY)
            tooltip.Visible = true
            
            LRDLibrary.Animations.ScaleIn(tooltip, tooltip.Size, 0.2):Play()
            LRDLibrary.Animations.FadeIn(tooltip, 0.15):Play()
        end)
    end)

    leaveConnection = parent.MouseLeave:Connect(function()
        if showTimer then
            task.cancel(showTimer)
        end
        
        if tooltip.Visible then
            LRDLibrary.Animations.FadeOut(tooltip, 0.15):Play()
            task.wait(0.15)
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

-- Configuration System with DataStore support
local function saveConfig()
    if not LRDLibrary.Config.SaveConfig then return end
    
    local data = {
        Theme = LRDLibrary.Config.Theme,
        Language = LRDLibrary.Config.Language,
        SoundEnabled = LRDLibrary.Config.SoundEnabled,
        BlurBackground = LRDLibrary.Config.BlurBackground,
        Tooltips = LRDLibrary.Config.Tooltips,
        AnimationSpeed = LRDLibrary.Config.AnimationSpeed,
        RippleEffects = LRDLibrary.Config.RippleEffects,
        ParticleEffects = LRDLibrary.Config.ParticleEffects,
        GlassmorphismEnabled = LRDLibrary.Config.GlassmorphismEnabled
    }
    
    -- Store locally (in production, use DataStoreService)
    _G.LRDConfig = data
end

local function loadConfig()
    if not LRDLibrary.Config.SaveConfig then return end
    
    local data = _G.LRDConfig
    if data then
        for key, value in pairs(data) do
            if LRDLibrary.Config[key] ~= nil then
                LRDLibrary.Config[key] = value
            end
        end
        
        -- Update theme reference
        LRDLibrary.Theme = LRDLibrary.Themes[LRDLibrary.Config.Theme] or LRDLibrary.Themes.Default
    end
end

-- Enhanced Theme Manager
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
        
        -- Create theme transition effect
        createParticleEffect(PlayerGui, "confetti", 1.5)
        
        return true
    end
    return false
end

function LRDLibrary:AddTheme(name, theme)
    LRDLibrary.Themes[name] = theme
end

function LRDLibrary:GetThemes()
    local themeList = {}
    for name, theme in pairs(LRDLibrary.Themes) do
        table.insert(themeList, {Name = name, DisplayName = theme.Name})
    end
    return themeList
end

-- Main Library Functions
function LRDLibrary:CreateWindow(settings)
    loadConfig()
    
    local Window = {}
    Window.Name = settings.Name or "LRD.dev Interface"
    Window.Tabs = {}
    Window.Settings = settings
    Window.Minimized = false

    -- Create main GUI
    local screenGui = createScreenGui("LRD_Interface_" .. generateUUID())

    -- Main frame with glassmorphism
    local mainFrame = createFrame({
        Name = "MainFrame",
        Size = UDim2.new(0, settings.Size and settings.Size.X or 800, 0, settings.Size and settings.Size.Y or 600),
        Position = UDim2.new(0.5, -(settings.Size and settings.Size.X or 800)/2, 0.5, -(settings.Size and settings.Size.Y or 600)/2),
        BackgroundColor3 = LRDLibrary.Theme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = screenGui
    })

    addCorner(mainFrame, 16)
    addShadow(mainFrame, 40, 0.5)
    addGlassmorphism(mainFrame)

    -- Enhanced topbar with gradient
    local topbar = createFrame({
        Name = "Topbar",
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = LRDLibrary.Theme.Topbar,
        BorderSizePixel = 0,
        Parent = mainFrame
    })
    addCorner(topbar, 16)
    addGradient(topbar, ColorSequence.new{
        ColorSequenceKeypoint.new(0, LRDLibrary.Theme.Topbar),
        ColorSequenceKeypoint.new(1, LRDLibrary.Theme.SecondaryBackground)
    }, 90)

    -- Window icon with glow effect
    local windowIcon = createTextLabel({
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(0, 25, 0.5, -16),
        Text = settings.Icon or LRDLibrary.Icons.Terminal,
        TextSize = 24,
        TextColor3 = LRDLibrary.Theme.Primary,
        Parent = topbar
    })

    -- Enhanced title with subtitle
    local titleContainer = createFrame({
        Size = UDim2.new(1, -300, 1, 0),
        Position = UDim2.new(0, 70, 0, 0),
        BackgroundTransparency = 1,
        Parent = topbar
    })

    local title = createTextLabel({
        Size = UDim2.new(1, 0, 0, 25),
        Position = UDim2.new(0, 0, 0, 12),
        Text = Window.Name,
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = LRDLibrary.Theme.TextColor,
        Parent = titleContainer
    })

    local subtitle = createTextLabel({
        Size = UDim2.new(1, 0, 0, 15),
        Position = UDim2.new(0, 0, 0, 35),
        Text = settings.Subtitle or "Premium Edition v" .. LRDLibrary.Version,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
        Parent = titleContainer
    })

    -- Enhanced window controls
    local controlsFrame = createFrame({
        Size = UDim2.new(0, 140, 0, 35),
        Position = UDim2.new(1, -160, 0.5, -17.5),
        BackgroundTransparency = 1,
        Parent = topbar
    })

    -- Minimize button
    local minimizeButton = createTextButton({
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(0, 0, 0, 0),
        Text = LRDLibrary.Icons.Minus,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BackgroundTransparency = 0.3,
        TextColor3 = LRDLibrary.Theme.TextColor,
        Parent = controlsFrame
    })
    addCorner(minimizeButton, 8)
    addRipple(minimizeButton)

    -- Settings button
    local settingsButton = createTextButton({
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(0, 40, 0, 0),
        Text = LRDLibrary.Icons.Settings,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BackgroundTransparency = 0.3,
        TextColor3 = LRDLibrary.Theme.TextColor,
        Parent = controlsFrame
    })
    addCorner(settingsButton, 8)
    addRipple(settingsButton)

    -- Close button
    local closeButton = createTextButton({
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(0, 80, 0, 0),
        Text = LRDLibrary.Icons.X,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        BackgroundColor3 = LRDLibrary.Theme.Error,
        BackgroundTransparency = 0.3,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Parent = controlsFrame
    })
    addCorner(closeButton, 8)
    addRipple(closeButton)

    -- Add enhanced hover effects to control buttons
    for _, button in pairs({minimizeButton, settingsButton, closeButton}) do
        button.MouseEnter:Connect(function()
            LRDLibrary.Animations.Pulse(button, 0.1, 0.2):Play()
            tween(button, TweenInfo.new(0.2), {BackgroundTransparency = 0.1})
            playSound(LRDLibrary.Sounds.Hover, 0.3)
        end)
        
        button.MouseLeave:Connect(function()
            tween(button, TweenInfo.new(0.2), {BackgroundTransparency = 0.3})
        end)
    end

    -- Enhanced tab container
    local tabContainer = createFrame({
        Name = "TabContainer",
        Size = UDim2.new(0, 200, 1, -80),
        Position = UDim2.new(0, 15, 0, 80),
        BackgroundColor3 = LRDLibrary.Theme.SecondaryBackground,
        BorderSizePixel = 0,
        Parent = mainFrame
    })
    addCorner(tabContainer, 12)
    addGlassmorphism(tabContainer)

    local tabScrollFrame = Instance.new("ScrollingFrame")
    tabScrollFrame.Name = "TabScroll"
    tabScrollFrame.Size = UDim2.new(1, 0, 1, 0)
    tabScrollFrame.BackgroundTransparency = 1
    tabScrollFrame.BorderSizePixel = 0
    tabScrollFrame.ScrollBarThickness = 6
    tabScrollFrame.ScrollBarImageColor3 = LRDLibrary.Theme.Primary
    tabScrollFrame.ScrollBarImageTransparency = 0.3
    tabScrollFrame.Parent = tabContainer

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 8)
    tabLayout.Parent = tabScrollFrame

    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingTop = UDim.new(0, 20)
    tabPadding.PaddingLeft = UDim.new(0, 15)
    tabPadding.PaddingRight = UDim.new(0, 15)
    tabPadding.PaddingBottom = UDim.new(0, 20)
    tabPadding.Parent = tabScrollFrame

    -- Enhanced content container
    local contentContainer = createFrame({
        Name = "ContentContainer",
        Size = UDim2.new(1, -230, 1, -80),
        Position = UDim2.new(0, 220, 0, 80),
        BackgroundTransparency = 1,
        Parent = mainFrame
    })

    -- Make window draggable with smooth movement
    local dragging = false
    local dragStart = nil
    local startPos = nil

    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            
            playSound(LRDLibrary.Sounds.Click, 0.4)
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

    -- Enhanced window control functionality
    local originalSize = mainFrame.Size

    minimizeButton.MouseButton1Click:Connect(function()
        Window.Minimized = not Window.Minimized
        
        if Window.Minimized then
            tween(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
                Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 70)
            })
            minimizeButton.Text = LRDLibrary.Icons.Plus
        else
            tween(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
                Size = originalSize
            })
            minimizeButton.Text = LRDLibrary.Icons.Minus
        end
        
        playSound(LRDLibrary.Sounds.Whoosh, 0.5)
    end)

    closeButton.MouseButton1Click:Connect(function()
        playSound(LRDLibrary.Sounds.Click, 0.6)
        
        -- Create exit particle effect
        createParticleEffect(mainFrame, "sparkle", 1)
        
        LRDLibrary.Animations.FadeOut(mainFrame, 0.4):Play()
        LRDLibrary.Animations.ScaleIn(mainFrame, UDim2.new(0, 0, 0, 0), 0.4):Play()
        
        task.wait(0.4)
        screenGui:Destroy()
    end)

    -- Tab management system
    local currentTab = nil
    local tabCount = 0

    function Window:CreateTab(settings)
        local Tab = {}
        local tabName = settings.Name or ("Tab " .. (tabCount + 1))
        tabCount = tabCount + 1

        Tab.Name = tabName
        Tab.Elements = {}
        Tab.Visible = false

        -- Enhanced tab button
        local tabButton = createTextButton({
            Name = tabName,
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundColor3 = LRDLibrary.Theme.TabBackground,
            BackgroundTransparency = 0.3,
            Text = "",
            LayoutOrder = tabCount,
            Parent = tabScrollFrame
        })
        addCorner(tabButton, 10)
        addRipple(tabButton, LRDLibrary.Theme.Primary)

        -- Tab icon with animation
        if settings.Icon then
            local tabIcon = createTextLabel({
                Size = UDim2.new(0, 24, 0, 24),
                Position = UDim2.new(0, 15, 0.5, -12),
                Text = settings.Icon,
                TextSize = 18,
                TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                Parent = tabButton
            })
            Tab.Icon = tabIcon
        end

        -- Enhanced tab label
        local tabLabel = createTextLabel({
            Size = UDim2.new(1, settings.Icon and -50 or -20, 1, 0),
            Position = UDim2.new(0, settings.Icon and 50 or 15, 0, 0),
            Text = tabName,
            TextSize = 14,
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
            Parent = tabButton
        })

        -- Tab content with enhanced scrolling
        local tabContent = Instance.new("ScrollingFrame")
        tabContent.Name = tabName .. "_Content"
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.BackgroundTransparency = 1
        tabContent.BorderSizePixel = 0
        tabContent.ScrollBarThickness = 8
        tabContent.ScrollBarImageColor3 = LRDLibrary.Theme.Primary
        tabContent.ScrollBarImageTransparency = 0.3
        tabContent.Visible = false
        tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContent.Parent = contentContainer

        local contentLayout = Instance.new("UIListLayout")
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 15)
        contentLayout.Parent = tabContent

        local contentPadding = Instance.new("UIPadding")
        contentPadding.PaddingTop = UDim.new(0, 20)
        contentPadding.PaddingLeft = UDim.new(0, 20)
        contentPadding.PaddingRight = UDim.new(0, 20)
        contentPadding.PaddingBottom = UDim.new(0, 20)
        contentPadding.Parent = tabContent

        -- Auto-resize content with smooth animation
        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            local targetSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 40)
            tween(tabContent, TweenInfo.new(0.3), {CanvasSize = targetSize})
        end)

        -- Enhanced tab selection with animations
        tabButton.MouseButton1Click:Connect(function()
            if currentTab then
                -- Deselect current tab
                currentTab.content.Visible = false
                tween(currentTab.button, TweenInfo.new(0.3), {
                    BackgroundColor3 = LRDLibrary.Theme.TabBackground,
                    BackgroundTransparency = 0.3
                })
                tween(currentTab.label, TweenInfo.new(0.3), {
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor
                })
                if currentTab.icon then
                    tween(currentTab.icon, TweenInfo.new(0.3), {
                        TextColor3 = LRDLibrary.Theme.SecondaryTextColor
                    })
                end
            end

            currentTab = {
                content = tabContent,
                button = tabButton,
                label = tabLabel,
                icon = Tab.Icon
            }
            
            -- Select new tab with enhanced animation
            tabContent.Visible = true
            tween(tabButton, TweenInfo.new(0.3), {
                BackgroundColor3 = LRDLibrary.Theme.TabBackgroundSelected,
                BackgroundTransparency = 0.1
            })
            tween(tabLabel, TweenInfo.new(0.3), {
                TextColor3 = LRDLibrary.Theme.TextColor
            })
            if Tab.Icon then
                tween(Tab.Icon, TweenInfo.new(0.3), {
                    TextColor3 = LRDLibrary.Theme.TextColor
                })
            end
            
            -- Content entrance animation
            LRDLibrary.Animations.FadeIn(tabContent, 0.3):Play()
            
            playSound(LRDLibrary.Sounds.Tab, 0.5)
        end)

        -- Tab hover effects
        tabButton.MouseEnter:Connect(function()
            if currentTab and currentTab.button ~= tabButton then
                tween(tabButton, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.1
                })
            end
            playSound(LRDLibrary.Sounds.Hover, 0.2)
        end)

        tabButton.MouseLeave:Connect(function()
            if currentTab and currentTab.button ~= tabButton then
                tween(tabButton, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.3
                })
            end
        end)

        -- Auto-select first tab
        if not currentTab then
            task.wait(0.1)
            tabButton.MouseButton1Click()
        end

        -- Add enhanced tooltip
        if settings.Tooltip then
            LRDLibrary:CreateTooltip(tabButton, settings.Tooltip, 0.5, "right")
        end

        Window.Tabs[tabName] = Tab

        -- Enhanced Tab Element Creation Functions
        function Tab:CreateSection(settings)
            local sectionName = settings.Name or "Section"
            local elementCount = #Tab.Elements + 1

            local sectionFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 60),
                BackgroundTransparency = 1,
                LayoutOrder = elementCount,
                Parent = tabContent
            })

            local sectionLabel = createTextLabel({
                Size = UDim2.new(1, 0, 0, 30),
                Position = UDim2.new(0, 0, 0, 0),
                Text = sectionName,
                TextSize = 18,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = LRDLibrary.Theme.Primary,
                Parent = sectionFrame
            })

            local sectionLine = createFrame({
                Size = UDim2.new(1, 0, 0, 3),
                Position = UDim2.new(0, 0, 0, 40),
                BackgroundColor3 = LRDLibrary.Theme.Primary,
                BorderSizePixel = 0,
                Parent = sectionFrame
            })
            addCorner(sectionLine, 2)
            addGradient(sectionLine)

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, 0, 0, 15),
                    Position = UDim2.new(0, 0, 0, 45),
                    Text = settings.Description,
                    TextSize = 12,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = sectionFrame
                })
                
                sectionFrame.Size = UDim2.new(1, 0, 0, 75)
            end

            -- Section entrance animation
            LRDLibrary.Animations.SlideIn(sectionFrame, "Left", 0.4):Play()

            table.insert(Tab.Elements, {Type = "Section", Element = sectionFrame, Name = sectionName})
            return sectionFrame
        end

        function Tab:CreateButton(settings)
            local elementCount = #Tab.Elements + 1
            local buttonName = settings.Name or "Button"

            local buttonFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 50),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(buttonFrame, 12)
            addStroke(buttonFrame, LRDLibrary.Theme.ElementStroke, 1, 0.5)
            addGlassmorphism(buttonFrame)
            addRipple(buttonFrame, LRDLibrary.Theme.Primary)

            local button = createTextButton({
                Size = UDim2.new(1, 0, 1, 0),
                Text = buttonName,
                TextSize = 14,
                Font = Enum.Font.GothamBold,
                TextColor3 = LRDLibrary.Theme.TextColor,
                Parent = buttonFrame
            })

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -20, 0, 15),
                    Position = UDim2.new(0, 10, 0, 30),
                    Text = settings.Description,
                    TextSize = 11,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = buttonFrame
                })
                
                button.Size = UDim2.new(1, 0, 0, 25)
                button.Position = UDim2.new(0, 0, 0, 5)
                buttonFrame.Size = UDim2.new(1, 0, 0, 65)
            end

            -- Enhanced hover effects
            button.MouseEnter:Connect(function()
                tween(buttonFrame, TweenInfo.new(0.2), {
                    BackgroundColor3 = LRDLibrary.Theme.ElementBackgroundHover
                })
                LRDLibrary.Animations.Pulse(buttonFrame, 0.05, 0.2):Play()
                playSound(LRDLibrary.Sounds.Hover, 0.3)
            end)

            button.MouseLeave:Connect(function()
                tween(buttonFrame, TweenInfo.new(0.2), {
                    BackgroundColor3 = LRDLibrary.Theme.ElementBackground
                })
            end)

            button.MouseButton1Click:Connect(function()
                LRDLibrary.Animations.Pulse(buttonFrame, 0.1, 0.15):Play()
                createParticleEffect(buttonFrame, "sparkle", 0.8)
                playSound(LRDLibrary.Sounds.Click, 0.6)
                
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

            -- Entrance animation
            LRDLibrary.Animations.SlideIn(buttonFrame, "Left", 0.3, Enum.EasingStyle.Back):Play()

            local ButtonAPI = {}
            
            function ButtonAPI:SetText(text)
                button.Text = text
            end
            
            function ButtonAPI:SetCallback(callback)
                settings.Callback = callback
            end

            function ButtonAPI:SetEnabled(enabled)
                button.Visible = enabled
                buttonFrame.BackgroundTransparency = enabled and 0 or 0.5
            end

            table.insert(Tab.Elements, {Type = "Button", Element = buttonFrame, Name = buttonName, API = ButtonAPI})
            return ButtonAPI
        end

        function Tab:CreateToggle(settings)
            local elementCount = #Tab.Elements + 1
            local toggleName = settings.Name or "Toggle"
            local currentValue = settings.CurrentValue or false

            local toggleFrame = createFrame({
                Size = UDim2.new(1, 0, 0, 50),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(toggleFrame, 12)
            addStroke(toggleFrame, LRDLibrary.Theme.ElementStroke, 1, 0.5)
            addGlassmorphism(toggleFrame)

            local label = createTextLabel({
                Size = UDim2.new(1, -80, 1, 0),
                Position = UDim2.new(0, 15, 0, 0),
                Text = toggleName,
                TextSize = 14,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = LRDLibrary.Theme.TextColor,
                Parent = toggleFrame
            })

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -80, 0, 15),
                    Position = UDim2.new(0, 15, 0, 30),
                    Text = settings.Description,
                    TextSize = 11,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = toggleFrame
                })
                
                label.Size = UDim2.new(1, -80, 0, 25)
                label.Position = UDim2.new(0, 15, 0, 5)
                toggleFrame.Size = UDim2.new(1, 0, 0, 65)
            end

            -- Enhanced toggle switch
            local toggleBackground = createFrame({
                Size = UDim2.new(0, 60, 0, 30),
                Position = UDim2.new(1, -75, 0.5, -15),
                BackgroundColor3 = currentValue and LRDLibrary.Theme.ToggleEnabled or LRDLibrary.Theme.ToggleDisabled,
                BorderSizePixel = 0,
                Parent = toggleFrame
            })
            addCorner(toggleBackground, 15)
            addStroke(toggleBackground, LRDLibrary.Theme.ElementStroke, 1, 0.7)

            local toggleIndicator = createFrame({
                Size = UDim2.new(0, 24, 0, 24),
                Position = currentValue and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Parent = toggleBackground
            })
            addCorner(toggleIndicator, 12)
            addShadow(toggleIndicator, 6, 0.3)

            local button = createTextButton({
                Size = UDim2.new(1, 0, 1, 0),
                Text = "",
                BackgroundTransparency = 1,
                Parent = toggleFrame
            })
            addRipple(button)

            button.MouseButton1Click:Connect(function()
                currentValue = not currentValue

                local newToggleColor = currentValue and LRDLibrary.Theme.ToggleEnabled or LRDLibrary.Theme.ToggleDisabled
                local newPosition = currentValue and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)

                tween(toggleBackground, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundColor3 = newToggleColor})
                tween(toggleIndicator, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = newPosition})

                if currentValue then
                    createParticleEffect(toggleBackground, "sparkle", 0.5)
                end

                playSound(LRDLibrary.Sounds.Toggle, 0.5, currentValue and 1.2 or 0.8)

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

            -- Entrance animation
            LRDLibrary.Animations.SlideIn(toggleFrame, "Left", 0.3, Enum.EasingStyle.Back):Play()

            local ToggleAPI = {}
            
            function ToggleAPI:Set(value)
                currentValue = value
                local newToggleColor = currentValue and LRDLibrary.Theme.ToggleEnabled or LRDLibrary.Theme.ToggleDisabled
                local newPosition = currentValue and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)

                tween(toggleBackground, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundColor3 = newToggleColor})
                tween(toggleIndicator, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = newPosition})
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
                Size = UDim2.new(1, 0, 0, 80),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(sliderFrame, 12)
            addStroke(sliderFrame, LRDLibrary.Theme.ElementStroke, 1, 0.5)
            addGlassmorphism(sliderFrame)

            local label = createTextLabel({
                Size = UDim2.new(1, -100, 0, 25),
                Position = UDim2.new(0, 15, 0, 10),
                Text = sliderName,
                TextSize = 14,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = LRDLibrary.Theme.TextColor,
                Parent = sliderFrame
            })

            local valueLabel = createTextLabel({
                Size = UDim2.new(0, 80, 0, 25),
                Position = UDim2.new(1, -95, 0, 10),
                Text = tostring(currentValue),
                TextSize = 14,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextColor3 = LRDLibrary.Theme.Primary,
                Parent = sliderFrame
            })

            -- Enhanced slider track
            local sliderTrack = createFrame({
                Size = UDim2.new(1, -30, 0, 10),
                Position = UDim2.new(0, 15, 0, 50),
                BackgroundColor3 = LRDLibrary.Theme.SliderBackground,
                BorderSizePixel = 0,
                Parent = sliderFrame
            })
            addCorner(sliderTrack, 5)

            local sliderFill = createFrame({
                Size = UDim2.new(0, 0, 1, 0),
                BackgroundColor3 = LRDLibrary.Theme.SliderProgress,
                BorderSizePixel = 0,
                Parent = sliderTrack
            })
            addCorner(sliderFill, 5)
            addGradient(sliderFill)

            -- Enhanced slider handle
            local sliderHandle = createFrame({
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(0, -10, 0.5, -10),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Parent = sliderFill
            })
            addCorner(sliderHandle, 10)
            addShadow(sliderHandle, 8, 0.4)
            addStroke(sliderHandle, LRDLibrary.Theme.Primary, 2, 0.3)

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -15, 0, 12),
                    Position = UDim2.new(0, 15, 0, 65),
                    Text = settings.Description,
                    TextSize = 10,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = sliderFrame
                })
                
                sliderFrame.Size = UDim2.new(1, 0, 0, 95)
            end

            -- Enhanced slider logic
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
                    playSound(LRDLibrary.Sounds.Slider, 0.4)
                    
                    tween(sliderHandle, TweenInfo.new(0.1), {Size = UDim2.new(0, 24, 0, 24)})
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
                    dragging = false
                    tween(sliderHandle, TweenInfo.new(0.2, Enum.EasingStyle.Back), {Size = UDim2.new(0, 20, 0, 20)})
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

            -- Entrance animation
            LRDLibrary.Animations.SlideIn(sliderFrame, "Left", 0.3, Enum.EasingStyle.Back):Play()

            local SliderAPI = {}
            
            function SliderAPI:Set(value)
                updateSlider(value)
            end
            
            function SliderAPI:Get()
                return currentValue
            end

            function SliderAPI:SetMin(newMin)
                min = newMin
                updateSlider(currentValue)
            end

            function SliderAPI:SetMax(newMax)
                max = newMax
                updateSlider(currentValue)
            end

            table.insert(Tab.Elements, {Type = "Slider", Element = sliderFrame, Name = sliderName, API = SliderAPI})
            return SliderAPI
        end

        return Tab
    end

    -- Enhanced loading screen
    local loadingFrame = createFrame({
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = LRDLibrary.Theme.Background,
        BorderSizePixel = 0,
        Parent = mainFrame
    })
    addCorner(loadingFrame, 16)
    addGlassmorphism(loadingFrame)

    -- Loading animation container
    local loadingContainer = createFrame({
        Size = UDim2.new(0, 300, 0, 200),
        Position = UDim2.new(0.5, -150, 0.5, -100),
        BackgroundTransparency = 1,
        Parent = loadingFrame
    })

    -- Animated logo
    local logo = createTextLabel({
        Size = UDim2.new(0, 80, 0, 80),
        Position = UDim2.new(0.5, -40, 0, 0),
        Text = LRDLibrary.Icons.Terminal,
        TextSize = 48,
        TextColor3 = LRDLibrary.Theme.Primary,
        Parent = loadingContainer
    })

    -- Pulsing animation for logo
    local logoPulse
    logoPulse = function()
        LRDLibrary.Animations.Pulse(logo, 0.2, 1):Play()
        task.wait(1)
        if loadingFrame.Parent then
            logoPulse()
        end
    end
    spawn(logoPulse)

    -- Loading text
    local loadingText = createTextLabel({
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, 90),
        Text = settings.LoadingTitle or "Loading LRD.dev Interface...",
        TextSize = 20,
        Font = Enum.Font.GothamBold,
        TextColor3 = LRDLibrary.Theme.TextColor,
        Parent = loadingContainer
    })

    local loadingSubtitle = createTextLabel({
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 125),
        Text = settings.LoadingSubtitle or "Please wait...",
        TextSize = 14,
        TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
        Parent = loadingContainer
    })

    -- Enhanced loading progress bar
    local progressBarBg = createFrame({
        Size = UDim2.new(0, 200, 0, 6),
        Position = UDim2.new(0.5, -100, 0, 160),
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BorderSizePixel = 0,
        Parent = loadingContainer
    })
    addCorner(progressBarBg, 3)

    local progressBar = createFrame({
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = LRDLibrary.Theme.Primary,
        BorderSizePixel = 0,
        Parent = progressBarBg
    })
    addCorner(progressBar, 3)
    addGradient(progressBar)

    -- Animate loading progress
    tween(progressBar, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 1, 0)
    })

    -- Remove loading screen after delay
    task.spawn(function()
        task.wait(2.5)
        
        LRDLibrary.Animations.FadeOut(loadingFrame, 0.5):Play()
        
        task.wait(0.5)
        loadingFrame:Destroy()
        
        -- Show welcome notification
        if settings.ShowWelcome ~= false then
            LRDLibrary:Notify({
                Title = "Welcome!",
                Content = "Welcome to " .. Window.Name .. "! 🎉",
                Type = "Success",
                Duration = 4
            })
        end
        
        -- Play entrance sound
        playSound(LRDLibrary.Sounds.Success, 0.8, 1)
        
        -- Create welcome particle effect
        createParticleEffect(mainFrame, "confetti", 2)
    end)

    -- Window API functions
    function Window:SetTitle(newTitle)
        Window.Name = newTitle
        title.Text = newTitle
    end

    function Window:Destroy()
        screenGui:Destroy()
    end

    function Window:SetVisible(visible)
        screenGui.Enabled = visible
    end

    function Window:Minimize()
        minimizeButton.MouseButton1Click()
    end

    function Window:Close()
        closeButton.MouseButton1Click()
    end

    function Window:GetCurrentTab()
        return currentTab and currentTab.tab
    end

    function Window:SelectTab(tabName)
        local tab = Window.Tabs[tabName]
        if tab then
            -- Find the tab button and simulate click
            for _, child in pairs(tabScrollFrame:GetChildren()) do
                if child.Name == tabName and child:IsA("TextButton") then
                    child.MouseButton1Click()
                    break
                end
            end
        end
    end

    return Window
end

-- Initialize the library
spawn(function()
    -- Auto-load configuration on startup
    loadConfig()
    
    -- Show library loaded notification if debug mode is enabled
    if LRDLibrary.Config.DebugMode then
        task.wait(1)
        LRDLibrary:Notify({
            Title = "LRD.dev Library",
            Content = "Library v" .. LRDLibrary.Version .. " loaded successfully!",
            Type = "Info",
            Duration = 3
        })
    end
end)

return LRDLibrary
