-- Settings
local ESP = {
    Enabled = false,
    Boxes = true,
    BoxShift = CFrame.new(0, -1.5, 0),
    BoxSize = Vector3.new(4, 6, 0),
    Color = Color3.fromRGB(255, 170, 0),
    FaceCamera = false,
    Names = true,
    TeamColor = true,
    Thickness = 2,
    AttachShift = 1,
    TeamMates = true,
    Players = true,
    Objects = setmetatable({}, {__mode = "kv"}),
    Overrides = {}
}

-- Declarations
local cam = workspace.CurrentCamera
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local V3new = Vector3.new
local WorldToViewportPoint = cam.WorldToViewportPoint

-- Functions
local function Draw(obj, props)
    local new = Drawing.new(obj)
    props = props or {}
    for i, v in pairs(props) do
        new[i] = v
    end
    return new
end

function ESP:GetTeam(player)
    local override = self.Overrides.GetTeam
    if override then
        return override(player)
    end
    return player and player.Team
end

function ESP:IsTeamMate(player)
    local override = self.Overrides.IsTeamMate
    if override then
        return override(player)
    end
    return self:GetTeam(player) == self:GetTeam(localPlayer)
end

function ESP:GetColor(obj)
    local override = self.Overrides.GetColor
    if override then
        return override(obj)
    end
    local player = self:GetPlrFromChar(obj)
    return player and self.TeamColor and player.Team and player.Team.TeamColor.Color or self.Color
end

function ESP:GetPlrFromChar(char)
    local override = self.Overrides.GetPlrFromChar
    if override then
        return override(char)
    end
    return players:GetPlayerFromCharacter(char)
end

function ESP:Toggle(bool)
    self.Enabled = bool
    if not bool then
        for _, obj in pairs(self.Objects) do
            if obj.Type == "Box" then
                if obj.Temporary then
                    obj:Remove()
                else
                    for _, component in pairs(obj.Components) do
                        component.Visible = false
                    end
                end
            end
        end
    end
end

function ESP:GetBox(obj)
    return self.Objects[obj]
end

function ESP:AddObjectListener(parent, options)
    local function NewListener(child)
        if (not options.Type or child:IsA(options.Type)) and (not options.Name or child.Name == options.Name) then
            if not options.Validator or options.Validator(child) then
                local box =
                    ESP:Add(
                    child,
                    {
                        PrimaryPart = options.PrimaryPart and options.PrimaryPart(child),
                        Color = options.Color and options.Color(child) or nil,
                        Name = options.CustomName and options.CustomName(child) or nil,
                        IsEnabled = options.IsEnabled,
                        RenderInNil = options.RenderInNil
                    }
                )
                if options.OnAdded then
                    coroutine.wrap(options.OnAdded)(box)
                end
            end
        end
    end

    if options.Recursive then
        parent.DescendantAdded:Connect(NewListener)
        for _, descendant in pairs(parent:GetDescendants()) do
            coroutine.wrap(NewListener)(descendant)
        end
    else
        parent.ChildAdded:Connect(NewListener)
        for _, child in pairs(parent:GetChildren()) do
            coroutine.wrap(NewListener)(child)
        end
    end
end

local boxBase = {}
boxBase.__index = boxBase

function boxBase:Remove()
    ESP.Objects[self.Object] = nil
    for _, component in pairs(self.Components) do
        component.Visible = false
        component:Remove()
    end
end

function boxBase:Update()
    if not self.PrimaryPart then
        return self:Remove()
    end

    local color = self.Color or ESP:GetColor(self.Object) or ESP.Color
    local allow = true

    if ESP.Overrides.UpdateAllow and not ESP.Overrides.UpdateAllow(self) then
        allow = false
    end

    if self.Player and not ESP.TeamMates and ESP:IsTeamMate(self.Player) then
        allow = false
    end

    if self.Player and not ESP.Players then
        allow = false
    end

    if self.IsEnabled and (type(self.IsEnabled) == "function" and not self:IsEnabled()) then
        allow = false
    end

    if not workspace:IsAncestorOf(self.PrimaryPart) and not self.RenderInNil then
        allow = false
    end

    if not allow then
        for _, component in pairs(self.Components) do
            component.Visible = false
        end
        return
    end

    -- Box calculations
    local cf = self.PrimaryPart.CFrame
    if ESP.FaceCamera then
        cf = CFrame.new(cf.Position, cam.CFrame.Position)
    end

    local size = self.Size
    local locs = {
        TopLeft = cf * ESP.BoxShift * CFrame.new(size.X / 2, size.Y / 2, 0),
        TopRight = cf * ESP.BoxShift * CFrame.new(-size.X / 2, size.Y / 2, 0),
        BottomLeft = cf * ESP.BoxShift * CFrame.new(size.X / 2, -size.Y / 2, 0),
        BottomRight = cf * ESP.BoxShift * CFrame.new(-size.X / 2, -size.Y / 2, 0),
        TagPos = cf * ESP.BoxShift * CFrame.new(0, size.Y / 2, 0),
        Torso = cf * ESP.BoxShift
    }

    local TopLeft, Vis1 = WorldToViewportPoint(cam, locs.TopLeft.Position)
    local TopRight, Vis2 = WorldToViewportPoint(cam, locs.TopRight.Position)
    local BottomLeft, Vis3 = WorldToViewportPoint(cam, locs.BottomLeft.Position)
    local BottomRight, Vis4 = WorldToViewportPoint(cam, locs.BottomRight.Position)

    if Vis1 or Vis2 or Vis3 or Vis4 then
        self.Components.Quad.Visible = true
        self.Components.Quad.PointA = Vector2.new(TopRight.X, TopRight.Y)
        self.Components.Quad.PointB = Vector2.new(TopLeft.X, TopLeft.Y)
        self.Components.Quad.PointC = Vector2.new(BottomLeft.X, BottomLeft.Y)
        self.Components.Quad.PointD = Vector2.new(BottomRight.X, BottomRight.Y)
        self.Components.Quad.Color = color
    else
        self.Components.Quad.Visible = false
    end
end

function ESP:Add(obj, options)
    if not obj.Parent and not options.RenderInNil then
        return warn(obj, "has no parent")
    end

    local box =
        setmetatable(
        {
            Name = options.Name or obj.Name,
            Type = "Box",
            Color = options.Color,
            Size = options.Size or self.BoxSize,
            Object = obj,
            Player = options.Player or players:GetPlayerFromCharacter(obj),
            PrimaryPart = options.PrimaryPart or obj:FindFirstChild("HumanoidRootPart"),
            Components = {},
            IsEnabled = options.IsEnabled,
            Temporary = options.Temporary,
            ColorDynamic = options.ColorDynamic,
            RenderInNil = options.RenderInNil
        },
        boxBase
    )

    self.Objects[obj] = box
    return box
end

return ESP
