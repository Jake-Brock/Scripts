-- ESP Library
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

-- Services
local cam = workspace.CurrentCamera
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local mouse = localPlayer:GetMouse()

-- Utility Functions
local function Draw(type, props)
    local obj = Drawing.new(type)
    for k, v in pairs(props or {}) do
        obj[k] = v
    end
    return obj
end

-- Team and Color Handlers
function ESP:GetTeam(player)
    return self.Overrides.GetTeam and self.Overrides.GetTeam(player) or player.Team
end

function ESP:IsTeamMate(player)
    return self.Overrides.IsTeamMate and self.Overrides.IsTeamMate(player) or
        self:GetTeam(player) == self:GetTeam(localPlayer)
end

function ESP:GetColor(obj)
    local customColor = self.Overrides.GetColor
    if customColor then
        return customColor(obj)
    end
    local player = self:GetPlrFromChar(obj)
    return player and self.TeamColor and player.Team and player.Team.TeamColor.Color or self.Color
end

function ESP:GetPlrFromChar(character)
    return self.Overrides.GetPlrFromChar and self.Overrides.GetPlrFromChar(character) or
        players:GetPlayerFromCharacter(character)
end

-- Toggle and Object Management
function ESP:Toggle(state)
    self.Enabled = state
    for _, obj in pairs(self.Objects) do
        if obj.Type == "Box" then
            if obj.Temporary then
                obj:Remove()
            else
                for _, component in pairs(obj.Components) do
                    component.Visible = state
                end
            end
        end
    end
end

function ESP:Add(obj, options)
    if not obj.Parent and not options.RenderInNil then
        return warn(obj, "has no parent")
    end

    local primaryPart =
        options.PrimaryPart or (obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart")))
    if not primaryPart then
        return
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
            PrimaryPart = primaryPart,
            Components = {},
            IsEnabled = options.IsEnabled,
            Temporary = options.Temporary,
            ColorDynamic = options.ColorDynamic,
            RenderInNil = options.RenderInNil
        },
        {
            __index = function(_, key)
                return ESP[key]
            end
        }
    )

    self.Objects[obj] = box

    box.Components.Quad = Draw("Quad", {Thickness = self.Thickness, Transparency = 1, Filled = false})
    box.Components.Name = Draw("Text", {Center = true, Outline = true, Size = 19})
    box.Components.Distance = Draw("Text", {Center = true, Outline = true, Size = 19})
    box.Components.Tracer = Draw("Line", {Thickness = self.Thickness, Transparency = 1})

    obj.AncestryChanged:Connect(
        function(_, parent)
            if not parent and self.AutoRemove ~= false then
                box:Remove()
            end
        end
    )

    local humanoid = obj:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Died:Connect(
            function()
                if self.AutoRemove ~= false then
                    box:Remove()
                end
            end
        )
    end

    return box
end

function ESP:UpdateObject(obj)
    local components = obj.Components
    -- Logic for updating components (Boxes, Names, Tracers) goes here.
end

-- Player and Character Listeners
local function OnCharacterAdded(character)
    if character:FindFirstChild("HumanoidRootPart") then
        ESP:Add(character, {PrimaryPart = character.HumanoidRootPart})
    else
        character.ChildAdded:Connect(
            function(child)
                if child.Name == "HumanoidRootPart" then
                    ESP:Add(character, {PrimaryPart = child})
                end
            end
        )
    end
end

local function OnPlayerAdded(player)
    player.CharacterAdded:Connect(OnCharacterAdded)
    if player.Character then
        OnCharacterAdded(player.Character)
    end
end

-- Initialization
players.PlayerAdded:Connect(OnPlayerAdded)
for _, player in pairs(players:GetPlayers()) do
    if player ~= localPlayer then
        OnPlayerAdded(player)
    end
end

game:GetService("RunService").RenderStepped:Connect(
    function()
        cam = workspace.CurrentCamera
        for _, obj in pairs(ESP.Objects) do
            if obj.Update then
                obj:UpdateObject()
            end
        end
    end
)

return ESP
