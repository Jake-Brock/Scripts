local ESP = {}
ESP.Objects = {}
ESP.Connections = {}

function ESP:AddObjectListener(parent, options)
    assert(typeof(parent) == "Instance", "Parent must be an Instance")
    assert(typeof(options) == "table", "Options must be a table")

    local objectName = options.Name
    local customName = options.CustomName or objectName
    local color = options.Color or Color3.fromRGB(255, 255, 255)
    local isEnabledFlag = options.IsEnabled

    local function createESP(object)
        local drawing = Drawing.new("Text")
        drawing.Text = customName
        drawing.Color = color
        drawing.Size = 18
        drawing.Center = true
        drawing.Outline = true
        drawing.OutlineColor = Color3.new(0, 0, 0)
        drawing.Visible = true

        local function update()
            if object and object:IsA("BasePart") then
                local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(object.Position)
                drawing.Position = Vector2.new(screenPos.X, screenPos.Y)
                drawing.Visible = onScreen and ESP[isEnabledFlag]
            else
                drawing.Visible = false
            end
        end

        ESP.Connections[object] = game:GetService("RunService").RenderStepped:Connect(update)

        object.AncestryChanged:Connect(function()
            if not object:IsDescendantOf(workspace) then
                drawing:Destroy()
                ESP.Connections[object]:Disconnect()
                ESP.Connections[object] = nil
            end
        end)
    end

    for _, object in ipairs(parent:GetChildren()) do
        if object.Name == objectName and object:IsA("BasePart") then
            createESP(object)
        end
    end

    parent.ChildAdded:Connect(function(child)
        if child.Name == objectName and child:IsA("BasePart") then
            createESP(child)
        end
    end)
end

function ESP:SetEnabled(flagName, enabled)
    self[flagName] = enabled
end

function ESP:Clear()
    for _, connection in pairs(self.Connections) do
        connection:Disconnect()
    end

    for _, drawing in pairs(self.Objects) do
        drawing:Destroy()
    end

    self.Objects = {}
    self.Connections = {}
end

return ESP

