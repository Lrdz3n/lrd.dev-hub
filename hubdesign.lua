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
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")

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
    GlassmorphismEnabled = true
}

-- Sound Effects
LRDLibrary.Sounds = {
    Click = "rbxassetid://6895079853",
    Hover = "rbxassetid://6895079853", 
    Success = "rbxassetid://6026984976",
    Error = "rbxassetid://6026984976",
    Notification = "rbxassetid://9770089602",
    Tab = "rbxassetid://6895079853",
    Toggle = "rbxassetid://6895079853",
    Slider = "rbxassetid://6895079853",
    Whoosh = "rbxassetid://1177785010",
    Pop = "rbxassetid://198598793"
}

-- Advanced Theme System with Glassmorphism
LRDLibrary.Themes = {
    Default = {
        Name = "Glassmorphism Dark",
        Primary = Color3.fromRGB(138, 43, 226),
        PrimaryHover = Color3.fromRGB(148, 63, 236),
        Secondary = Color3.fromRGB(75, 75, 85),
        Accent = Color3.fromRGB(255, 100, 150),
        
        Background = Color3.fromRGB(15, 15, 20),
        BackgroundGlass = Color3.fromRGB(25, 25, 35),
        SecondaryBackground = Color3.fromRGB(20, 20, 30),
        TertiaryBackground = Color3.fromRGB(10, 10, 15),
        Topbar = Color3.fromRGB(30, 30, 40),
        Shadow = Color3.fromRGB(0, 0, 0),
        
        ElementBackground = Color3.fromRGB(35, 35, 45),
        ElementBackgroundHover = Color3.fromRGB(45, 45, 55),
        ElementBackgroundActive = Color3.fromRGB(55, 55, 65),
        ElementStroke = Color3.fromRGB(80, 80, 90),
        
        TabBackground = Color3.fromRGB(40, 40, 50),
        TabBackgroundSelected = Color3.fromRGB(138, 43, 226),
        TabStroke = Color3.fromRGB(70, 70, 80),
        
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
        
        NotificationBackground = Color3.fromRGB(25, 25, 35),
        NotificationBorder = Color3.fromRGB(138, 43, 226),
        
        GraphLine = Color3.fromRGB(138, 43, 226),
        GraphBackground = Color3.fromRGB(35, 35, 45)
    },
    
    Light = {
        Name = "Glassmorphism Light",
        Primary = Color3.fromRGB(99, 102, 241),
        PrimaryHover = Color3.fromRGB(79, 70, 229),
        Secondary = Color3.fromRGB(156, 163, 175),
        Accent = Color3.fromRGB(236, 72, 153),
        
        Background = Color3.fromRGB(248, 250, 252),
        BackgroundGlass = Color3.fromRGB(255, 255, 255),
        SecondaryBackground = Color3.fromRGB(241, 245, 249),
        TertiaryBackground = Color3.fromRGB(226, 232, 240),
        Topbar = Color3.fromRGB(255, 255, 255),
        Shadow = Color3.fromRGB(0, 0, 0),
        
        ElementBackground = Color3.fromRGB(255, 255, 255),
        ElementBackgroundHover = Color3.fromRGB(248, 250, 252),
        ElementBackgroundActive = Color3.fromRGB(241, 245, 249),
        ElementStroke = Color3.fromRGB(226, 232, 240),
        
        TabBackground = Color3.fromRGB(248, 250, 252),
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
        GraphBackground = Color3.fromRGB(255, 255, 255)
    },
    
    Neon = {
        Name = "Neon Cyber",
        Primary = Color3.fromRGB(0, 255, 255),
        PrimaryHover = Color3.fromRGB(0, 230, 255),
        Secondary = Color3.fromRGB(255, 0, 255),
        Accent = Color3.fromRGB(255, 255, 0),
        
        Background = Color3.fromRGB(5, 5, 10),
        BackgroundGlass = Color3.fromRGB(10, 10, 20),
        SecondaryBackground = Color3.fromRGB(0, 0, 5),
        TertiaryBackground = Color3.fromRGB(0, 0, 0),
        Topbar = Color3.fromRGB(10, 10, 20),
        Shadow = Color3.fromRGB(0, 0, 0),
        
        ElementBackground = Color3.fromRGB(15, 15, 25),
        ElementBackgroundHover = Color3.fromRGB(20, 20, 30),
        ElementBackgroundActive = Color3.fromRGB(25, 25, 35),
        ElementStroke = Color3.fromRGB(0, 255, 255),
        
        TabBackground = Color3.fromRGB(15, 15, 25),
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
        
        NotificationBackground = Color3.fromRGB(10, 10, 20),
        NotificationBorder = Color3.fromRGB(0, 255, 255),
        
        GraphLine = Color3.fromRGB(0, 255, 255),
        GraphBackground = Color3.fromRGB(15, 15, 25)
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
        Info = "Information"
    }
}

-- Advanced Animation System with Spring Physics
LRDLibrary.Animations = {
    Spring = function(object, properties, dampening, frequency, callback)
        dampening = dampening or 0.8
        frequency = frequency or 4
        
        local info = TweenInfo.new(
            0.5,
            Enum.EasingStyle.Elastic,
            Enum.EasingDirection.Out,
            0,
            false,
            0
        )
        
        local tween = TweenService:Create(object, info, properties)
        tween:Play()
        
        if callback then
            tween.Completed:Connect(callback)
        end
        
        return tween
    end,
    
    FadeIn = function(object, duration, callback)
        object.Transparency = 1
        local tween = TweenService:Create(object, TweenInfo.new(duration or 0.3, Enum.EasingStyle.Quad), {Transparency = 0})
        tween:Play()
        
        if callback then
            tween.Completed:Connect(callback)
        end
        
        return tween
    end,
    
    FadeOut = function(object, duration, callback)
        local tween = TweenService:Create(object, TweenInfo.new(duration or 0.3, Enum.EasingStyle.Quad), {Transparency = 1})
        tween:Play()
        
        if callback then
            tween.Completed:Connect(callback)
        end
        
        return tween
    end,
    
    SlideIn = function(object, direction, duration, callback)
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
        local tween = TweenService:Create(object, TweenInfo.new(duration or 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = originalPos})
        tween:Play()
        
        if callback then
            tween.Completed:Connect(callback)
        end
        
        return tween
    end,
    
    Bounce = function(object, intensity, duration, callback)
        intensity = intensity or 10
        duration = duration or 0.1
        
        local originalSize = object.Size
        local tween1 = TweenService:Create(object, TweenInfo.new(duration, Enum.EasingStyle.Quad), {
            Size = originalSize + UDim2.new(0, intensity, 0, intensity)
        })
        
        tween1:Play()
        tween1.Completed:Connect(function()
            local tween2 = TweenService:Create(object, TweenInfo.new(duration, Enum.EasingStyle.Quad), {
                Size = originalSize
            })
            tween2:Play()
            
            if callback then
                tween2.Completed:Connect(callback)
            end
        end)
        
        return tween1
    end,
    
    Shake = function(object, intensity, duration, callback)
        intensity = intensity or 5
        duration = duration or 0.5
        
        local originalPos = object.Position
        local connection
        local elapsed = 0
        
        connection = RunService.Heartbeat:Connect(function(dt)
            elapsed = elapsed + dt
            if elapsed >= duration then
                object.Position = originalPos
                connection:Disconnect()
                if callback then callback() end
                return
            end
            
            local x = math.random(-intensity, intensity)
            local y = math.random(-intensity, intensity)
            object.Position = originalPos + UDim2.new(0, x, 0, y)
        end)
        
        return connection
    end,
    
    Pulse = function(object, scale, duration, callback)
        scale = scale or 1.1
        duration = duration or 0.5
        
        local originalSize = object.Size
        local tween1 = TweenService:Create(object, TweenInfo.new(duration/2, Enum.EasingStyle.Sine), {
            Size = originalSize * scale
        })
        
        tween1:Play()
        tween1.Completed:Connect(function()
            local tween2 = TweenService:Create(object, TweenInfo.new(duration/2, Enum.EasingStyle.Sine), {
                Size = originalSize
            })
            tween2:Play()
            
            if callback then
                tween2.Completed:Connect(callback)
            end
        end)
        
        return tween1
    end
}

-- Particle System for Enhanced Effects
LRDLibrary.Particles = {
    CreateConfetti = function(parent, count, colors)
        count = count or 20
        colors = colors or {
            Color3.fromRGB(255, 100, 150),
            Color3.fromRGB(138, 43, 226),
            Color3.fromRGB(52, 152, 219),
            Color3.fromRGB(46, 204, 113),
            Color3.fromRGB(241, 196, 15)
        }
        
        for i = 1, count do
            local particle = Instance.new("Frame")
            particle.Size = UDim2.new(0, math.random(4, 8), 0, math.random(4, 8))
            particle.Position = UDim2.new(math.random(), 0, -0.1, 0)
            particle.BackgroundColor3 = colors[math.random(1, #colors)]
            particle.BorderSizePixel = 0
            particle.Parent = parent
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 2)
            corner.Parent = particle
            
            -- Animate particle
            local endY = math.random(110, 130) / 100
            local endX = particle.Position.X.Scale + (math.random(-20, 20) / 100)
            
            local tween = TweenService:Create(particle, TweenInfo.new(
                math.random(15, 25) / 10,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ), {
                Position = UDim2.new(endX, 0, endY, 0),
                Rotation = math.random(-180, 180)
            })
            
            tween:Play()
            tween.Completed:Connect(function()
                particle:Destroy()
            end)
        end
    end,
    
    CreateRipple = function(parent, position, color)
        local ripple = Instance.new("Frame")
        ripple.Size = UDim2.new(0, 0, 0, 0)
        ripple.Position = position
        ripple.BackgroundColor3 = color or LRDLibrary.Theme.Primary
        ripple.BackgroundTransparency = 0.5
        ripple.BorderSizePixel = 0
        ripple.ZIndex = parent.ZIndex + 1
        ripple.Parent = parent
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = ripple
        
        local maxSize = math.max(parent.AbsoluteSize.X, parent.AbsoluteSize.Y) * 2
        
        local tween = TweenService:Create(ripple, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, maxSize, 0, maxSize),
            Position = UDim2.new(position.X.Scale, position.X.Offset - maxSize/2, position.Y.Scale, position.Y.Offset - maxSize/2),
            BackgroundTransparency = 1
        })
        
        tween:Play()
        tween.Completed:Connect(function()
            ripple:Destroy()
        end)
        
        return ripple
    end
}

-- Advanced utility functions
local function playSound(soundId, volume, pitch)
    if not LRDLibrary.Config.SoundEnabled then return end
    
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = volume or 0.3
    sound.Pitch = pitch or 1
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

local function interpolateColor(color1, color2, t)
    return Color3.new(
        lerp(color1.R, color2.R, t),
        lerp(color1.G, color2.G, t),
        lerp(color1.B, color2.B, t)
    )
end

-- Enhanced GUI Creation Functions
local function createScreenGui(name)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 100
    
    if LRDLibrary.Config.BlurBackground then
        local blur = Instance.new("BlurEffect")
        blur.Size = 15
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
    label.Font = Enum.Font.GothamBold
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

-- Enhanced UI Element Creation
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

local function addShadow(parent, size, transparency, color)
    local shadow = createFrame({
        Name = "DropShadow",
        Size = UDim2.new(1, size or 20, 1, size or 20),
        Position = UDim2.new(0, -(size or 20)/2, 0, -(size or 20)/2),
        BackgroundColor3 = color or Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = transparency or 0.7,
        ZIndex = parent.ZIndex - 1,
        Parent = parent.Parent
    })
    addCorner(shadow, (size or 20)/2)
    return shadow
end

local function addGlassmorphism(parent, transparency, blur)
    if not LRDLibrary.Config.GlassmorphismEnabled then return end
    
    transparency = transparency or 0.1
    blur = blur or 10
    
    -- Create glass effect background
    local glassFrame = createFrame({
        Name = "GlassEffect",
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = LRDLibrary.Theme.BackgroundGlass,
        BackgroundTransparency = transparency,
        ZIndex = parent.ZIndex - 1,
        Parent = parent
    })
    
    addCorner(glassFrame, 12)
    addStroke(glassFrame, Color3.fromRGB(255, 255, 255), 1, 0.8)
    
    return glassFrame
end

local function addRippleEffect(parent)
    if not LRDLibrary.Config.RippleEffects then return end
    
    parent.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mousePos = UserInputService:GetMouseLocation()
            local parentPos = parent.AbsolutePosition
            local parentSize = parent.AbsoluteSize
            
            local relativeX = (mousePos.X - parentPos.X) / parentSize.X
            local relativeY = (mousePos.Y - parentPos.Y) / parentSize.Y
            
            LRDLibrary.Particles.CreateRipple(parent, UDim2.new(relativeX, 0, relativeY, 0), LRDLibrary.Theme.Primary)
        end
    end)
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
    addGlassmorphism(notification, 0.05)

    -- Icon with glow effect
    local iconFrame = createFrame({
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 20, 0, 20),
        BackgroundColor3 = typeColors[notificationType] or LRDLibrary.Theme.Primary,
        Parent = notification
    })
    addCorner(iconFrame, 20)
    
    local iconLabel = createTextLabel({
        Size = UDim2.new(1, 0, 1, 0),
        Text = notificationType == "Success" and "✓" or notificationType == "Warning" and "⚠" or notificationType == "Error" and "✕" or "ℹ",
        TextSize = 20,
        Font = Enum.Font.GothamBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Parent = iconFrame
    })

    -- Title with enhanced typography
    local title = createTextLabel({
        Size = UDim2.new(1, -100, 0, 30),
        Position = UDim2.new(0, 75, 0, 15),
        Text = settings.Title or "Notification",
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = notification
    })

    -- Content with better spacing
    local content = createTextLabel({
        Size = UDim2.new(1, -75, 0, 60),
        Position = UDim2.new(0, 75, 0, 45),
        Text = settings.Content or "No content provided",
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
        Parent = notification
    })

    -- Enhanced close button
    local closeButton = createTextButton({
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -40, 0, 10),
        Text = "×",
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BackgroundTransparency = 0.3,
        Parent = notification
    })
    addCorner(closeButton, 15)

    -- Progress bar with gradient
    local progressBar = createFrame({
        Size = UDim2.new(1, 0, 0, 4),
        Position = UDim2.new(0, 0, 1, -4),
        BackgroundColor3 = typeColors[notificationType] or LRDLibrary.Theme.Primary,
        BorderSizePixel = 0,
        Parent = notification
    })
    addCorner(progressBar, 2)
    addGradient(progressBar, ColorSequence.new{
        ColorSequenceKeypoint.new(0, typeColors[notificationType] or LRDLibrary.Theme.Primary),
        ColorSequenceKeypoint.new(1, typeColors[notificationType] or LRDLibrary.Theme.PrimaryHover)
    }, 90)

    -- Enhanced animations
    notification.Position = UDim2.new(1, 50, 0, 0)
    LRDLibrary.Animations.SlideIn(notification, "Left", 0.6)
    LRDLibrary.Animations.Spring(iconFrame, {Size = UDim2.new(0, 40, 0, 40)}, 0.6, 8)

    -- Sound with variation
    local soundVariation = math.random(80, 120) / 100
    playSound(LRDLibrary.Sounds.Notification, 0.4, soundVariation)

    -- Auto-remove with smooth animation
    local duration = settings.Duration or 6
    local startTime = tick()
    
    local connection
    connection = RunService.Heartbeat:Connect(function()
        local elapsed = tick() - startTime
        local progress = elapsed / duration
        
        if progress >= 1 then
            connection:Disconnect()
            
            LRDLibrary.Animations.SlideIn(notification, "Right", 0.4)
            LRDLibrary.Animations.FadeOut(notification, 0.4, function()
                notification:Destroy()
            end)
            
            -- Remove from notifications table
            for i, notif in ipairs(notifications) do
                if notif.id == notificationId then
                    table.remove(notifications, i)
                    break
                end
            end
        else
            progressBar.Size = UDim2.new(1 - progress, 0, 0, 4)
        end
    end)

    -- Close button functionality with animation
    closeButton.MouseButton1Click:Connect(function()
        connection:Disconnect()
        
        LRDLibrary.Animations.Bounce(closeButton, 5, 0.1)
        playSound(LRDLibrary.Sounds.Click, 0.3)
        
        LRDLibrary.Animations.SlideIn(notification, "Right", 0.4)
        LRDLibrary.Animations.FadeOut(notification, 0.4, function()
            notification:Destroy()
        end)
        
        for i, notif in ipairs(notifications) do
            if notif.id == notificationId then
                table.remove(notifications, i)
                break
            end
        end
    end)

    -- Hover effects
    closeButton.MouseEnter:Connect(function()
        tween(closeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.1})
    end)

    closeButton.MouseLeave:Connect(function()
        tween(closeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.3})
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

-- Enhanced Tooltip System
function LRDLibrary:CreateTooltip(parent, text, delay)
    if not LRDLibrary.Config.Tooltips then return end
    
    local tooltip = createFrame({
        Name = "Tooltip",
        Size = UDim2.new(0, 0, 0, 35),
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 1000,
        Parent = createScreenGui("LRD_Tooltip")
    })
    
    addCorner(tooltip, 8)
    addStroke(tooltip, LRDLibrary.Theme.ElementStroke, 1, 0.5)
    addShadow(tooltip, 10, 0.6)
    addGlassmorphism(tooltip, 0.1)

    local label = createTextLabel({
        Size = UDim2.new(1, -16, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        Text = text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = tooltip
    })

    -- Calculate text size for better fitting
    local textBounds = TextService:GetTextSize(text, 13, Enum.Font.Gotham, Vector2.new(math.huge, 35))
    tooltip.Size = UDim2.new(0, textBounds.X + 20, 0, 35)

    local hoverConnection
    local leaveConnection
    local showTimer

    hoverConnection = parent.MouseEnter:Connect(function()
        showTimer = task.delay(delay or 0.8, function()
            local mousePos = UserInputService:GetMouseLocation()
            tooltip.Position = UDim2.new(0, mousePos.X + 15, 0, mousePos.Y - 45)
            tooltip.Visible = true
            
            LRDLibrary.Animations.FadeIn(tooltip, 0.3)
            LRDLibrary.Animations.Spring(tooltip, {Size = tooltip.Size}, 0.7, 6)
        end)
    end)

    leaveConnection = parent.MouseLeave:Connect(function()
        if showTimer then
            task.cancel(showTimer)
        end
        
        if tooltip.Visible then
            LRDLibrary.Animations.FadeOut(tooltip, 0.2, function()
                tooltip.Visible = false
            end)
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
        AnimationSpeed = LRDLibrary.Config.AnimationSpeed,
        RippleEffects = LRDLibrary.Config.RippleEffects,
        ParticleEffects = LRDLibrary.Config.ParticleEffects,
        GlassmorphismEnabled = LRDLibrary.Config.GlassmorphismEnabled
    }
    
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

    -- Create main GUI with enhanced effects
    local screenGui = createScreenGui("LRD_Interface_" .. generateUUID())

    -- Main frame with glassmorphism
    local mainFrame = createFrame({
        Name = "MainFrame",
        Size = UDim2.new(0, settings.Size and settings.Size.X or 750, 0, settings.Size and settings.Size.Y or 550),
        Position = UDim2.new(0.5, -(settings.Size and settings.Size.X or 750)/2, 0.5, -(settings.Size and settings.Size.Y or 550)/2),
        BackgroundColor3 = LRDLibrary.Theme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = screenGui
    })

    addCorner(mainFrame, 20)
    addShadow(mainFrame, 40, 0.3)
    addGlassmorphism(mainFrame, 0.05)

    -- Enhanced topbar with gradient
    local topbar = createFrame({
        Name = "Topbar",
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = LRDLibrary.Theme.Topbar,
        BorderSizePixel = 0,
        Parent = mainFrame
    })
    addCorner(topbar, 20)
    addGradient(topbar, ColorSequence.new{
        ColorSequenceKeypoint.new(0, LRDLibrary.Theme.Topbar),
        ColorSequenceKeypoint.new(1, LRDLibrary.Theme.SecondaryBackground)
    }, 90)

    -- Window icon with glow
    local windowIcon = createFrame({
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(0, 25, 0.5, -17.5),
        BackgroundColor3 = LRDLibrary.Theme.Primary,
        Parent = topbar
    })
    addCorner(windowIcon, 17.5)

    local iconText = createTextLabel({
        Size = UDim2.new(1, 0, 1, 0),
        Text = "⚡",
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Parent = windowIcon
    })

    -- Enhanced title
    local title = createTextLabel({
        Size = UDim2.new(1, -250, 1, 0),
        Position = UDim2.new(0, 75, 0, 0),
        Text = Window.Name,
        TextSize = 20,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = topbar
    })

    local subtitle = createTextLabel({
        Size = UDim2.new(1, -250, 0, 20),
        Position = UDim2.new(0, 75, 0, 35),
        Text = "Premium Edition v" .. LRDLibrary.Version,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
        Parent = topbar
    })

    -- Enhanced window controls
    local controlsFrame = createFrame({
        Size = UDim2.new(0, 140, 0, 35),
        Position = UDim2.new(1, -160, 0.5, -17.5),
        BackgroundTransparency = 1,
        Parent = topbar
    })

    local function createControlButton(text, color, position)
        local button = createTextButton({
            Size = UDim2.new(0, 35, 0, 35),
            Position = position,
            Text = text,
            TextSize = 16,
            Font = Enum.Font.GothamBold,
            BackgroundColor3 = color,
            Parent = controlsFrame
        })
        addCorner(button, 17.5)
        addRippleEffect(button)
        
        button.MouseEnter:Connect(function()
            LRDLibrary.Animations.Spring(button, {Size = UDim2.new(0, 38, 0, 38)}, 0.7, 8)
            tween(button, TweenInfo.new(0.2), {BackgroundTransparency = 0.1})
        end)
        
        button.MouseLeave:Connect(function()
            LRDLibrary.Animations.Spring(button, {Size = UDim2.new(0, 35, 0, 35)}, 0.7, 8)
            tween(button, TweenInfo.new(0.2), {BackgroundTransparency = 0})
        end)
        
        return button
    end

    local minimizeButton = createControlButton("−", LRDLibrary.Theme.ElementBackground, UDim2.new(0, 0, 0, 0))
    local settingsButton = createControlButton("⚙", LRDLibrary.Theme.ElementBackground, UDim2.new(0, 40, 0, 0))
    local closeButton = createControlButton("×", LRDLibrary.Theme.Error, UDim2.new(0, 80, 0, 0))

    -- Enhanced tab container
    local tabContainer = createFrame({
        Name = "TabContainer",
        Size = UDim2.new(0, 200, 1, -80),
        Position = UDim2.new(0, 15, 0, 80),
        BackgroundColor3 = LRDLibrary.Theme.SecondaryBackground,
        BorderSizePixel = 0,
        Parent = mainFrame
    })
    addCorner(tabContainer, 15)
    addGlassmorphism(tabContainer, 0.1)

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
    tabLayout.Padding = UDim.new(0, 10)
    tabLayout.Parent = tabScrollFrame

    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingTop = UDim.new(0, 20)
    tabPadding.PaddingLeft = UDim.new(0, 20)
    tabPadding.PaddingRight = UDim.new(0, 20)
    tabPadding.Parent = tabScrollFrame

    -- Enhanced content container
    local contentContainer = createFrame({
        Name = "ContentContainer",
        Size = UDim2.new(1, -235, 1, -80),
        Position = UDim2.new(0, 225, 0, 80),
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
            
            playSound(LRDLibrary.Sounds.Click, 0.2)
            LRDLibrary.Animations.Spring(mainFrame, {Size = mainFrame.Size * 0.98}, 0.8, 10)
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
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
            dragging = false
            LRDLibrary.Animations.Spring(mainFrame, {Size = mainFrame.Size / 0.98}, 0.8, 10)
        end
    end)

    -- Enhanced window control functionality
    local minimized = false
    local originalSize = mainFrame.Size

    minimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        
        playSound(LRDLibrary.Sounds.Whoosh, 0.3)
        
        if minimized then
            LRDLibrary.Animations.Spring(mainFrame, {
                Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 70)
            }, 0.6, 6)
            minimizeButton.Text = "□"
        else
            LRDLibrary.Animations.Spring(mainFrame, {
                Size = originalSize
            }, 0.6, 6)
            minimizeButton.Text = "−"
        end
    end)

    closeButton.MouseButton1Click:Connect(function()
        playSound(LRDLibrary.Sounds.Pop, 0.4)
        
        if LRDLibrary.Config.ParticleEffects then
            LRDLibrary.Particles.CreateConfetti(mainFrame, 15)
        end
        
        LRDLibrary.Animations.Spring(mainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.8, 8)
        LRDLibrary.Animations.FadeOut(mainFrame, 0.5, function()
            screenGui:Destroy()
        end)
    end)

    -- Tab management with enhanced animations
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
            Size = UDim2.new(1, 0, 0, 55),
            BackgroundColor3 = LRDLibrary.Theme.TabBackground,
            Text = "",
            LayoutOrder = tabCount,
            Parent = tabScrollFrame
        })
        addCorner(tabButton, 12)
        addRippleEffect(tabButton)
        addGlassmorphism(tabButton, 0.1)

        -- Tab icon with enhanced styling
        local tabIcon = createFrame({
            Size = UDim2.new(0, 30, 0, 30),
            Position = UDim2.new(0, 15, 0.5, -15),
            BackgroundColor3 = LRDLibrary.Theme.Primary,
            Parent = tabButton
        })
        addCorner(tabIcon, 15)

        local iconText = createTextLabel({
            Size = UDim2.new(1, 0, 1, 0),
            Text = settings.Icon or "📄",
            TextSize = 16,
            Font = Enum.Font.GothamBold,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Parent = tabIcon
        })

        -- Enhanced tab label
        local tabLabel = createTextLabel({
            Size = UDim2.new(1, -60, 1, 0),
            Position = UDim2.new(0, 55, 0, 0),
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

        -- Auto-resize content
        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 40)
        end)

        -- Enhanced tab selection with animations
        tabButton.MouseButton1Click:Connect(function()
            if currentTab then
                currentTab.content.Visible = false
                tween(currentTab.button, TweenInfo.new(0.3), {BackgroundColor3 = LRDLibrary.Theme.TabBackground})
                tween(currentTab.label, TweenInfo.new(0.3), {TextColor3 = LRDLibrary.Theme.SecondaryTextColor})
                tween(currentTab.icon, TweenInfo.new(0.3), {BackgroundColor3 = LRDLibrary.Theme.Secondary})
            end

            currentTab = {
                content = tabContent,
                button = tabButton,
                label = tabLabel,
                icon = tabIcon
            }
            
            tabContent.Visible = true
            tween(tabButton, TweenInfo.new(0.3), {BackgroundColor3 = LRDLibrary.Theme.TabBackgroundSelected})
            tween(tabLabel, TweenInfo.new(0.3), {TextColor3 = LRDLibrary.Theme.TextColor})
            tween(tabIcon, TweenInfo.new(0.3), {BackgroundColor3 = LRDLibrary.Theme.Primary})
            
            LRDLibrary.Animations.Spring(tabIcon, {Size = UDim2.new(0, 32, 0, 32)}, 0.7, 8)
            task.wait(0.1)
            LRDLibrary.Animations.Spring(tabIcon, {Size = UDim2.new(0, 30, 0, 30)}, 0.7, 8)
            
            playSound(LRDLibrary.Sounds.Tab, 0.3)
        end)

        -- Enhanced hover effects
        tabButton.MouseEnter:Connect(function()
            if currentTab and currentTab.button ~= tabButton then
                tween(tabButton, TweenInfo.new(0.2), {BackgroundColor3 = LRDLibrary.Theme.ElementBackgroundHover})
                LRDLibrary.Animations.Spring(tabIcon, {Size = UDim2.new(0, 32, 0, 32)}, 0.8, 10)
            end
        end)

        tabButton.MouseLeave:Connect(function()
            if currentTab and currentTab.button ~= tabButton then
                tween(tabButton, TweenInfo.new(0.2), {BackgroundColor3 = LRDLibrary.Theme.TabBackground})
                LRDLibrary.Animations.Spring(tabIcon, {Size = UDim2.new(0, 30, 0, 30)}, 0.8, 10)
            end
        end)

        -- Auto-select first tab
        if not currentTab then
            task.wait(0.1)
            tabButton.MouseButton1Click()
        end

        -- Add tooltip
        if settings.Tooltip then
            LRDLibrary:CreateTooltip(tabButton, settings.Tooltip)
        end

        Window.Tabs[tabName] = Tab

        -- Enhanced Tab Functions
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
                Size = UDim2.new(1, 0, 0, 35),
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
            addCorner(sectionLine, 1.5)
            addGradient(sectionLine)

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, 0, 0, 18),
                    Position = UDim2.new(0, 0, 0, 35),
                    Text = settings.Description,
                    TextSize = 13,
                    Font = Enum.Font.Gotham,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = sectionFrame
                })
                
                sectionFrame.Size = UDim2.new(1, 0, 0, 75)
                sectionLine.Position = UDim2.new(0, 0, 0, 55)
            end

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
            addRippleEffect(buttonFrame)
            addGlassmorphism(buttonFrame, 0.1)

            local button = createTextButton({
                Size = UDim2.new(1, 0, 1, 0),
                Text = buttonName,
                TextSize = 15,
                Font = Enum.Font.GothamBold,
                Parent = buttonFrame
            })

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -20, 0, 18),
                    Position = UDim2.new(0, 10, 0, 30),
                    Text = settings.Description,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
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
                LRDLibrary.Animations.Spring(buttonFrame, {Size = buttonFrame.Size + UDim2.new(0, 4, 0, 2)}, 0.7, 8)
                tween(buttonFrame, TweenInfo.new(0.2), {BackgroundColor3 = LRDLibrary.Theme.ElementBackgroundHover})
                playSound(LRDLibrary.Sounds.Hover, 0.2)
            end)

            button.MouseLeave:Connect(function()
                LRDLibrary.Animations.Spring(buttonFrame, {Size = buttonFrame.Size - UDim2.new(0, 4, 0, 2)}, 0.7, 8)
                tween(buttonFrame, TweenInfo.new(0.2), {BackgroundColor3 = LRDLibrary.Theme.ElementBackground})
            end)

            button.MouseButton1Click:Connect(function()
                LRDLibrary.Animations.Bounce(buttonFrame, 8, 0.1)
                playSound(LRDLibrary.Sounds.Click, 0.4)
                
                if LRDLibrary.Config.ParticleEffects then
                    LRDLibrary.Particles.CreateConfetti(buttonFrame, 8)
                end
                
                if settings.Callback then
                    local success, error = pcall(settings.Callback)
                    if not success and LRDLibrary.Config.DebugMode then
                        LRDLibrary:Notify({
                            Title = "Error",
                            Content = "Button callback failed: " .. tostring(error),
                            Type = "Error",
                            Duration = 4
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
                Size = UDim2.new(1, 0, 0, 50),
                BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
                BorderSizePixel = 0,
                LayoutOrder = elementCount,
                Parent = tabContent
            })
            addCorner(toggleFrame, 12)
            addStroke(toggleFrame, LRDLibrary.Theme.ElementStroke, 1, 0.5)
            addGlassmorphism(toggleFrame, 0.1)

            local label = createTextLabel({
                Size = UDim2.new(1, -80, 1, 0),
                Position = UDim2.new(0, 20, 0, 0),
                Text = toggleName,
                TextSize = 15,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = toggleFrame
            })

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -80, 0, 18),
                    Position = UDim2.new(0, 20, 0, 30),
                    Text = settings.Description,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = toggleFrame
                })
                
                label.Size = UDim2.new(1, -80, 0, 25)
                label.Position = UDim2.new(0, 20, 0, 5)
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

            button.MouseButton1Click:Connect(function()
                currentValue = not currentValue

                local newToggleColor = currentValue and LRDLibrary.Theme.ToggleEnabled or LRDLibrary.Theme.ToggleDisabled
                local newPosition = currentValue and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)

                LRDLibrary.Animations.Spring(toggleBackground, {BackgroundColor3 = newToggleColor}, 0.6, 8)
                LRDLibrary.Animations.Spring(toggleIndicator, {Position = newPosition}, 0.8, 10)

                playSound(LRDLibrary.Sounds.Toggle, 0.4)

                if settings.Callback then
                    local success, error = pcall(settings.Callback, currentValue)
                    if not success and LRDLibrary.Config.DebugMode then
                        LRDLibrary:Notify({
                            Title = "Error",
                            Content = "Toggle callback failed: " .. tostring(error),
                            Type = "Error",
                            Duration = 4
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
                local newPosition = currentValue and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)

                LRDLibrary.Animations.Spring(toggleBackground, {BackgroundColor3 = newToggleColor}, 0.6, 8)
                LRDLibrary.Animations.Spring(toggleIndicator, {Position = newPosition}, 0.8, 10)
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
            addGlassmorphism(sliderFrame, 0.1)

            local label = createTextLabel({
                Size = UDim2.new(1, -100, 0, 30),
                Position = UDim2.new(0, 20, 0, 10),
                Text = sliderName,
                TextSize = 15,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = sliderFrame
            })

            local valueLabel = createTextLabel({
                Size = UDim2.new(0, 80, 0, 30),
                Position = UDim2.new(1, -90, 0, 10),
                Text = tostring(currentValue),
                TextSize = 15,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextColor3 = LRDLibrary.Theme.Primary,
                Parent = sliderFrame
            })

            local sliderTrack = createFrame({
                Size = UDim2.new(1, -40, 0, 10),
                Position = UDim2.new(0, 20, 0, 50),
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

            local sliderHandle = createFrame({
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(0, -10, 0.5, -10),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Parent = sliderFill
            })
            addCorner(sliderHandle, 10)
            addShadow(sliderHandle, 8, 0.4)

            if settings.Description then
                local description = createTextLabel({
                    Size = UDim2.new(1, -20, 0, 15),
                    Position = UDim2.new(0, 20, 0, 65),
                    Text = settings.Description,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
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
                
                LRDLibrary.Animations.Spring(sliderFill, {Size = UDim2.new(percentage, 0, 1, 0)}, 0.7, 8)
                valueLabel.Text = settings.Suffix and (tostring(currentValue) .. settings.Suffix) or tostring(currentValue)

                if settings.Callback then
                    local success, error = pcall(settings.Callback, currentValue)
                    if not success and LRDLibrary.Config.DebugMode then
                        LRDLibrary:Notify({
                            Title = "Error",
                            Content = "Slider callback failed: " .. tostring(error),
                            Type = "Error",
                            Duration = 4
                        })
                    end
                end
            end

            updateSlider(currentValue)

            sliderTrack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    playSound(LRDLibrary.Sounds.Slider, 0.3)
                    
                    LRDLibrary.Animations.Spring(sliderHandle, {Size = UDim2.new(0, 24, 0, 24)}, 0.8, 10)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
                    dragging = false
                    LRDLibrary.Animations.Spring(sliderHandle, {Size = UDim2.new(0, 20, 0, 20)}, 0.8, 10)
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

        return Tab
    end

    -- Enhanced loading screen
    local loadingFrame = createFrame({
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = LRDLibrary.Theme.Background,
        BorderSizePixel = 0,
        Parent = mainFrame
    })
    addCorner(loadingFrame, 20)

    local loadingIcon = createFrame({
        Size = UDim2.new(0, 60, 0, 60),
        Position = UDim2.new(0.5, -30, 0.5, -60),
        BackgroundColor3 = LRDLibrary.Theme.Primary,
        Parent = loadingFrame
    })
    addCorner(loadingIcon, 30)

    local loadingIconText = createTextLabel({
        Size = UDim2.new(1, 0, 1, 0),
        Text = "⚡",
        TextSize = 30,
        Font = Enum.Font.GothamBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Parent = loadingIcon
    })

    local loadingText = createTextLabel({
        Size = UDim2.new(1, 0, 0, 35),
        Position = UDim2.new(0, 0, 0.5, -10),
        Text = settings.LoadingTitle or "Loading LRD.dev Interface...",
        TextSize = 22,
        Font = Enum.Font.GothamBold,
        Parent = loadingFrame
    })

    local loadingSubtitle = createTextLabel({
        Size = UDim2.new(1, 0, 0, 25),
        Position = UDim2.new(0, 0, 0.5, 25),
        Text = settings.LoadingSubtitle or "Premium Edition v" .. LRDLibrary.Version,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextColor3 = LRDLibrary.Theme.SecondaryTextColor,
        Parent = loadingFrame
    })

    local loadingBar = createFrame({
        Size = UDim2.new(0, 250, 0, 6),
        Position = UDim2.new(0.5, -125, 0.5, 60),
        BackgroundColor3 = LRDLibrary.Theme.ElementBackground,
        BorderSizePixel = 0,
        Parent = loadingFrame
    })
    addCorner(loadingBar, 3)

    local loadingProgress = createFrame({
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = LRDLibrary.Theme.Primary,
        BorderSizePixel = 0,
        Parent = loadingBar
    })
    addCorner(loadingProgress, 3)
    addGradient(loadingProgress)

    -- Enhanced loading animations
    local spinTween = TweenService:Create(loadingIcon, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360})
    spinTween:Play()

    local pulseTween = TweenService:Create(loadingIcon, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Size = UDim2.new(0, 65, 0, 65)})
    pulseTween:Play()

    -- Animate loading progress
    local progressTween = tween(loadingProgress, TweenInfo.new(2.5, Enum.EasingStyle.Quad), {
        Size = UDim2.new(1, 0, 1, 0)
    })

    progressTween.Completed:Connect(function()
        spinTween:Cancel()
        pulseTween:Cancel()
        
        LRDLibrary.Animations.FadeOut(loadingFrame, 0.6, function()
            loadingFrame:Destroy()
        end)
        
        -- Show welcome notification
        if settings.WelcomeMessage ~= false then
            task.wait(0.3)
            LRDLibrary:Notify({
                Title = "Welcome to " .. Window.Name .. "!",
                Content = "Premium UI Library v" .. LRDLibrary.Version .. " loaded successfully",
                Type = "Success",
                Duration = 5
            })
        end
    end)

    -- Enhanced Window API
    function Window:SetTitle(title)
        Window.Name = title
        title.Text = title
    end

    function Window:SetSize(size)
        LRDLibrary.Animations.Spring(mainFrame, {Size = size}, 0.6, 6)
    end

    function Window:SetPosition(position)
        LRDLibrary.Animations.Spring(mainFrame, {Position = position}, 0.6, 6)
    end

    function Window:Destroy()
        LRDLibrary.Animations.Spring(mainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.8, 8)
        LRDLibrary.Animations.FadeOut(mainFrame, 0.5, function()
            screenGui:Destroy()
        end)
    end

    function Window:Hide()
        LRDLibrary.Animations.FadeOut(screenGui, 0.3)
    end

    function Window:Show()
        LRDLibrary.Animations.FadeIn(screenGui, 0.3)
    end

    function Window:ToggleVisibility()
        if screenGui.Enabled then
            Window:Hide()
        else
            Window:Show()
        end
    end

    return Window
end

-- Initialize the library
loadConfig()

return LRDLibrary
