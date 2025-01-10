local NotSupported = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local UICorner = Instance.new("UICorner")
local Timer = Instance.new("TextLabel")

NotSupported.Name = "NotSupported"
NotSupported.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
NotSupported.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = NotSupported
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.249291778, 0, 0.220588237, 0)
Background.Size = UDim2.new(0, 354, 0, 228)

Title.Name = "Title"
Title.Parent = Background
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0310734455, 0, 0.0570175424, 0)
Title.Size = UDim2.new(0, 150, 0, 29)
Title.Font = Enum.Font.FredokaOne
Title.Text = "discord.gg/getfrost"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 19.000
Title.TextWrapped = true

Timer.Name = "Timer"
Timer.Parent = Background
Timer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Timer.BackgroundTransparency = 1.000
Timer.BorderColor3 = Color3.fromRGB(0, 0, 0)
Timer.BorderSizePixel = 0
Timer.Position = UDim2.new(0.151380688, 0, 0.853808761, 0)
Timer.Size = UDim2.new(0, 223, 0, 21)
Timer.Font = Enum.Font.FredokaOne
Timer.Text = "This tab will close in 10s"
Timer.TextColor3 = Color3.fromRGB(255, 255, 255)
Timer.TextSize = 19.000
Timer.TextWrapped = true

local clock = 10

while task.wait(1) do
     Timer.Text = "This tab will close in " ..  clock - 1 .. "s"
     if clock == 0 then
          NotSupported:Destroy()
          break
     end
end

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
UIGradient.Parent = Title

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Background

local content = {}

function content:EditContent(name)
local Content = Instance.new("TextLabel")

Content.Name = "Content"
Content.Parent = Background
Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Content.BackgroundTransparency = 1.000
Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
Content.BorderSizePixel = 0
Content.Position = UDim2.new(0.166666716, 0, 0.206140414, 0)
Content.Size = UDim2.new(0, 221, 0, 134)
Content.Font = Enum.Font.FredokaOne
Content.Text = "Your Executor " .. name .. " is not supported."
Content.TextColor3 = Color3.fromRGB(255, 255, 255)
Content.TextSize = 19.000
Content.TextWrapped = true

end

return content
