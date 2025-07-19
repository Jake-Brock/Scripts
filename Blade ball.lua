local ContextActionService = game:GetService('ContextActionService')
local UserInputService = cloneref and cloneref(game:GetService('UserInputService')) or game:GetService('UserInputService')
local ContentProvider = cloneref and cloneref(game:GetService('ContentProvider')) or game:GetService('ContentProvider')
local TweenService = cloneref and cloneref(game:GetService('TweenService')) or game:GetService('TweenService')
local HttpService = cloneref and cloneref(game:GetService('HttpService')) or game:GetService('HttpService')
local TextService = cloneref and cloneref(game:GetService('TextService')) or game:GetService('TextService')
local RunService = cloneref and cloneref(game:GetService('RunService')) or game:GetService('RunService')
local Lighting = cloneref and cloneref(game:GetService('Lighting')) or game:GetService('Lighting')
local Players = cloneref and cloneref(game:GetService('Players')) or game:GetService('Players')
local CoreGui = cloneref and cloneref(game:GetService('CoreGui')) or game:GetService('CoreGui')
local Debris = cloneref and cloneref(game:GetService('Debris')) or game:GetService('Debris')
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService('GuiService')
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local clientCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local clientHumanoid = clientCharacter:FindFirstChildOfClass("Humanoid")
local AliveGroup = Workspace:FindFirstChild("Alive")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Hotbar = PlayerGui.Hotbar
local ParryCD = Hotbar.Block.UIGradient
local AbilityCD = Hotbar.Ability.UIGradient

-- Variables
local Phantom = false
local Tornado_Time = tick()
local Last_Input = UserInputService:GetLastInputType()
local Vector2_Mouse_Location = nil
local Grab_Parry = nil
local Parry_Remote = true
local Parry_Key = nil
local Parry_Arg = nil
local Speed_Divisor_Multiplier = 1.1
local LobbyAP_Speed_Divisor_Multiplier = 1.1
local firstParryFired = false
local ParryThreshold = 2.5
local firstParryType = 'F_Key'
local Previous_Positions = {}
local Parries = 0
local Lerp_Radians = 0
local Last_Warping = tick()
local Previous_Velocity = {}
local Curving = tick()
local Runtime = Workspace.Runtime
local Connections_Manager = {}
local Selected_Parry_Type = "Camera"
local Infinity = false
local Parried = false
local Last_Parry = 0
local AutoParry = true
local Balls = Workspace:WaitForChild('Balls')
local CurrentBall = nil
local InputTask = nil
local Cooldown = 0.02
local RunTime = Workspace:FindFirstChild("Runtime")
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
local StrafeSpeed = 36
local Training_Parried = false
local CosmeticsActive = false
local hit_Sound_Enabled = false
local headLoop = nil
local AutoManualSpamEnabled = false
local ManualSpamActive = false
local recentTargetChanges = {}
local ForceFieldActive = false
local CurrentForceField = nil
local AutoSpamAntiBallBounceEnabled = false
local SlashOfFuryDetection = false

-- Remote detection
task.spawn(function()
    for _, value in pairs(getgc()) do
        if type(value) == "function" and islclosure(value) then
            local protos = debug.getprotos(value)
            local upvalues = debug.getupvalues(value)
            local constants = debug.getconstants(value)
            if #protos == 4 and #upvalues == 24 and #constants >= 102 then
                Parry_Key = debug.getupvalue(value, 17)
                Parry_Remote = debug.getupvalue(value, 18)
                Parry_Arg = debug.getconstant(value, 64)
                break
            end
        end
    end
    if not Parry_Remote then
        warn("[Parry Remote Detection] Failed to find Parry_Remote")
    else
        print("[Parry Remote Detection] Success: Remote =", Parry_Remote and Parry_Remote.Name or "nil", "Key =", Parry_Key, "Arg =", Parry_Arg)
    end
end)

-- Utility functions
local function BlockMovement(actionName, inputState, inputObject)
    return Enum.ContextActionResult.Sink
end

local function updateNavigation(guiObject)
    GuiService.SelectedObject = guiObject
end

local function performFirstPress(parryType)
    if parryType == 'F_Key' then
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, nil)
    elseif parryType == 'Left_Click' then
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
    elseif parryType == 'Navigation' then
        local button = Players.LocalPlayer.PlayerGui.Hotbar.Block
        updateNavigation(button)
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        task.wait(0.01)
        updateNavigation(nil)
    end
end

if not LPH_OBFUSCATED then
    function LPH_JIT(Function) return Function end
    function LPH_JIT_MAX(Function) return Function end
    function LPH_NO_VIRTUALIZE(Function) return Function end
end

function create_animation(object, info, value)
    local animation = TweenService:Create(object, info, value)
    animation:Play()
    task.wait(info.Time)
    Debris:AddItem(animation, 0)
    animation:Destroy()
    animation = nil
end

-- Animation handling
local Animation = {}
Animation.storage = {}
Animation.current = nil
Animation.track = nil

for _, v in pairs(ReplicatedStorage.Misc.Emotes:GetChildren()) do
    if v:IsA("Animation") and v:GetAttribute("EmoteName") then
        local Emote_Name = v:GetAttribute("EmoteName")
        Animation.storage[Emote_Name] = v
    end
end

local Emotes_Data = {}
for Object in pairs(Animation.storage) do
    table.insert(Emotes_Data, Object)
end
table.sort(Emotes_Data)

-- Auto_Parry system
local Auto_Parry = {}

function Auto_Parry.Parry_Animation()
    local Parry_Animation = ReplicatedStorage.Shared.SwordAPI.Collection.Default:FindFirstChild('GrabParry')
    local Current_Sword = LocalPlayer.Character:GetAttribute('CurrentlyEquippedSword')
    if not Current_Sword or not Parry_Animation then return end
    local Sword_Data = ReplicatedStorage.Shared.ReplicatedInstances.Swords.GetSword:Invoke(Current_Sword)
    if not Sword_Data or not Sword_Data['AnimationType'] then return end
    for _, object in pairs(ReplicatedStorage.Shared.SwordAPI.Collection:GetChildren()) do
        if object.Name == Sword_Data['AnimationType'] then
            if object:FindFirstChild('GrabParry') or object:FindFirstChild('Grab') then
                local sword_animation_type = object:FindFirstChild('Grab') and 'Grab' or 'GrabParry'
                Parry_Animation = object[sword_animation_type]
            end
        end
    end
    Grab_Parry = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Parry_Animation)
    Grab_Parry:Play()
end

function Auto_Parry.Play_Animation(v)
    local Animations = Animation.storage[v]
    if not Animations then return false end
    local Animator = LocalPlayer.Character.Humanoid.Animator
    if Animation.track then Animation.track:Stop() end
    Animation.track = Animator:LoadAnimation(Animations)
    Animation.track:Play()
    Animation.current = v
end

function Auto_Parry.Get_Balls()
    local Balls = {}
    for _, Instance in pairs(Workspace.Balls:GetChildren()) do
        if Instance:GetAttribute('realBall') then
            Instance.CanCollide = false
            table.insert(Balls, Instance)
        end
    end
    return Balls
end

function Auto_Parry.Get_Ball()
    for _, Instance in pairs(Workspace.Balls:GetChildren()) do
        if Instance:GetAttribute('realBall') then
            Instance.CanCollide = false
            return Instance
        end
    end
end

function Auto_Parry.Lobby_Balls()
    for _, Instance in pairs(Workspace.TrainingBalls:GetChildren()) do
        if Instance:GetAttribute("realBall") then return Instance end
    end
end

local Closest_Entity = nil

function Auto_Parry.Closest_Player()
    local Max_Distance = math.huge
    local Found_Entity = nil
    for _, Entity in pairs(Workspace.Alive:GetChildren()) do
        if tostring(Entity) ~= tostring(LocalPlayer) then
            if Entity.PrimaryPart then
                local Distance = LocalPlayer:DistanceFromCharacter(Entity.PrimaryPart.Position)
                if Distance < Max_Distance then
                    Max_Distance = Distance
                    Found_Entity = Entity
                end
            end
        end
    end
    Closest_Entity = Found_Entity
    return Found_Entity
end

function Auto_Parry:Get_Entity_Properties()
    Auto_Parry.Closest_Player()
    if not Closest_Entity then return false end
    local Entity_Velocity = Closest_Entity.PrimaryPart.Velocity
    local Entity_Direction = (LocalPlayer.Character.PrimaryPart.Position - Closest_Entity.PrimaryPart.Position).Unit
    local Entity_Distance = (LocalPlayer.Character.PrimaryPart.Position - Closest_Entity.PrimaryPart.Position).Magnitude
    return {
        Velocity = Entity_Velocity,
        Direction = Entity_Direction,
        Distance = Entity_Distance
    }
end

function Auto_Parry.Parry_Data(Parry_Type)
    Auto_Parry.Closest_Player()
    local Events = {}
    local Camera = Workspace.CurrentCamera
    local Vector2_Mouse_Location
    if Last_Input == Enum.UserInputType.MouseButton1 or Last_Input == Enum.UserInputType.MouseButton2 or Last_Input == Enum.UserInputType.Keyboard then
        local Mouse_Location = UserInputService:GetMouseLocation()
        Vector2_Mouse_Location = {Mouse_Location.X, Mouse_Location.Y}
    else
        Vector2_Mouse_Location = {Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2}
    end
    if isMobile then
        Vector2_Mouse_Location = {Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2}
    end
    local Players_Screen_Positions = {}
    for _, v in pairs(Workspace.Alive:GetChildren()) do
        if v ~= LocalPlayer.Character then
            local worldPos = v.PrimaryPart.Position
            local screenPos, isOnScreen = Camera:WorldToScreenPoint(worldPos)
            if isOnScreen then
                Players_Screen_Positions[v] = Vector2.new(screenPos.X, screenPos.Y)
            end
            Events[tostring(v)] = screenPos
        end
    end
    if Parry_Type == 'Camera' then
        return {0, Camera.CFrame, Events, Vector2_Mouse_Location}
    elseif Parry_Type == 'Backwards' then
        local Backwards_Direction = Camera.CFrame.LookVector * -10000
        Backwards_Direction = Vector3.new(Backwards_Direction.X, 0, Backwards_Direction.Z)
        return {0, CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + Backwards_Direction), Events, Vector2_Mouse_Location}
    elseif Parry_Type == 'Straight' then
        local Aimed_Player = nil
        local Closest_Distance = math.huge
        local Mouse_Vector = Vector2.new(Vector2_Mouse_Location[1], Vector2_Mouse_Location[2])
        for _, v in pairs(Workspace.Alive:GetChildren()) do
            if v ~= LocalPlayer.Character then
                local worldPos = v.PrimaryPart.Position
                local screenPos, isOnScreen = Camera:WorldToScreenPoint(worldPos)
                if isOnScreen then
                    local playerScreenPos = Vector2.new(screenPos.X, screenPos.Y)
                    local distance = (Mouse_Vector - playerScreenPos).Magnitude
                    if distance < Closest_Distance then
                        Closest_Distance = distance
                        Aimed_Player = v
                    end
                end
            end
        end
        if Aimed_Player then
            return {0, CFrame.new(LocalPlayer.Character.PrimaryPart.Position, Aimed_Player.PrimaryPart.Position), Events, Vector2_Mouse_Location}
        else
            return {0, CFrame.new(LocalPlayer.Character.PrimaryPart.Position, Closest_Entity and Closest_Entity.PrimaryPart.Position or LocalPlayer.Character.PrimaryPart.Position), Events, Vector2_Mouse_Location}
        end
    elseif Parry_Type == 'Random' then
        return {0, CFrame.new(Camera.CFrame.Position, Vector3.new(math.random(-4000, 4000), math.random(-4000, 4000), math.random(-4000, 4000))), Events, Vector2_Mouse_Location}
    elseif Parry_Type == 'High' then
        local High_Direction = Camera.CFrame.UpVector * 10000
        return {0, CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + High_Direction), Events, Vector2_Mouse_Location}
    elseif Parry_Type == 'Left' then
        local Left_Direction = Camera.CFrame.RightVector * 10000
        return {0, CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Left_Direction), Events, Vector2_Mouse_Location}
    elseif Parry_Type == 'Right' then
        local Right_Direction = Camera.CFrame.RightVector * 10000
        return {0, CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + Right_Direction), Events, Vector2_Mouse_Location}
    elseif Parry_Type == 'RandomTarget' then
        local candidates = {}
        for _, v in pairs(Workspace.Alive:GetChildren()) do
            if v ~= LocalPlayer.Character and v.PrimaryPart then
                local screenPos, isOnScreen = Camera:WorldToScreenPoint(v.PrimaryPart.Position)
                if isOnScreen then
                    table.insert(candidates, {
                        character = v,
                        screenXY = { screenPos.X, screenPos.Y }
                    })
                end
            end
        end
        if #candidates > 0 then
            local pick = candidates[math.random(1, #candidates)]
            local lookCFrame = CFrame.new(LocalPlayer.Character.PrimaryPart.Position, pick.character.PrimaryPart.Position)
            return {0, lookCFrame, Events, pick.screenXY}
        else
            return {0, Camera.CFrame, Events, { Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 }}
        end
    end
    return Parry_Type
end

function Auto_Parry.Parry(parryType)
    if not Parry_Remote then
        warn("[Auto_Parry.Parry] Parry_Remote is nil, cannot parry")
        return false
    end
    local Parry_Data = Auto_Parry.Parry_Data(parryType or Selected_Parry_Type)
    if not Parry_Data then
        warn("[Auto_Parry.Parry] Failed to get Parry_Data")
        return false
    end
    local Hash
    if type(Parry_Arg) == "string" and string.match(Parry_Arg, "PARRY_HASH_FAKE") then
        Hash = nil
    else
        Hash = Parry_Arg
    end
    local success, err = pcall(function()
        Parry_Remote:FireServer(Hash, Parry_Key, Parry_Data[1], Parry_Data[2], Parry_Data[3], Parry_Data[4])
    end)
    if not success then
        warn("[Auto_Parry.Parry] Failed to fire remote:", err)
        return false
    end
    if not firstParryFired then
        performFirstPress(firstParryType)
        firstParryFired = true
    end
    if Parries >= 7 then return false end
    Parries = Parries + 1
    task.delay(0.55, function()
        if Parries > 0 then Parries = Parries - 1 end
    end)
    return true
end

function Auto_Parry.Linear_Interpolation(a, b, time_volume)
    return a + (b - a) * time_volume
end

function Auto_Parry.Is_Curved()
    local Ball = Auto_Parry.Get_Ball()
    if not Ball then return false end
    local Zoomies = Ball:FindFirstChild('zoomies')
    if not Zoomies then return false end
    local Velocity = Zoomies.VectorVelocity
    local Ball_Direction = Velocity.Unit
    local Direction = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Unit
    local Dot = Direction:Dot(Ball_Direction)
    local Speed = Velocity.Magnitude
    local Speed_Threshold = math.min(Speed / 100, 40)
    local Direction_Difference = (Ball_Direction - Velocity).Unit
    local Direction_Similarity = Direction:Dot(Direction_Difference)
    local Dot_Difference = Dot - Direction_Similarity
    local Distance = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Magnitude
    local Pings = Stats.Network.ServerStatsItem['Data Ping']:GetValue()
    local Dot_Threshold = 0.5 - (Pings / 1000)
    local Reach_Time = Distance / Speed - (Pings / 1000)
    local Ball_Distance_Threshold = 15 - math.min(Distance / 1000, 15) + Speed_Threshold
    local Clamped_Dot = math.clamp(Dot, -1, 1)
    local Radians = math.rad(math.asin(Clamped_Dot))
    Lerp_Radians = Auto_Parry.Linear_Interpolation(Lerp_Radians, Radians, 0.8)
    if Speed > 100 and Reach_Time > Pings / 10 then
        Ball_Distance_Threshold = math.max(Ball_Distance_Threshold - 15, 15)
    end
    if Distance < Ball_Distance_Threshold then return false end
    if Dot_Difference < Dot_Threshold then return true end
    if Lerp_Radians < 0.018 then Last_Warping = tick() end
    if (tick() - Last_Warping) < (Reach_Time / 1.5) then return true end
    if (tick() - Curving) < (Reach_Time / 1.5) then return true end
    return Dot < Dot_Threshold
end

function Auto_Parry:Get_Ball_Properties()
    local Ball = Auto_Parry.Get_Ball()
    local Ball_Velocity = Vector3.zero
    local Ball_Origin = Ball
    local Ball_Direction = (LocalPlayer.Character.PrimaryPart.Position - Ball_Origin.Position).Unit
    local Ball_Distance = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Magnitude
    local Ball_Dot = Ball_Direction:Dot(Ball_Velocity.Unit)
    return {
        Velocity = Ball_Velocity,
        Direction = Ball_Direction,
        Distance = Ball_Distance,
        Dot = Ball_Dot
    }
end

function Auto_Parry.Spam_Service(self)
    local Ball = Auto_Parry.Get_Ball()
    local Entity = Auto_Parry.Closest_Player()
    if not Ball or not Entity or not Entity.PrimaryPart then
        print("[Debug Spam_Service] Falha: Ball ou Entity ausente")
        return false
    end
    local Spam_Accuracy = 0
    local Velocity = Ball.AssemblyLinearVelocity
    local Speed = Velocity.Magnitude
    local Direction = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Unit
    local Dot = Direction:Dot(Velocity.Unit)
    local Target_Position = Entity.PrimaryPart.Position
    local Target_Distance = LocalPlayer:DistanceFromCharacter(Target_Position)
    local Ball_Distance = LocalPlayer:DistanceFromCharacter(Ball.Position)
    local Maximum_Spam_Distance = self.Ping + math.min(Speed / 6, 100)
    local isMovingBackward = false
    local localHumanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    local entityHumanoid = Entity:FindFirstChild("Humanoid")
    if localHumanoid and entityHumanoid then
        local localMoveDir = localHumanoid.MoveDirection
        local entityMoveDir = entityHumanoid.MoveDirection
        local relativePos = (Target_Position - LocalPlayer.Character.PrimaryPart.Position).Unit
        if localMoveDir.Magnitude > 0 then
            local localDot = localMoveDir:Dot(relativePos)
            if localDot < -0.5 then
                isMovingBackward = true
            end
        end
        if entityMoveDir.Magnitude > 0 then
            local entityDot = entityMoveDir:Dot(-relativePos)
            if entityDot < -0.5 then
                isMovingBackward = true
            end
        end
    end
    if isMovingBackward then
        print("[Debug Spam_Service] Movimento para trás detectado, parando auto spam")
        return false
    end
    if self.Entity_Properties.Distance > Maximum_Spam_Distance or Ball_Distance > Maximum_Spam_Distance or Target_Distance > Maximum_Spam_Distance then
        print("[Debug Spam_Service] Distâncias excedem Maximum_Spam_Distance:", Maximum_Spam_Distance)
        return Spam_Accuracy
    end
    local Maximum_Speed = 5 - math.min(Speed / 6, 4)
    local Maximum_Dot = math.clamp(Dot, -1, 0) * Maximum_Speed
    Spam_Accuracy = Maximum_Spam_Distance - Maximum_Dot
    print("[Debug Spam_Service] Spam_Accuracy calculado:", Spam_Accuracy)
    return Spam_Accuracy
end

local function GetBall()
    for _, Ball in ipairs(Balls:GetChildren()) do
        if Ball:FindFirstChild("ff") then return Ball end
    end
    return nil
end

local function SpamInput()
    if InputTask then return end
    InputTask = task.spawn(function()
        while AutoParry do
            Auto_Parry.Parry(Selected_Parry_Type)
            task.wait(Cooldown)
        end
        InputTask = nil
    end)
end

local function isCooldownInEffect1(uigradient)
    return uigradient.Offset.Y < 0.4
end

local function isCooldownInEffect2(uigradient)
    return uigradient.Offset.Y == 0.5
end

local function cooldownProtection()
    if isCooldownInEffect1(ParryCD) then
        ReplicatedStorage.Remotes.AbilityButtonPress:Fire()
        return true
    end
    return false
end

local function AutoAbility()
    if isCooldownInEffect2(AbilityCD) then
        if LocalPlayer.Character.Abilities["Raging Deflection"].Enabled or LocalPlayer.Character.Abilities["Rapture"].Enabled or LocalPlayer.Character.Abilities["Calming Deflection"].Enabled or LocalPlayer.Character.Abilities["Aerodynamic Slash"].Enabled or LocalPlayer.Character.Abilities["Fracture"].Enabled or LocalPlayer.Character.Abilities["Death Slash"].Enabled then
            Parried = true
            ReplicatedStorage.Remotes.AbilityButtonPress:Fire()
            task.wait(2.432)
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DeathSlashShootActivation"):FireServer(true)
            return true
        end
    end
    return false
end

local function toggleManualSpam(activate)
    ManualSpamActive = activate
    local button = CoreGui:FindFirstChild("ManualSpamUI") and CoreGui.ManualSpamUI.MainFrame.ClashModeButton
    if button then
        if AutoManualSpamEnabled and not ManualSpamActive then
            button.Text = "Auto"
            button.TextColor3 = Color3.new(0, 0, 1)
        else
            button.Text = activate and "Stop" or "Clash Mode"
            button.TextColor3 = activate and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
        end
    end
    if activate then
        if not Connections_Manager['Manual Spam'] then
            Connections_Manager['Manual Spam'] = RunService.Heartbeat:Connect(function()
                Auto_Parry.Parry(Selected_Parry_Type)
            end)
        end
    else
        if Connections_Manager['Manual Spam'] then
            Connections_Manager['Manual Spam']:Disconnect()
            Connections_Manager['Manual Spam'] = nil
        end
    end
end

local function checkAutoManualSpam()
    if not AutoManualSpamEnabled then return end
    local Ball = Auto_Parry.Get_Ball()
    if not Ball then
        if ManualSpamActive then toggleManualSpam(false) end
        return
    end
    local Zoomies = Ball:FindFirstChild('zoomies')
    if not Zoomies then
        if ManualSpamActive then toggleManualSpam(false) end
        return
    end
    Auto_Parry.Closest_Player()
    local Ping = Stats.Network.ServerStatsItem['Data Ping']:GetValue()
    local Ping_Threshold = math.clamp(Ping / 10, 1, 16)
    local Ball_Target = Ball:GetAttribute('target')
    local Ball_Properties = Auto_Parry:Get_Ball_Properties()
    local Entity_Properties = Auto_Parry:Get_Entity_Properties()
    local Spam_Accuracy = Auto_Parry.Spam_Service({
        Ball_Properties = Ball_Properties,
        Entity_Properties = Entity_Properties,
        Ping = Ping_Threshold
    })
    local Target_Position = Closest_Entity and Closest_Entity.PrimaryPart.Position
    local Target_Distance = Target_Position and LocalPlayer:DistanceFromCharacter(Target_Position) or math.huge
    local Direction = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Unit
    local Ball_Direction = Zoomies.VectorVelocity.Unit
    local Dot = Direction:Dot(Ball_Direction)
    local Distance = LocalPlayer:DistanceFromCharacter(Ball.Position)
    local Pulsed = LocalPlayer.Character:GetAttribute('Pulsed')
    local FastSpamAccuracy = Spam_Accuracy * 0.8
    if Ball_Target and not Pulsed and Target_Distance <= FastSpamAccuracy and Distance <= FastSpamAccuracy and Parries <= ParryThreshold then
        if not ManualSpamActive then toggleManualSpam(true) end
    else
        if ManualSpamActive then toggleManualSpam(false) end
    end
end

local function wasLocalPlayerRecentTarget()
    local currentTime = tick()
    for i = #recentTargetChanges, 1, -1 do
        if currentTime - recentTargetChanges[i].time > 1 then
            table.remove(recentTargetChanges, i)
        elseif recentTargetChanges[i].target == tostring(LocalPlayer) then
            return true
        end
    end
    return false
end

local function getRecentTargetChanges()
    local currentTime = tick()
    local count = 0
    for i = #recentTargetChanges, 1, -1 do
        if currentTime - recentTargetChanges[i].time >= 1 then
            table.remove(recentTargetChanges, i)
        else
            count = count + 1
        end
    end
    return count
end

-- Fluent UI setup
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "River",
    SubTitle = "by JV.gg",
    TabWidth = 180,
    Size = UDim2.fromOffset(500, 300),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Parry", Icon = "shield" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "component" })
}

local Options = Fluent.Options

-- Main tab
local MainSection = Tabs.Main:AddSection("Parry")

MainSection:AddParagraph({
    Title = "NEWS",
    Content = "Made by Jvzada"
})

MainSection:AddToggle("AP", {
    Title = "Auto Parry",
    Default = false,
    Callback = function(value)
        if value then
            Connections_Manager['Auto Parry'] = RunService.PreSimulation:Connect(function()
                local One_Ball = Auto_Parry.Get_Ball()
                local Balls_Table = Auto_Parry.Get_Balls()
                for _, Ball in pairs(Balls_Table) do
                    if not Ball then return end
                    local Zoomies = Ball:FindFirstChild('zoomies')
                    if not Zoomies then return end
                    Ball:GetAttributeChangedSignal('target'):Once(function()
                        Parried = false
                    end)
                    if Parried then return end
                    local Ball_Target = Ball:GetAttribute('target')
                    local One_Target = One_Ball:GetAttribute('target')
                    local Velocity = Zoomies.VectorVelocity
                    local Distance = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Magnitude
                    local Ping = Stats.Network.ServerStatsItem['Data Ping']:GetValue() / 10
                    local Ping_Threshold = math.clamp(Ping / 10, 5, 17)
                    local Speed = Velocity.Magnitude
                    local cappedSpeedDiff = math.min(math.max(Speed - 9.5, 0), 650)
                    local speed_divisor_base = 2.4 + cappedSpeedDiff * 0.002
                    local effectiveMultiplier = Speed_Divisor_Multiplier
                    if getgenv().RandomParryAccuracyEnabled then
                        if Speed < 200 then
                            effectiveMultiplier = 0.7 + (math.random(40, 100) - 1) * (0.35 / 99)
                        else
                            effectiveMultiplier = 0.7 + (math.random(1, 100) - 1) * (0.35 / 99)
                        end
                    end
                    local speed_divisor = speed_divisor_base * effectiveMultiplier
                    local Parry_Accuracy = Ping_Threshold + math.max(Speed / speed_divisor, 9.5)
                    local Curved = Auto_Parry.Is_Curved()
                    if Phantom and LocalPlayer.Character:FindFirstChild('ParryHighlight') and getgenv().PhantomV2Detection then
                        ContextActionService:BindAction('BlockPlayerMovement', BlockMovement, false, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D, Enum.UserInputType.Touch)
                        LocalPlayer.Character.Humanoid.WalkSpeed = 36
                        LocalPlayer.Character.Humanoid:MoveTo(Ball.Position)
                        task.spawn(function()
                            repeat
                                if LocalPlayer.Character.Humanoid.WalkSpeed ~= 36 then
                                    LocalPlayer.Character.Humanoid.WalkSpeed = 36
                                end
                                task.wait()
                            until not Phantom
                        end)
                        Ball:GetAttributeChangedSignal('target'):Once(function()
                            ContextActionService:UnbindAction('BlockPlayerMovement')
                            Phantom = false
                            LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position)
                            LocalPlayer.Character.Humanoid.WalkSpeed = 10
                            task.delay(3, function()
                                LocalPlayer.Character.Humanoid.WalkSpeed = 36
                            end)
                        end)
                    end
                    if Ball_Target == tostring(LocalPlayer) and Distance <= Parry_Accuracy and Phantom then
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
                        Parried = true
                    end
                    if Ball:FindFirstChild('AeroDynamicSlashVFX') then
                        Debris:AddItem(Ball.AeroDynamicSlashVFX, 0)
                        Tornado_Time = tick()
                    end
                    if Runtime:FindFirstChild('Tornado') then
                        if (tick() - Tornado_Time) < (Runtime.Tornado:GetAttribute("TornadoTime") or 1) + 0.314159 then
                            return
                        end
                    end
                    if One_Target == tostring(LocalPlayer) and Curved then return end
                    if Ball:FindFirstChild("ComboCounter") then return end
                    local Singularity_Cape = LocalPlayer.Character.PrimaryPart:FindFirstChild('SingularityCape')
                    if Singularity_Cape then return end
                    if getgenv().InfinityDetection and Infinity then return end
                    if Ball_Target == tostring(LocalPlayer) and Distance <= Parry_Accuracy then
                        if getgenv().AutoAbility and AutoAbility() then return end
                    end
                    if Ball_Target == tostring(LocalPlayer) and Distance <= Parry_Accuracy then
                        if getgenv().CooldownProtection and cooldownProtection() then return end
                        local Parry_Time = os.clock()
                        local Time_View = Parry_Time - Last_Parry
                        if Time_View > 0.5 then Auto_Parry.Parry_Animation() end
                        if getgenv().AutoParryKeypress then
                            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, nil)
                        else
                            Auto_Parry.Parry(Selected_Parry_Type)
                        end
                        Last_Parry = Parry_Time
                        Parried = true
                    end
                    local Last_Parrys = tick()
                    repeat
                        RunService.PreSimulation:Wait()
                    until (tick() - Last_Parrys) >= 1 or not Parried
                    Parried = false
                end
            end)
        else
            if Connections_Manager['Auto Parry'] then
                Connections_Manager['Auto Parry']:Disconnect()
                Connections_Manager['Auto Parry'] = nil
            end
        end
    end
})

MainSection:AddSlider("ParryAccuracy", {
    Title = "Parry Accuracy",
    Description = "Adjust parry accuracy multiplier",
    Default = 100,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Callback = function(value)
        Speed_Divisor_Multiplier = 0.7 + (value - 1) * (0.35 / 99)
    end
})

MainSection:AddDropdown("SelectCurve", {
    Title = "Curve Type",
    Values = {"Camera", "Random", "Backwards", "Straight", "High", "Left", "Right", "Random Target"},
    Default = 1,
    Callback = function(value)
        Selected_Parry_Type = value
    end
})

MainSection:AddToggle("RandomParryAccuracy", {
    Title = "Random Parry Accuracy",
    Default = false,
    Callback = function(value)
        getgenv().RandomParryAccuracyEnabled = value
    end
})

MainSection:AddToggle("InfinityDetection", {
    Title = "Infinity Detection",
    Default = false,
    Callback = function(value)
        getgenv().InfinityDetection = value
    end
})

MainSection:AddToggle("Keypress", {
    Title = "Keypress",
    Default = false,
    Callback = function(value)
        getgenv().AutoParryKeypress = value
    end
})

MainSection:AddToggle("PhantomDetection", {
    Title = "Phantom Detection",
    Default = false,
    Callback = function(value)
        getgenv().PhantomV2Detection = value
    end
})

MainSection:AddToggle("AutoSpam", {
    Title = "Auto Spam",
    Default = false,
    Callback = function(value)
        if value then
            Connections_Manager['Auto Spam'] = RunService.PreSimulation:Connect(function()
                local Ball = Auto_Parry.Get_Ball()
                if not Ball then
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                    return
                end
                local Zoomies = Ball:FindFirstChild('zoomies')
                if not Zoomies then
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                    return
                end
                Auto_Parry.Closest_Player()
                if not Closest_Entity then
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                    return
                end
                local Ping = Stats.Network.ServerStatsItem['Data Ping']:GetValue()
                local Ping_Threshold = math.clamp(Ping / 10, 1, 16)
                local Ball_Target = Ball:GetAttribute('target')
                if not Ball_Target then
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                    return
                end
                if Ball_Target == tostring(LocalPlayer) then
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                    return
                end
                if Ball_Target ~= tostring(Closest_Entity) then
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                    return
                end
                -- Check if local player was targeted exactly once before current target
                local wasLocalTargetOnceBefore = false
                if #recentTargetChanges >= 1 then
                    local lastChange = recentTargetChanges[#recentTargetChanges]
                    local secondLastChange = recentTargetChanges[#recentTargetChanges-1]
                    local thirdLastChange = recentTargetChanges[#recentTargetChanges-2]
                    if lastChange.target == Ball_Target and 
                       secondLastChange.target == tostring(LocalPlayer) and 
                       thirdLastChange.target ~= tostring(LocalPlayer) then
                        wasLocalTargetOnceBefore = true
                    end
                end
                if not wasLocalTargetOnceBefore then
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                    return
                end
                local Ball_Properties = Auto_Parry:Get_Ball_Properties()
                local Entity_Properties = Auto_Parry:Get_Entity_Properties()
                local Spam_Accuracy = Auto_Parry.Spam_Service({
                    Ball_Properties = Ball_Properties,
                    Entity_Properties = Entity_Properties,
                    Ping = Ping_Threshold
                })
                if not Spam_Accuracy then
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                    return
                end
                local recentChanges = getRecentTargetChanges()
                local adjustedSpamAccuracy = Spam_Accuracy + (recentChanges * 1)
                local Target_Position = Closest_Entity and Closest_Entity.PrimaryPart.Position
                local Target_Distance = Target_Position and LocalPlayer:DistanceFromCharacter(Target_Position) or math.huge
                local Distance = LocalPlayer:DistanceFromCharacter(Ball.Position)
                local Pulsed = LocalPlayer.Character:GetAttribute('Pulsed')
                if Pulsed then
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                    return
                end
                -- Check for passing through (very close proximity)
                local lastPassThroughTime = lastPassThroughTime or 0
                if Target_Distance <= 18 then
                    lastPassThroughTime = tick()
                end
                -- Check for distance-based deactivation override
                local preventDeactivation = Target_Distance <= 25
                -- Check for movement away (local player or target)
                local isMovingBackward = false
                if not preventDeactivation and (tick() - lastPassThroughTime) > 3 then
                    local localHumanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
                    local entityHumanoid = Closest_Entity and Closest_Entity:FindFirstChild("Humanoid")
                    if localHumanoid and entityHumanoid and Target_Position then
                        Previous_Positions[LocalPlayer] = Previous_Positions[LocalPlayer] or {}
                        Previous_Positions[Closest_Entity] = Previous_Positions[Closest_Entity] or {}
                        table.insert(Previous_Positions[LocalPlayer], {pos = LocalPlayer.Character.PrimaryPart.Position, time = tick()})
                        table.insert(Previous_Positions[Closest_Entity], {pos = Target_Position, time = tick()})
                        -- Keep only the last 0.5 seconds of positions
                        while #Previous_Positions[LocalPlayer] > 0 and tick() - Previous_Positions[LocalPlayer][1].time > 0.5 do
                            table.remove(Previous_Positions[LocalPlayer], 1)
                        end
                        while #Previous_Positions[Closest_Entity] > 0 and tick() - Previous_Positions[Closest_Entity][1].time > 0.5 do
                            table.remove(Previous_Positions[Closest_Entity], 1)
                        end
                        -- Check if distance is consistently increasing
                        if #Previous_Positions[LocalPlayer] >= 2 and #Previous_Positions[Closest_Entity] >= 2 then
                            local earliestLocalPos = Previous_Positions[LocalPlayer][1].pos
                            local earliestEntityPos = Previous_Positions[Closest_Entity][1].pos
                            local latestLocalPos = Previous_Positions[LocalPlayer][#Previous_Positions[LocalPlayer]].pos
                            local latestEntityPos = Previous_Positions[Closest_Entity][#Previous_Positions[Closest_Entity]].pos
                            local earliestDistance = (earliestEntityPos - earliestLocalPos).Magnitude
                            local latestDistance = (latestEntityPos - latestLocalPos).Magnitude
                            if latestDistance > earliestDistance + 5 then
                                isMovingBackward = true
                            end
                        end
                    end
                end
                if isMovingBackward and Target_Distance > 30 then -- Aumentado de 18 para 30
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                    return
                end
                -- Activate auto spam if conditions are met
                if Target_Distance <= adjustedSpamAccuracy and Distance <= adjustedSpamAccuracy and (Parries >= ParryThreshold or recentChanges >= 1) then
                    if AutoSpamAntiBallBounceEnabled then
                        local rootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local directionToPlayer = (rootPart.Position - Ball.Position).Unit
                            Ball.AssemblyLinearVelocity = directionToPlayer * Zoomies.VectorVelocity.Magnitude
                        end
                    end
                    if not InputTask then
                        SpamInput()
                    end
                else
                    if InputTask then
                        task.cancel(InputTask)
                        InputTask = nil
                    end
                end
            end)
        else
            if InputTask then
                task.cancel(InputTask)
                InputTask = nil
            end
            if Connections_Manager['Auto Spam'] then
                Connections_Manager['Auto Spam']:Disconnect()
                Connections_Manager['Auto Spam'] = nil
            end
        end
    end
})

MainSection:AddToggle("AutoSpamAntiBallBounce", {
    Title = "Auto Spam Anti Ball Bounce",
    Default = false,
    Callback = function(value)
        AutoSpamAntiBallBounceEnabled = value
    end
})

MainSection:AddDropdown("SpamParryType", {
    Title = "Parry Type",
    Values = {"Legit", "Blatant"},
    Default = 1,
    Callback = function(value)
    end
})

MainSection:AddSlider("ParryThreshold", {
    Title = "Parry Threshold",
    Description = "Adjust parry threshold",
    Default = 2.5,
    Min = 1.1,
    Max = 9,
    Rounding = 1,
    Callback = function(value)
        ParryThreshold = value
    end
})

MainSection:AddToggle("AutoAbility", {
    Title = "Auto Ability",
    Default = false,
    Callback = function(value)
        getgenv().AutoAbility = value
    end
})

MainSection:AddToggle("CooldownProtection", {
    Title = "Cooldown Protection",
    Default = false,
    Callback = function(value)
        getgenv().CooldownProtection = value
    end
})

if not isMobile then
    MainSection:AddToggle("AnimationFix", {
        Title = "Animation Fix",
        Default = false,
        Callback = function(value)
            if value then
                Connections_Manager['Animation Fix'] = RunService.PreSimulation:Connect(function()
                    local Ball = Auto_Parry.Get_Ball()
                    if not Ball then return end
                    local Zoomies = Ball:FindFirstChild('zoomies')
                    if not Zoomies then return end
                    Auto_Parry.Closest_Player()
                    local Ping = Stats.Network.ServerStatsItem['Data Ping']:GetValue()
                    local Ping_Threshold = math.clamp(Ping / 10, 10, 16)
                    local Ball_Target = Ball:GetAttribute('target')
                    local Ball_Properties = Auto_Parry:Get_Ball_Properties()
                    local Entity_Properties = Auto_Parry:Get_Entity_Properties()
                    local Spam_Accuracy = Auto_Parry.Spam_Service({
                        Ball_Properties = Ball_Properties,
                        Entity_Properties = Entity_Properties,
                        Ping = Ping_Threshold
                    })
                    local recentChanges = getRecentTargetChanges()
                    local adjustedSpamAccuracy = Spam_Accuracy + (recentChanges * 1)
                    local Target_Position = Closest_Entity and Closest_Entity.PrimaryPart.Position
                    local Target_Distance = Target_Position and LocalPlayer:DistanceFromCharacter(Target_Position) or math.huge
                    local Direction = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Unit
                    local Ball_Direction = Zoomies.VectorVelocity.Unit
                    local Dot = Direction:Dot(Ball_Direction)
                    local Distance = LocalPlayer:DistanceFromCharacter(Ball.Position)
                    if not Ball_Target then return end
                    if Target_Distance > adjustedSpamAccuracy or Distance > adjustedSpamAccuracy then return end
                    local Pulsed = LocalPlayer.Character:GetAttribute('Pulsed')
                    if Pulsed then return end
                    if Ball_Target == tostring(LocalPlayer) and (Target_Distance > 40 or Distance > 40) then return end
                    local threshold = ParryThreshold
                    if Distance <= adjustedSpamAccuracy and (Parries >= threshold or recentChanges >= 1) then
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                    end
                end)
            else
                if Connections_Manager['Animation Fix'] then
                    Connections_Manager['Animation Fix']:Disconnect()
                    Connections_Manager['Animation Fix'] = nil
                end
            end
        end
    })
end

-- Lobby AP
local LobbySection = Tabs.Main:AddSection("Lobby Auto Parry")

LobbySection:AddToggle("LobbyAP", {
    Title = "Lobby AP",
    Default = false,
    Callback = function(value)
        if value then
            Connections_Manager['Lobby AP'] = RunService.Heartbeat:Connect(function()
                local Ball = Auto_Parry.Lobby_Balls()
                if not Ball then return end
                local Zoomies = Ball:FindFirstChild('zoomies')
                if not Zoomies then return end
                Ball:GetAttributeChangedSignal('target'):Once(function()
                    Training_Parried = false
                end)
                if Training_Parried then return end
                local Ball_Target = Ball:GetAttribute('target')
                local Velocity = Zoomies.VectorVelocity
                local Distance = LocalPlayer:DistanceFromCharacter(Ball.Position)
                local Speed = Velocity.Magnitude
                local Ping = Stats.Network.ServerStatsItem['Data Ping']:GetValue() / 10
                local Ping_Threshold = math.clamp(Ping / 10, 5, 17)
                local cappedSpeedDiff = math.min(math.max(Speed - 9.5, 0), 650)
                local speed_divisor_base = 2.4 + cappedSpeedDiff * 0.002
                local effectiveMultiplier = LobbyAP_Speed_Divisor_Multiplier
                if getgenv().LobbyAPRandomParryAccuracyEnabled then
                    if Speed < 200 then
                        effectiveMultiplier = 0.7 + (math.random(40, 100) - 1) * (0.35 / 99)
                    else
                        effectiveMultiplier = 0.7 + (math.random(1, 100) - 1) * (0.35 / 99)
                    end
                end
                local speed_divisor = speed_divisor_base * effectiveMultiplier
                local Parry_Accuracy = Ping_Threshold + math.max(Speed / speed_divisor, 9.5)
                
                if Ball_Target == tostring(LocalPlayer) and Distance <= Parry_Accuracy then
                    local Parry_Time = os.clock()
                    local Time_View = Parry_Time - Last_Parry
                    if Time_View > 0.5 then Auto_Parry.Parry_Animation() end
                    if getgenv().LobbyAPKeypress then
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                    else
                        Auto_Parry.Parry(Selected_Parry_Type)
                    end
                    Last_Parry = Parry_Time
                    Training_Parried = true
                end
                local Last_Parrys_Check = tick()
                repeat
                    RunService.Heartbeat:Wait()
                until (tick() - Last_Parrys_Check) >= 1 or not Training_Parried
                Training_Parried = false
            end)
        else
            if Connections_Manager['Lobby AP'] then
                Connections_Manager['Lobby AP']:Disconnect()
                Connections_Manager['Lobby AP'] = nil
            end
            Training_Parried = false
        end
    end
})

LobbySection:AddSlider("LobbyParryAccuracy", {
    Title = "Lobby Parry Accuracy",
    Description = "Adjust lobby parry accuracy multiplier",
    Default = 100,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Callback = function(value)
        LobbyAP_Speed_Divisor_Multiplier = 0.7 + (value - 1) * (0.35 / 99)
    end
})

LobbySection:AddToggle("LobbyRandomParryAccuracy", {
    Title = "Lobby Random Parry Accuracy",
    Default = false,
    Callback = function(value)
        getgenv().LobbyAPRandomParryAccuracyEnabled = value
    end
})

-- Misc tab
local MiscSection = Tabs.Misc:AddSection("Misc")

MiscSection:AddToggle("AutoManualSpam", {
    Title = "Auto Manual Spam",
    Default = false,
    Callback = function(value)
        AutoManualSpamEnabled = value
        if value then
            Connections_Manager['Auto Manual Spam'] = RunService.Heartbeat:Connect(checkAutoManualSpam)
            local button = CoreGui:FindFirstChild("ManualSpamUI") and CoreGui.ManualSpamUI.MainFrame.ClashModeButton
            if button and not ManualSpamActive then
                button.Text = "Auto"
                button.TextColor3 = Color3.new(0, 0, 1)
            end
        else
            if Connections_Manager['Auto Manual Spam'] then
                Connections_Manager['Auto Manual Spam']:Disconnect()
                Connections_Manager['Auto Manual Spam'] = nil
            end
            if ManualSpamActive then toggleManualSpam(false) end
            local button = CoreGui:FindFirstChild("ManualSpamUI") and CoreGui.ManualSpamUI.MainFrame.ClashModeButton
            if button then
                button.Text = "Clash Mode"
                button.TextColor3 = Color3.new(1, 0, 0)
            end
        end
    end
})

local billboardLabels = {}
local espConnections = {}

local function qolPlayerNameVisibility()
    local function createBillboardGui(p)
        local character = p.Character
        while not (character and character.Parent) do
            task.wait()
            character = p.Character
        end
        local head = character:WaitForChild("Head")
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Name = "AbilityBillboard"
        billboardGui.Adornee = head
        billboardGui.Size = UDim2.new(0, 200, 0, 25)
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
        billboardGui.AlwaysOnTop = true
        billboardGui.Parent = head
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
        textLabel.TextSize = 12
        textLabel.Font = Enum.Font.SourceSansSemibold
        textLabel.BackgroundTransparency = 1
        textLabel.TextWrapped = false
        textLabel.TextTruncate = Enum.TextTruncate.AtEnd
        textLabel.TextXAlignment = Enum.TextXAlignment.Center
        textLabel.TextYAlignment = Enum.TextYAlignment.Center
        textLabel.TextScaled = false
        textLabel.Text = ""
        textLabel.Parent = billboardGui
        billboardLabels[p] = textLabel
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end
        local heartbeatConnection
        heartbeatConnection = RunService.Heartbeat:Connect(function()
            if not character or not character.Parent then
                billboardGui:Destroy()
                billboardLabels[p] = nil
                if heartbeatConnection then
                    heartbeatConnection:Disconnect()
                end
                return
            end
            if getgenv().AbilityESP then
                textLabel.Visible = true
                local abilityName = p:GetAttribute("EquippedAbility")
                if abilityName then
                    textLabel.Text = p.DisplayName .. " [" .. tostring(abilityName) .. "]"
                else
                    textLabel.Text = p.DisplayName .. " [???]"
                end
            else
                textLabel.Visible = false
            end
        end)
        espConnections[p] = heartbeatConnection
    end
    for _, p in Players:GetPlayers() do
        if p ~= LocalPlayer then
            p.CharacterAdded:Connect(function()
                createBillboardGui(p)
            end)
            createBillboardGui(p)
        end
    end
    local playerAddedConnection = Players.PlayerAdded:Connect(function(newPlayer)
        newPlayer.CharacterAdded:Connect(function()
            createBillboardGui(newPlayer)
        end)
    end)
    espConnections["PlayerAdded"] = playerAddedConnection
end

local function disableAbilityESP()
    for player, label in pairs(billboardLabels) do
        if label and label.Parent then
            label.Parent:Destroy()
        end
    end
    billboardLabels = {}
    for _, connection in pairs(espConnections) do
        if connection then
            connection:Disconnect()
        end
    end
    espConnections = {}
end

MiscSection:AddToggle("AbilityESP", {
    Title = "Ability ESP",
    Default = false,
    Callback = function(value)
        getgenv().AbilityESP = value
        if value then
            qolPlayerNameVisibility()
        else
            disableAbilityESP()
        end
    end
})

MiscSection:AddToggle("ManualSpamUI", {
    Title = "Manual Spam UI",
    Default = false,
    Callback = function(value)
        getgenv().spamui = value
        if value then
            if not CoreGui:FindFirstChild("ManualSpamUI") then
                local gui = Instance.new("ScreenGui")
                gui.Name = "ManualSpamUI"
                gui.ResetOnSpawn = false
                gui.Parent = CoreGui
                local frame = Instance.new("Frame")
                frame.Name = "MainFrame"
                frame.Position = UDim2.new(0, 20, 0, 20)
                frame.Size = UDim2.new(0, 160, 0, 60)
                frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                frame.BackgroundTransparency = 0.3
                frame.BorderSizePixel = 0
                frame.Active = true
                frame.Draggable = true
                frame.Parent = gui
                local uiCorner = Instance.new("UICorner")
                uiCorner.CornerRadius = UDim.new(0, 12)
                uiCorner.Parent = frame
                local uiStroke = Instance.new("UIStroke")
                uiStroke.Thickness = 2
                uiStroke.Color = Color3.new(0, 0, 0)
                uiStroke.Parent = frame
                local button = Instance.new("TextButton")
                button.Name = "ClashModeButton"
                button.Text = AutoManualSpamEnabled and "Auto" or "Clash Mode"
                button.TextColor3 = AutoManualSpamEnabled and Color3.new(0, 0, 1) or Color3.new(1, 0, 0)
                button.Size = UDim2.new(0, 120, 0, 40)
                button.Position = UDim2.new(0.5, -60, 0.5, -20)
                button.BackgroundTransparency = 1
                button.BorderSizePixel = 0
                button.Font = Enum.Font.GothamSemibold
                button.TextSize = 18
                button.Parent = frame
                button.MouseButton1Click:Connect(function()
                    if not AutoManualSpamEnabled then
                        toggleManualSpam(not ManualSpamActive)
                    end
                end)
            end
        else
            if CoreGui:FindFirstChild("ManualSpamUI") then
                CoreGui:FindFirstChild("ManualSpamUI"):Destroy()
            end
            if Connections_Manager['Manual Spam'] then
                Connections_Manager['Manual Spam']:Disconnect()
                Connections_Manager['Manual Spam'] = nil
            end
            if Connections_Manager['Auto Manual Spam'] then
                Connections_Manager['Auto Manual Spam']:Disconnect()
                Connections_Manager['Auto Manual Spam'] = nil
            end
            ManualSpamActive = false
            AutoManualSpamEnabled = false
        end
    end
})

-- Skin Changer Section
local SkinChangerSection = Tabs.Misc:AddSection("Skin Changer")

getgenv().config = getgenv().config or {
    enabled = false,
    model = "Base Sword",
    anim = "Base Sword",
    fx = "Base Sword"
}

print = function(...) end

local p = game:GetService("Players").LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local swords = require(rs:WaitForChild("Shared", 9e9):WaitForChild("ReplicatedInstances", 9e9):WaitForChild("Swords", 9e9))
local ctrl, playFx, lastParry = nil, nil, 0

local function getSlash(name)
    local s = swords:GetSword(name)
    return (s and s.SlashName) or "SlashEffect"
end

getgenv().config.slash = getSlash(getgenv().config.fx)

local function setSword()
    if not getgenv().config.enabled then return end
    setupvalue(rawget(swords, "EquipSwordTo"), 2, false)
    swords:EquipSwordTo(p.Character, getgenv().config.model)
    ctrl:SetSword(getgenv().config.anim)
end

getgenv().updateSword = function()
    getgenv().config.slash = getSlash(getgenv().config.fx)
    setSword()
end

while task.wait() and not ctrl do
    for _, v in getconnections(rs.Remotes.FireSwordInfo.OnClientEvent) do
        if v.Function and islclosure(v.Function) then
            local u = getupvalues(v.Function)
            if #u == 1 and type(u[1]) == "table" then
                ctrl = u[1]
                break
            end
        end
    end
end

local parryConnA, parryConnB
while task.wait() and not parryConnA do
    for _, v in getconnections(rs.Remotes.ParrySuccessAll.OnClientEvent) do
        if v.Function and getinfo(v.Function).name == "parrySuccessAll" then
            parryConnA, playFx = v, v.Function
            v:Disable()
            break
        end
    end
end

while task.wait() and not parryConnB do
    for _, v in getconnections(rs.Remotes.ParrySuccessClient.Event) do
        if v.Function and getinfo(v.Function).name == "parrySuccessAll" then
            parryConnB = v
            v:Disable()
            break
        end
    end
end

rs.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(...)
    setthreadidentity(2)
    local a = {...}
    if tostring(a[4]) ~= p.Name then
        lastParry = tick()
    elseif getgenv().config.enabled then
        a[1], a[3] = getgenv().config.slash, getgenv().config.fx
    end
    return playFx(unpack(a))
end)

task.spawn(function()
    while task.wait(1) do
        if getgenv().config.enabled then
            local c = p.Character or p.CharacterAdded:Wait()
            if p:GetAttribute("CurrentlyEquippedSword") ~= getgenv().config.model or not c:FindFirstChild(getgenv().config.model) then
                setSword()
            end
            for _, m in pairs(c:GetChildren()) do
                if m:IsA("Model") and m.Name ~= getgenv().config.model then
                    m:Destroy()
                end
                task.wait()
            end
        end
    end
end)

SkinChangerSection:AddToggle("SkinChangerEnabled", {
    Title = "Enable Skin Changer",
    Default = false,
    Callback = function(value)
        getgenv().config.enabled = value
        if value then
            getgenv().updateSword()
        end
    end
})

SkinChangerSection:AddInput("SkinModel", {
    Title = "Model Name",
    Default = "Base Sword",
    Placeholder = "Enter sword model name",
    Callback = function(value)
        getgenv().config.model = value
        getgenv().updateSword()
    end
})

SkinChangerSection:AddInput("SkinAnimation", {
    Title = "Animation Name",
    Default = "Base Sword",
    Placeholder = "Enter sword animation name",
    Callback = function(value)
        getgenv().config.anim = value
        getgenv().updateSword()
    end
})

SkinChangerSection:AddInput("SkinFX", {
    Title = "FX Name",
    Default = "Base Sword",
    Placeholder = "Enter sword FX name",
    Callback = function(value)
        getgenv().config.fx = value
        getgenv().updateSword()
    end
})

-- Connections and Events
ReplicatedStorage.Remotes.InfinityBall.OnClientEvent:Connect(function(a, b)
    Infinity = b
end)

Balls.ChildAdded:Connect(function(Value)
    Value.ChildAdded:Connect(function(Child)
        if SlashOfFuryDetection then
            if Child.Name == 'ComboCounter' then
                local Sof_Label = Child:FindFirstChildOfClass('TextLabel')
                if Sof_Label then
                    repeat
                        local Slashes_Counter = tonumber(Sof_Label.Text)
                        if Slashes_Counter and Slashes_Counter < 32 then
                            Auto_Parry.Parry(Selected_Parry_Type)
                        end
                        task.wait()
                    until not Sof_Label.Parent or not Sof_Label
                end
            end
        end
    end)
end)

RunTime.ChildAdded:Connect(function(Object)
    local Name = Object.Name
    if getgenv().PhantomV2Detection then
        if Name == "maxTransmission" or Name == "transmissionpart" then
            local Weld = Object:FindFirstChildWhichIsA("WeldConstraint")
            if Weld then
                local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                if Character and Weld.Part1 == Character.HumanoidRootPart then
                    CurrentBall = GetBall()
                    Weld:Destroy()
                    if CurrentBall then
                        local FocusConnection
                        FocusConnection = RunService.RenderStepped:Connect(function()
                            local Highlighted = CurrentBall:GetAttribute("highlighted")
                            if Highlighted == true then
                                LocalPlayer.Character.Humanoid.WalkSpeed = 36
                                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                                if HumanoidRootPart then
                                    local PlayerPosition = HumanoidRootPart.Position
                                    local BallPosition = CurrentBall.Position
                                    local PlayerToBall = (BallPosition - PlayerPosition).Unit
                                    LocalPlayer.Character.Humanoid:Move(PlayerToBall, false)
                                end
                            elseif Highlighted == false then
                                FocusConnection:Disconnect()
                                LocalPlayer.Character.Humanoid.WalkSpeed = 10
                                LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 0), false)
                                task.delay(3, function()
                                    LocalPlayer.Character.Humanoid.WalkSpeed = 36
                                end)
                                CurrentBall = nil
                            end
                        end)
                        task.delay(3, function()
                            if FocusConnection and FocusConnection.Connected then
                                FocusConnection:Disconnect()
                                LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 0), false)
                                LocalPlayer.Character.Humanoid.WalkSpeed = 36
                                CurrentBall = nil
                            end
                        end)
                    end
                end
            end
        end
    end
end)

ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
    if hit_Sound_Enabled then
    end
end)

ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(_, root)
    if root.Parent and root.Parent ~= LocalPlayer.Character then
        if root.Parent.Parent ~= Workspace.Alive then return end
    end
    Auto_Parry.Closest_Player()
    local Ball = Auto_Parry.Get_Ball()
    if not Ball then return end
    local Target_Distance = Closest_Entity and (LocalPlayer.Character.PrimaryPart.Position - Closest_Entity.PrimaryPart.Position).Magnitude or math.huge
    local Distance = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Magnitude
    local Direction = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Unit
    local Dot = Direction:Dot(Ball.AssemblyLinearVelocity.Unit)
    local Curve_Detected = Auto_Parry.Is_Curved()
    if Target_Distance < 15 and Distance < 15 and Dot > -0.25 then
        if Curve_Detected then
            Auto_Parry.Parry(Selected_Parry_Type)
        end
    end
    if not Grab_Parry then return end
    Grab_Parry:Stop()
end)

ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
    if LocalPlayer.Character.Parent ~= Workspace.Alive then return end
    if not Grab_Parry then return end
    Grab_Parry:Stop()
end)

Workspace.Balls.ChildAdded:Connect(function()
    Parried = false
end)

Workspace.Balls.ChildRemoved:Connect(function(Value)
    Parries = 0
    Parried = false
    if Connections_Manager['Target Change'] then
        Connections_Manager['Target Change']:Disconnect()
        Connections_Manager['Target Change'] = nil
    end
    recentTargetChanges = {}
end)

ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(a, b)
    local Primary_Part = LocalPlayer.Character.PrimaryPart
    local Ball = Auto_Parry.Get_Ball()
    if not Ball then return end
    local Zoomies = Ball:FindFirstChild('zoomies')
    if not Zoomies then return end
    local Speed = Zoomies.VectorVelocity.Magnitude
    local Distance = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Magnitude
    local Velocity = Zoomies.VectorVelocity
    local Ball_Direction = Velocity.Unit
    local Direction = (LocalPlayer.Character.PrimaryPart.Position - Ball.Position).Unit
    local Dot = Direction:Dot(Ball_Direction)
    local Pings = Stats.Network.ServerStatsItem['Data Ping']:GetValue()
    local Speed_Threshold = math.min(Speed / 100, 40)
    local Reach_Time = Distance / Speed - (Pings / 1000)
    local Enough_Speed = Speed > 100
    local Ball_Distance_Threshold = 15 - math.min(Distance / 1000, 15) + Speed_Threshold
    if Enough_Speed and Reach_Time > Pings / 10 then
        Ball_Distance_Threshold = math.max(Ball_Distance_Threshold - 15, 15)
    end
    if b ~= Primary_Part and Distance > Ball_Distance_Threshold then
        Curving = tick()
    end
end)

ReplicatedStorage.Remotes.Phantom.OnClientEvent:Connect(function(a, b)
    if b.Name == tostring(LocalPlayer) then
        Phantom = true
    else
        Phantom = false
    end
end)

Workspace.Balls.ChildRemoved:Connect(function()
    Phantom = false
end)

Balls.ChildAdded:Connect(function(ball)
    ball:GetAttributeChangedSignal('target'):Connect(function()
        local currentTarget = ball:GetAttribute('target')
        table.insert(recentTargetChanges, {time = tick(), target = currentTarget})
    end)
end)

Window.onUnloaded = function()
    print("Unloaded!")
    for name, connection in pairs(Connections_Manager) do
        if connection and connection.Connected then
            connection:Disconnect()
            Connections_Manager[name] = nil
        end
    end
    if CoreGui:FindFirstChild("ManualSpamUI") then
        CoreGui.ManualSpamUI:Destroy()
    end
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:BuildConfigSection(Tabs.Misc)
InterfaceManager:BuildInterfaceSection(Tabs.Misc)
SaveManager:LoadAutoloadConfig()