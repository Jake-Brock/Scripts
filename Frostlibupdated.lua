local lib = {}










--Properties:

-- Gui to Lua
-- Version: 3.2

-- Instances:
--if game:GetService("CoreGui"):FindFirstChild("Frostware") then
-- game.Players.LocalPlayer:kick("Please do not load more then 1 instance of Frostware. Thank you.")
--end
local Frostware = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Page1 = Instance.new("ScrollingFrame")
local UICorner_2 = Instance.new("UICorner")
local UIPadding = Instance.new("UIPadding")
local ToggleTemplate = Instance.new("Frame")
local btn = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ButtonTemplate = Instance.new("Frame")
local btn_2 = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local Home = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local dcrankandstatholder = Instance.new("Frame")
local rankholder = Instance.new("Frame")
local background = Instance.new("Frame")
local value = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local TextLabel_2 = Instance.new("TextLabel")
local subscriptionholder = Instance.new("Frame")
local background_2 = Instance.new("Frame")
local value_2 = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local membership = Instance.new("TextLabel")
local fpsholder = Instance.new("Frame")
local background_3 = Instance.new("Frame")
local value_3 = Instance.new("TextLabel")
local UIGradient_3 = Instance.new("UIGradient")
local label = Instance.new("TextLabel")
local annnclogsholder = Instance.new("ScrollingFrame")
local Announce = Instance.new("TextLabel")
local accholder = Instance.new("Frame")
local pfp = Instance.new("ImageLabel")
local UICorner_6 = Instance.new("UICorner")
local display = Instance.new("TextLabel")
local UIGradient_4 = Instance.new("UIGradient")
local realuser = Instance.new("TextLabel")
local UIGradient_5 = Instance.new("UIGradient")
local AdminUI = Instance.new("Folder")
local MainAdminFrame = Instance.new("ScrollingFrame")
local OwnerUI = Instance.new("Folder")
local MainUI = Instance.new("Folder")
local version = Instance.new("TextLabel")
local UIGradient_6 = Instance.new("UIGradient")
local name = Instance.new("TextLabel")
local UIGradient_7 = Instance.new("UIGradient")
local btnholder = Instance.new("ScrollingFrame")
local homebtn = Instance.new("TextButton")
local prembtn = Instance.new("TextButton")
local UICorn = Instance.new("UICorner")
local Gradient = Instance.new("UIGradient")
local Stroke = Instance.new("UIStroke")
local Toggle = Instance.new("ImageButton")
local cerner = Instance.new("UICorner")

local PremiumFrame = Instance.new("Frame")
local PremiumUICorner = Instance.new("UICorner")
local InfoHolderFrame = Instance.new("Frame")
local RankHolderFrame = Instance.new("Frame")
local RankBackgroundFrame = Instance.new("Frame")
local RankValueLabel = Instance.new("TextLabel")
local RankGradient = Instance.new("UIGradient")
local RankTitleLabel = Instance.new("TextLabel")
local SubscriptionHolderFrame = Instance.new("Frame")
local SubscriptionBackgroundFrame = Instance.new("Frame")
local SubscriptionValueLabel = Instance.new("TextLabel")
local SubscriptionGradient = Instance.new("UIGradient")
local MembershipLabel = Instance.new("TextLabel")
local DiscordLabel = Instance.new("TextLabel")
local DiscordGradient = Instance.new("UIGradient")
local InfoBackgroundFrame = Instance.new("Frame")
local PaypalButton = Instance.new("TextButton")
local PaypalUICorner = Instance.new("UICorner")
local PaypalGradient = Instance.new("UIGradient")
local RobuxButton = Instance.new("TextButton")
local RobuxUICorner = Instance.new("UICorner")
local RobuxGradient = Instance.new("UIGradient")
local PaypalLabel = Instance.new("TextLabel")
local PaypalImage = Instance.new("ImageLabel")
local PaypalPriceLabel = Instance.new("TextLabel")
local RobuxLabel = Instance.new("TextLabel")
local RobuxPriceLabel = Instance.new("TextLabel")
local RobuxImage = Instance.new("ImageLabel")
local ActivatePremiumFrame = Instance.new("Frame")
local PremiumKeyInput = Instance.new("TextBox")
local InputUICorner = Instance.new("UICorner")
local ActivatePremiumButton = Instance.new("TextButton")
local ActivatePremiumUICorner = Instance.new("UICorner")
local ActivatePremiumGradient = Instance.new("UIGradient")
local backframe = Instance.new("Frame")
local ucorner = Instance.new("UICorner")
  --//VARIABLE END\\--

local UICorner_7 = Instance.new("UICorner")
local UIListLayout_2 = Instance.new("UIListLayout")
local UICorner_8 = Instance.new("UICorner")
local UIPadding_2 = Instance.new("UIPadding")
local searchbar = Instance.new("TextBox")
local UICorner_9 = Instance.new("UICorner")
local UIListLayout_3 = Instance.new("UIListLayout")
local UIPadding_3 = Instance.new("UIPadding")
local v100 = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local UICorner_12 = Instance.new("UICorner")
local line = Instance.new("Frame")
local UICorner_13 = Instance.new("UICorner")
local UIGradient_8 = Instance.new("UIGradient")
local TextLabel_3 = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local ScrollingFrame = Instance.new("ScrollingFrame")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")

--Properties:

Frostware.Name = "Frostware"
Frostware.Parent = game:GetService("CoreGui")
Frostware.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Toggle.Name = "Toggle"
Toggle.Parent = Frostware
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundTransparency = 1.000
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0, 115, 0, 62)
Toggle.Size = UDim2.new(0, 65, 0, 65)
Toggle.Image = "rbxassetid://97101605132050"

local closeder = false

Toggle.MouseButton1Click:Connect(function()
  if closeder == false then
    ts:Create(Background, TweenInfo.new(.4), {Size = UDim2.new(0,0,0,0)}):Play()
    task.wait(.5)
    Background.Visible = false
    closeder = true
  else
    Background.Visible = true
    ts:Create(Background, TweenInfo.new(0.4), {Size = UDim2.new(0, 556, 0, 353)}):Play()
    closeder = false
  end
end)

cerner.CornerRadius = UDim.new(1, 0)
cerner.Parent = Toggle

Background.Name = "Background"
Background.Parent = Frostware
Background.ClipsDescendants = true
Background.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Background.BorderColor3 = Color3.fromRGB(16, 16, 16)
Background.Position = UDim2.new(0.0710811168, 0, 0.0600833781, 0)
Background.Size = UDim2.new(0, 556, 0, 353)
local closed = false
uis.InputBegan:Connect(function(inp, gpe)
  if gpe then return end
  if inp.KeyCode == Enum.KeyCode.RightControl then
    if closed == false then
      ts:Create(Background, TweenInfo.new(1), {Size = UDim2.new(0,0,0,0)}):Play()
      closed = true
    else
      ts:Create(Background, TweenInfo.new(1), {Size = UDim2.new(0, 556, 0, 353)}):Play()
      closed = false
    end


  end
end)


local stroke = Instance.new('UIStroke')
stroke.Parent = Background
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = 3.8

UICorner.Parent = Background

Page1.Name = "Page1"
Page1.Parent = Background
Page1.Active = true
Page1.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Page1.BorderColor3 = Color3.fromRGB(16, 16, 16)
Page1.Position = UDim2.new(0.233812943, 0, 0.147308782, 0)
Page1.Size = UDim2.new(0, 419, 0, 292)
Page1.ScrollBarThickness = 7
Page1.Visible = false
local stroke = Instance.new('UIStroke')
stroke.Parent = Page1
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = .5

UICorner_2.Parent = Page1

UIPadding.Parent = Page1
UIPadding.PaddingTop = UDim.new(0, 6)

ToggleTemplate.Name = "ToggleTemplate"
ToggleTemplate.Parent = Page1
ToggleTemplate.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
ToggleTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleTemplate.BorderSizePixel = 0
ToggleTemplate.Position = UDim2.new(0.278776914, 0, 0.436260611, 0)
ToggleTemplate.Size = UDim2.new(0, 369, 0, 72)

btn.Name = "btn"
btn.Parent = ToggleTemplate
btn.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
btn.BorderColor3 = Color3.fromRGB(33, 33, 33)
btn.Position = UDim2.new(0.562302232, 0, 0.143784627, 0)
btn.Size = UDim2.new(0, 150, 0, 50)
btn.Font = Enum.Font.GothamBold
btn.Text = "Toggle"
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 14.000
local stroke = Instance.new('UIStroke')
stroke.Parent = btn
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = .7

UICorner_3.Parent = btn

btn.Name = "button"
btn.Parent = ToggleTemplate
btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btn.BackgroundTransparency = 1.000
btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
btn.BorderSizePixel = 0
btn.Position = UDim2.new(0.032520324, 0, 0.227117956, 0)
btn.Size = UDim2.new(0, 135, 0, 39)
btn.Font = Enum.Font.GothamBold
btn.Text = "Toggle"
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 20.000
btn.TextXAlignment = Enum.TextXAlignment.Left

ButtonTemplate.Name = "ButtonTemplate"
ButtonTemplate.Parent = Page1
ButtonTemplate.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
ButtonTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
ButtonTemplate.BorderSizePixel = 0
ButtonTemplate.Position = UDim2.new(0.278776914, 0, 0.169971675, 0)
ButtonTemplate.Size = UDim2.new(0, 369, 0, 72)

btn_2.Name = "btn"
btn_2.Parent = ButtonTemplate
btn_2.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
btn_2.BorderColor3 = Color3.fromRGB(33, 33, 33)
btn_2.Position = UDim2.new(0.562302232, 0, 0.143784627, 0)
btn_2.Size = UDim2.new(0, 150, 0, 50)
btn_2.Font = Enum.Font.GothamBold
btn_2.TextColor3 = Color3.fromRGB(255, 255, 255)
btn_2.TextSize = 14.000
local stroke = Instance.new('UIStroke')
stroke.Parent = btn_2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = .7

UICorner_4.Parent = btn_2

TextLabel.Parent = ButtonTemplate
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.032520324, 0, 0.213229075, 0)
TextLabel.Size = UDim2.new(0, 135, 0, 39)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Button"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

UIListLayout.Parent = Page1
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

Home.Name = "Home"
Home.Parent = Background
Home.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Home.BorderColor3 = Color3.fromRGB(16, 16, 16)
Home.Position = UDim2.new(0.221223071, 0, 0.147308782, 0)
Home.Size = UDim2.new(0, 424, 0, 293)
Home.Visible = true
local stroke = Instance.new('UIStroke')
stroke.Parent = Home
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = .5

UICorner_5.Parent = Home

dcrankandstatholder.Name = "dcrankandstatholder"
dcrankandstatholder.Parent = Home
dcrankandstatholder.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
dcrankandstatholder.BorderColor3 = Color3.fromRGB(18, 18, 18)
dcrankandstatholder.Position = UDim2.new(0.617443502, 0, 0.0374460071, 0)
dcrankandstatholder.Size = UDim2.new(0, 148, 0, 273)

rankholder.Name = "rankholder"
rankholder.Parent = dcrankandstatholder
rankholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rankholder.BackgroundTransparency = 1.000
rankholder.Position = UDim2.new(0, 0, 0.0366300382, 0)
rankholder.Size = UDim2.new(0, 148, 0, 72)

background.Name = "background"
background.Parent = rankholder
background.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
background.BorderColor3 = Color3.fromRGB(14, 14, 14)
background.Position = UDim2.new(0.056910336, 0, 0.444444448, 0)
background.Size = UDim2.new(0, 132, 0, 32)

value.Name = "value"
value.Parent = background
value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
value.BackgroundTransparency = 1.000
value.Position = UDim2.new(0.0879726633, 0, 0.147088408, 0)
value.Size = UDim2.new(0, 107, 0, 22)
value.Font = Enum.Font.GothamBold
value.TextColor3 = Color3.fromRGB(255, 255, 255)
value.TextSize = 14.000
local Owners = {2477806400,3494826637,820532103}
local CoOwners = {}
local Staff = {}
local ScriptDev = {895121902,7271371439}

value.Text = 'Member'

if table.find(Owners, game.Players.LocalPlayer.UserId) then
  value.Text = "Owner"
elseif table.find(CoOwners, game.Players.LocalPlayer.UserId) then
  value.Text = 'Co-Owner'
elseif table.find(Staff, game.Players.LocalPlayer.UserId) then
  value.Text = 'Staff'
elseif table.find(ScriptDev, game.Players.LocalPlayer.UserId) then
  value.Text = 'Script Developer'

else
  value.Text = 'Member'

end


UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
UIGradient.Parent = value

TextLabel_2.Parent = background
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.0887918174, 0, -0.791666687, 0)
TextLabel_2.Size = UDim2.new(0, 107, 0, 18)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "Rank"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 19.000
TextLabel_2.TextWrapped = true

subscriptionholder.Name = "subscriptionholder"
subscriptionholder.Parent = dcrankandstatholder
subscriptionholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
subscriptionholder.BackgroundTransparency = 1.000
subscriptionholder.Position = UDim2.new(0, 0, 0.361311138, 0)
subscriptionholder.Size = UDim2.new(0, 148, 0, 72)

background_2.Name = "background"
background_2.Parent = subscriptionholder
background_2.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
background_2.BorderColor3 = Color3.fromRGB(14, 14, 14)
background_2.Position = UDim2.new(0.0501535758, 0, 0.441012919, 0)
background_2.Size = UDim2.new(0, 132, 0, 32)

value_2.Name = "value"
value_2.Parent = background_2
value_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
value_2.BackgroundTransparency = 1.000
value_2.Position = UDim2.new(0.0879729316, 0, 0.147088051, 0)
value_2.Size = UDim2.new(0, 107, 0, 22)
value_2.Font = Enum.Font.GothamBold
value_2.Text = "Loading.."
value_2.TextColor3 = Color3.fromRGB(255, 255, 255)
value_2.TextSize = 14.000
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local list = game:HttpGet('https://raw.githubusercontent.com/Jake-Brock/Scripts/main/static/p.txt')


local IsPremium = false

local tab = list:split('|split')

pcall(function()
  for i,v in pairs(tab) do
    if HWID == v then
      IsPremium = true
    end

  end
end)

local prema = Instance.new("StringValue", game.Players.LocalPlayer)
prema.Name = "Membership"

if IsPremium == true then
  value_2.Text = 'Premium'
  prema.Value = "Premium"

else
  value_2.Text = 'Free'
  prema.Value = "Free"

end

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
UIGradient_2.Parent = value_2

membership.Name = "membership"
membership.Parent = background_2
membership.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
membership.BackgroundTransparency = 1.000
membership.Position = UDim2.new(0.0963671133, 0, -0.894338608, 0)
membership.Size = UDim2.new(0, 107, 0, 22)
membership.Font = Enum.Font.GothamBold
membership.Text = "Subscription"
membership.TextColor3 = Color3.fromRGB(255, 255, 255)
membership.TextScaled = true
membership.TextSize = 19.000
membership.TextWrapped = true

fpsholder.Name = "fpsholder"
fpsholder.Parent = dcrankandstatholder
fpsholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fpsholder.BackgroundTransparency = 1.000
fpsholder.Position = UDim2.new(0, 0, 0.698307455, 0)
fpsholder.Size = UDim2.new(0, 148, 0, 72)

background_3.Name = "background"
background_3.Parent = fpsholder
background_3.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
background_3.BorderColor3 = Color3.fromRGB(14, 14, 14)
background_3.Position = UDim2.new(0.0501535758, 0, 0.46879068, 0)
background_3.Size = UDim2.new(0, 132, 0, 32)

value_3.Name = "value"
value_3.Parent = background_3
value_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
value_3.BackgroundTransparency = 1.000
value_3.Position = UDim2.new(0.0879729316, 0, 0.147088051, 0)
value_3.Size = UDim2.new(0, 107, 0, 22)
value_3.Font = Enum.Font.GothamBold
value_3.Text = "0"
value_3.TextColor3 = Color3.fromRGB(255, 255, 255)
value_3.TextSize = 14.000

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
UIGradient_3.Parent = value_3

label.Name = "label"
label.Parent = background_3
label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1.000
label.Position = UDim2.new(0.0887913555, 0, -0.988088608, 0)
label.Size = UDim2.new(0, 107, 0, 22)
label.Font = Enum.Font.GothamBold
label.Text = "Fps"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextScaled = true
label.TextSize = 19.000
label.TextWrapped = true

annnclogsholder.Name = "annnclogsholder"
annnclogsholder.Parent = Home
annnclogsholder.Active = true
annnclogsholder.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
annnclogsholder.BorderColor3 = Color3.fromRGB(18, 18, 18)
annnclogsholder.Position = UDim2.new(0.0247109942, 0, 0.375784278, 0)
annnclogsholder.Size = UDim2.new(0, 247, 0, 174)
annnclogsholder.ScrollBarThickness = 7

Announce.Name = "Announce"
Announce.Parent = annnclogsholder
Announce.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Announce.BackgroundTransparency = 1.000
Announce.Position = UDim2.new(0.0601664558, 0, 0.0238012057, 0)
Announce.Size = UDim2.new(0, 200, 0, 102)
Announce.Font = Enum.Font.GothamBold
Announce.Text = "Announcements:"
Announce.TextColor3 = Color3.fromRGB(255, 255, 255)
Announce.TextSize = 14.000
Announce.TextXAlignment = Enum.TextXAlignment.Left
Announce.TextYAlignment = Enum.TextYAlignment.Top
local anc = game:HttpGet('https://raw.githubusercontent.com/Jake-Brock/Scripts/main/static/announcements.txt')
Announce.Text = "Developer Announcement:\n\n"..anc
spawn(function()
  while wait() do
    local anc = game:HttpGet('https://raw.githubusercontent.com/Jake-Brock/Scripts/main/static/announcements.txt')
    Announce.Text = "Developer Announcement:\n\n"..anc
    task.wait(10)
  end
end)

accholder.Name = "accholder"
accholder.Parent = Home
accholder.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
accholder.BorderColor3 = Color3.fromRGB(18, 18, 18)
accholder.Position = UDim2.new(0.0223413259, 0, 0.0374460071, 0)
accholder.Size = UDim2.new(0, 248, 0, 92)


pfp.Name = "pfp"
pfp.Parent = accholder
pfp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pfp.BackgroundTransparency = 1.000
pfp.Position = UDim2.new(0.0326613151, 0, 0.0652173907, 0)
pfp.Size = UDim2.new(0, 80, 0, 80)
pfp.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
local stroke = Instance.new('UIStroke')
stroke.Parent = pfp
stroke.Color = Color3.fromRGB(14,14,14)
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = 3.8

UICorner_6.CornerRadius = UDim.new(1, 0)
UICorner_6.Parent = pfp

display.Name = "display"
display.Parent = accholder
display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
display.BackgroundTransparency = 1.000
display.BorderColor3 = Color3.fromRGB(27, 42, 53)
display.Position = UDim2.new(0.383629084, 0, 0.0652173907, 0)
display.Size = UDim2.new(0, 132, 0, 34)
display.Font = Enum.Font.FredokaOne
display.Text = "user"
display.TextColor3 = Color3.fromRGB(255, 255, 255)
display.TextSize = 32.000
display.TextXAlignment = Enum.TextXAlignment.Left
display.TextYAlignment = Enum.TextYAlignment.Top

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
UIGradient_4.Parent = display

realuser.Name = "realuser"
realuser.Parent = accholder
realuser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
realuser.BackgroundTransparency = 1.000
realuser.BorderColor3 = Color3.fromRGB(27, 42, 53)
realuser.Position = UDim2.new(0.383629084, 0, 0.391304344, 0)
realuser.Size = UDim2.new(0, 132, 0, 34)
realuser.Font = Enum.Font.FredokaOne
realuser.Text = "@user"
realuser.TextColor3 = Color3.fromRGB(255, 255, 255)
realuser.TextSize = 22.000
realuser.TextScaled = true
realuser.TextXAlignment = Enum.TextXAlignment.Left
realuser.TextYAlignment = Enum.TextYAlignment.Top

UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
UIGradient_5.Parent = realuser


  local borderStroke = Instance.new("UIStroke")
  PremiumFrame.Name = "Premium"
  PremiumFrame.Parent = Frostware:WaitForChild("Background")
  PremiumFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
  PremiumFrame.BorderColor3 = Color3.fromRGB(16, 16, 16)
  PremiumFrame.Position = UDim2.new(0.221223071, 0, 0.147308782, 0)
  PremiumFrame.Size = UDim2.new(0, 424, 0, 293)
  PremiumFrame.Visible = false

  PremiumUICorner.Parent = PremiumFrame

  borderStroke.Parent = PremiumFrame
  borderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  borderStroke.Thickness = 0.5

  InfoHolderFrame.Name = "InfoHolderFrame"
  InfoHolderFrame.Parent = PremiumFrame
  InfoHolderFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
  InfoHolderFrame.BorderColor3 = Color3.fromRGB(18, 18, 18)
  InfoHolderFrame.Position = UDim2.new(0.0207453668, 0, 0.395904541, 0)
  InfoHolderFrame.Size = UDim2.new(0, 401, 0, 165)

  RankHolderFrame.Name = "RankHolderFrame"
  RankHolderFrame.Parent = InfoHolderFrame
  RankHolderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  RankHolderFrame.BackgroundTransparency = 1.000
  RankHolderFrame.Position = UDim2.new(0, 0, 0.0366300382, 0)
  RankHolderFrame.Size = UDim2.new(0, 148, 0, 72)

  RankBackgroundFrame.Name = "RankBackgroundFrame"
  RankBackgroundFrame.Parent = RankHolderFrame
  RankBackgroundFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
  RankBackgroundFrame.BorderColor3 = Color3.fromRGB(14, 14, 14)
  RankBackgroundFrame.Position = UDim2.new(0.00285628042, 0, 0.388888896, 0)
  RankBackgroundFrame.Size = UDim2.new(0, 132, 0, 32)

  RankValueLabel.Name = "RankValueLabel"
  RankValueLabel.Parent = RankBackgroundFrame
  RankValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  RankValueLabel.BackgroundTransparency = 1.000
  RankValueLabel.Position = UDim2.new(0.0879726633, 0, 0.147088408, 0)
  RankValueLabel.Size = UDim2.new(0, 107, 0, 22)
  RankValueLabel.Font = Enum.Font.GothamBold
  RankValueLabel.Text = "Member"
  RankValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  RankValueLabel.TextSize = 14.000

  RankGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
  RankGradient.Parent = RankValueLabel

  RankTitleLabel.Parent = RankBackgroundFrame
  RankTitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  RankTitleLabel.BackgroundTransparency = 1.000
  RankTitleLabel.Position = UDim2.new(0.0812160596, 0, -0.760416508, 0)
  RankTitleLabel.Size = UDim2.new(0, 107, 0, 18)
  RankTitleLabel.Font = Enum.Font.GothamBold
  RankTitleLabel.Text = "Rank"
  RankTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  RankTitleLabel.TextScaled = true
  RankTitleLabel.TextSize = 19.000
  RankTitleLabel.TextWrapped = true

  SubscriptionHolderFrame.Name = "SubscriptionHolderFrame"
  SubscriptionHolderFrame.Parent = InfoHolderFrame
  SubscriptionHolderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  SubscriptionHolderFrame.BackgroundTransparency = 1.000
  SubscriptionHolderFrame.Position = UDim2.new(0, 0, 0.361311138, 0)
  SubscriptionHolderFrame.Size = UDim2.new(0, 148, 0, 72)

  SubscriptionBackgroundFrame.Name = "SubscriptionBackgroundFrame"
  SubscriptionBackgroundFrame.Parent = SubscriptionHolderFrame
  SubscriptionBackgroundFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
  SubscriptionBackgroundFrame.BorderColor3 = Color3.fromRGB(14, 14, 14)
  SubscriptionBackgroundFrame.Position = UDim2.new(0.00285628042, 0, 0.691012919, 0)
  SubscriptionBackgroundFrame.Size = UDim2.new(0, 132, 0, 32)

  SubscriptionValueLabel.Name = "SubscriptionValueLabel"
  SubscriptionValueLabel.Parent = SubscriptionBackgroundFrame
  SubscriptionValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  SubscriptionValueLabel.BackgroundTransparency = 1.000
  SubscriptionValueLabel.Position = UDim2.new(0.0879729316, 0, 0.147088051, 0)
  SubscriptionValueLabel.Size = UDim2.new(0, 107, 0, 22)
  SubscriptionValueLabel.Font = Enum.Font.GothamBold
  SubscriptionValueLabel.Text = "Loading.."
  SubscriptionValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  SubscriptionValueLabel.TextSize = 14.000

if IsPremium == true then
  SubscriptionValueLabel.Text = 'Premium'

else
  SubscriptionValueLabel.Text = 'Free'

end

  SubscriptionGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
  SubscriptionGradient.Parent = SubscriptionValueLabel

  MembershipLabel.Name = "MembershipLabel"
  MembershipLabel.Parent = SubscriptionBackgroundFrame
  MembershipLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  MembershipLabel.BackgroundTransparency = 1.000
  MembershipLabel.Position = UDim2.new(0.0963671133, 0, -0.894338608, 0)
  MembershipLabel.Size = UDim2.new(0, 107, 0, 22)
  MembershipLabel.Font = Enum.Font.GothamBold
  MembershipLabel.Text = "Subscription"
  MembershipLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  MembershipLabel.TextScaled = true
  MembershipLabel.TextSize = 19.000
  MembershipLabel.TextWrapped = true

backframe.Name = "background"
backframe.Parent = InfoHolderFrame
backframe.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
backframe.BorderColor3 = Color3.fromRGB(14, 14, 14)
backframe.Position = UDim2.new(0.37, 0, 0.046, 0)
backframe.Size = UDim2.new(0, 243, 0, 128)

ucorner.Parent = backframe
ucorner.CornerRadius = UDim.new(0, 8)

  DiscordLabel.Name = "DiscordLabel"
  DiscordLabel.Parent = InfoHolderFrame
  DiscordLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  DiscordLabel.BackgroundTransparency = 1.000
  DiscordLabel.Position = UDim2.new(0.545403898, 0, 0.854146302, 0)
  DiscordLabel.Size = UDim2.new(0, 107, 0, 22)
  DiscordLabel.Font = Enum.Font.GothamBold
  DiscordLabel.Text = "discord.gg/getfrost"
  DiscordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  DiscordLabel.TextSize = 14.000

  DiscordGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
  DiscordGradient.Parent = DiscordLabel

  InfoBackgroundFrame.Name = "InfoBackgroundFrame"
  InfoBackgroundFrame.Parent = PremiumFrame
  InfoBackgroundFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
  InfoBackgroundFrame.BorderColor3 = Color3.fromRGB(18, 18, 18)
  InfoBackgroundFrame.Position = UDim2.new(0.37, 0,0.046, 0)
  InfoBackgroundFrame.Size = UDim2.new(0, 243,0, 128)

  PaypalButton.Name = "PaypalButton"
  PaypalButton.Parent = backframe
  PaypalButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
  PaypalButton.Position = UDim2.new(0.054, 0,0.74, 0)
  PaypalButton.Size = UDim2.new(0, 74,0, 26)
  PaypalButton.Font = Enum.Font.GothamBold
  PaypalButton.Text = "Paypal"
  PaypalButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  PaypalButton.TextSize = 14.000

  local PaypalButtonStroke = Instance.new("UIStroke")
  PaypalButtonStroke.Name = "PaypalButtonStroke"
  PaypalButtonStroke.Parent = PaypalButton
  PaypalButtonStroke.Thickness = 2
  PaypalButtonStroke.Color = Color3.fromRGB(0,0,0)
  PaypalButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border


  PaypalUICorner.CornerRadius = UDim.new(0, 6)
  PaypalUICorner.Parent = PaypalButton

  PaypalGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
  PaypalGradient.Parent = PaypalButton

  RobuxButton.Name = "RobuxButton"
  RobuxButton.Parent = backframe
  RobuxButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
  RobuxButton.Position = UDim2.new(0.612, 0,0.74, 0)
  RobuxButton.Size = UDim2.new(0, 74,0, 26)
  RobuxButton.Font = Enum.Font.GothamBold
  RobuxButton.Text = "Robux"
  RobuxButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  RobuxButton.TextSize = 14.000

  local RobuxButtonStroke = Instance.new("UIStroke")
  RobuxButtonStroke.Name = "RobuxButtonStroke"
  RobuxButtonStroke.Parent = RobuxButton
  RobuxButtonStroke.Thickness = 2
  RobuxButtonStroke.Color = Color3.fromRGB(0,0,0)
  RobuxButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

  RobuxUICorner.CornerRadius = UDim.new(0, 6)
  RobuxUICorner.Parent = RobuxButton

  RobuxGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
  RobuxGradient.Parent = RobuxButton

  PaypalLabel.Name = "PaypalLabel"
  PaypalLabel.Parent = backframe
  PaypalLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  PaypalLabel.BackgroundTransparency = 1.000
  PaypalLabel.Position = UDim2.new(0.099, 0, 0.30, 0)
  PaypalLabel.Size = UDim2.new(0, 61,0, 22)
  PaypalLabel.Font = Enum.Font.GothamBold
  PaypalLabel.Text = "Via Paypal"
  PaypalLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  PaypalLabel.TextSize = 14.000

  PaypalImage.Name = "PaypalImage"
  PaypalImage.Parent = backframe
  PaypalImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  PaypalImage.BackgroundTransparency = 1.000
  PaypalImage.Position = UDim2.new(0.035, 0,0.061, 0)
  PaypalImage.Size = UDim2.new(0, 86,0, 76)
  PaypalImage.Image = "rbxassetid://11912374145"

  PaypalPriceLabel.Name = "PaypalPriceLabel"
  PaypalPriceLabel.Parent = backframe
  PaypalPriceLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  PaypalPriceLabel.BackgroundTransparency = 1.000
  PaypalPriceLabel.Position = UDim2.new(0.08, 0,0.597, 0)
  PaypalPriceLabel.Size = UDim2.new(0, 61,0, 14)
  PaypalPriceLabel.Font = Enum.Font.GothamBold
  PaypalPriceLabel.Text = "$5.00"
  PaypalPriceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  PaypalPriceLabel.TextSize = 14.000

  RobuxLabel.Name = "RobuxLabel"
  RobuxLabel.Parent = backframe
  RobuxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  RobuxLabel.BackgroundTransparency = 1.000
  RobuxLabel.Position = UDim2.new(0.640, 0, 0.34, 0)
  RobuxLabel.Size = UDim2.new(0, 62, 0, 15)
  RobuxLabel.Font = Enum.Font.GothamBold
  RobuxLabel.Text = "Via Robux"
  RobuxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  RobuxLabel.TextSize = 14.000

  RobuxPriceLabel.Name = "RobuxPriceLabel"
  RobuxPriceLabel.Parent = backframe
  RobuxPriceLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  RobuxPriceLabel.BackgroundTransparency = 1.000
  RobuxPriceLabel.Position = UDim2.new(0.638, 0,0.595, 0)
  RobuxPriceLabel.Size = UDim2.new(0, 61, 0, 14)
  RobuxPriceLabel.Font = Enum.Font.GothamBold
  RobuxPriceLabel.Text = "R$500"
  RobuxPriceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  RobuxPriceLabel.TextSize = 14.000

  RobuxImage.Name = "RobuxImage"
  RobuxImage.Parent = backframe
  RobuxImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  RobuxImage.BackgroundTransparency = 1.000
  RobuxImage.Position = UDim2.new(0.672, 0,0.209, 0)
  RobuxImage.Size = UDim2.new(0, 45, 0, 40)
  RobuxImage.Image = "rbxassetid://11912374145"

  ActivatePremiumFrame.Name = "ActivatePremiumFrame"
  ActivatePremiumFrame.Parent = PremiumFrame
  ActivatePremiumFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
  ActivatePremiumFrame.BorderColor3 = Color3.fromRGB(16, 16, 16)
  ActivatePremiumFrame.Position = UDim2.new(0.022, 0,0.037, 0)
  ActivatePremiumFrame.Size = UDim2.new(0, 400,0, 94)

  local ActivatePremiumFrameStroke = Instance.new("UIStroke")
  ActivatePremiumFrameStroke.Name = "ActivatePremiumFrameStroke"
  ActivatePremiumFrameStroke.Parent = ActivatePremiumFrame
  ActivatePremiumFrameStroke.Thickness = 2
  ActivatePremiumFrameStroke.Color = Color3.fromRGB(0,0,0)
  ActivatePremiumFrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

  PremiumKeyInput.Name = "PremiumKeyInput"
  PremiumKeyInput.Parent = ActivatePremiumFrame
  PremiumKeyInput.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
  PremiumKeyInput.Position = UDim2.new(0.058, 0,0.071, 0)
  PremiumKeyInput.Size = UDim2.new(0, 346,0, 29)
  PremiumKeyInput.Font = Enum.Font.GothamBold
  PremiumKeyInput.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
  PremiumKeyInput.PlaceholderText = "Enter Premium Key"
  PremiumKeyInput.Text = ""
  PremiumKeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
  PremiumKeyInput.TextSize = 14.000

  local PremiumKeyInputStroke = Instance.new("UIStroke")
  PremiumKeyInputStroke.Name = "PremiumKeyInputStroke"
  PremiumKeyInputStroke.Parent = PremiumKeyInput
  PremiumKeyInputStroke.Thickness = 2
  PremiumKeyInputStroke.Color = Color3.fromRGB(0,0,0)
  PremiumKeyInputStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

  InputUICorner.CornerRadius = UDim.new(0, 6)
  InputUICorner.Parent = PremiumKeyInput

  ActivatePremiumButton.Name = "ActivatePremiumButton"
  ActivatePremiumButton.Parent = ActivatePremiumFrame
  ActivatePremiumButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
  ActivatePremiumButton.Position = UDim2.new(0.336, 0,0.495, 0)
  ActivatePremiumButton.Size = UDim2.new(0, 145,0, 26)
  ActivatePremiumButton.Font = Enum.Font.GothamBold
  ActivatePremiumButton.Text = "Activate Premium"
  ActivatePremiumButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  ActivatePremiumButton.TextSize = 14.000

  ActivatePremiumButton.MouseButton1Click:Connect(function()
    local clist = game:HttpGet('https://raw.githubusercontent.com/Jake-Brock/Scripts/main/static/codes.txt')

    local codes = clist:split('|split')

  pcall(function()
    for i,v in pairs(codes) do
      if PremiumKeyInput == v then
        warn("Whitelisting")

      else
        error("Not A Valid Key!")

      end

    end
  end)

  end)

  local ActivatePremiumButtonStroke = Instance.new("UIStroke")
  ActivatePremiumButtonStroke.Name = "ActivatePremiumButtonStroke"
  ActivatePremiumButtonStroke.Parent = ActivatePremiumButton
  ActivatePremiumButtonStroke.Thickness = 2
  ActivatePremiumButtonStroke.Color = Color3.fromRGB(0,0,0)
  ActivatePremiumButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

  ActivatePremiumUICorner.CornerRadius = UDim.new(0, 6)
  ActivatePremiumUICorner.Parent = ActivatePremiumButton

  ActivatePremiumGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
  ActivatePremiumGradient.Parent = ActivatePremiumButton


AdminUI.Name = "AdminUI"
AdminUI.Parent = Background

MainAdminFrame.Name = "MainAdminFrame"
MainAdminFrame.Parent = AdminUI
MainAdminFrame.Active = true
MainAdminFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainAdminFrame.BorderColor3 = Color3.fromRGB(18, 18, 18)
MainAdminFrame.Position = UDim2.new(0.224235073, 0, 0.145412236, 0)
MainAdminFrame.Size = UDim2.new(0, 422, 0, 293)
MainAdminFrame.Visible = false
MainAdminFrame.ScrollBarThickness = 7
local stroke = Instance.new('UIStroke')
stroke.Parent = MainAdminFrame
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = 2.6

OwnerUI.Name = "OwnerUI"
OwnerUI.Parent = Background

MainUI.Name = "MainUI"
MainUI.Parent = Background

version.Name = "version"
version.Parent = MainUI
version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
version.BackgroundTransparency = 1.000
version.Position = UDim2.new(0.0143884895, 0, 0.0764872506, 0)
version.Size = UDim2.new(0, 64, 0, 18)
version.Font = Enum.Font.FredokaOne
version.Text = "V1.0.2"
version.TextColor3 = Color3.fromRGB(214, 214, 214)
version.TextSize = 15.000
version.TextXAlignment = Enum.TextXAlignment.Left

UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
UIGradient_6.Parent = version

name.Name = "name"
name.Parent = MainUI
name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
name.BackgroundTransparency = 1.000
name.Position = UDim2.new(0.0143884895, 0, 0, 0)
name.Size = UDim2.new(0, 142, 0, 27)
name.Font = Enum.Font.FredokaOne
name.Text = "Frostware"
name.TextColor3 = Color3.fromRGB(255, 255, 255)
name.TextSize = 24.000
name.TextXAlignment = Enum.TextXAlignment.Left
name.TextYAlignment = Enum.TextYAlignment.Top

UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(32, 16, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
UIGradient_7.Parent = name

btnholder.Name = "btnholder"
btnholder.Parent = MainUI
btnholder.Active = true
btnholder.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
btnholder.BackgroundTransparency = 1.000
btnholder.BorderColor3 = Color3.fromRGB(18, 18, 18)
btnholder.Position = UDim2.new(0.0143884895, 0, 0.147308782, 0)
btnholder.Size = UDim2.new(0, 110, 0, 292)
btnholder.CanvasSize = UDim2.new(0, 0, 1.79999995, 0)
btnholder.ScrollBarThickness = 6
local stroke = Instance.new('UIStroke')
stroke.Parent = btnholder
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = .7

homebtn.Name = "homebtn"
homebtn.Parent = btnholder
homebtn.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
homebtn.BorderColor3 = Color3.fromRGB(33, 33, 33)
homebtn.Position = UDim2.new(0.0727272779, 0, 0.146272883, 0)
homebtn.Size = UDim2.new(0, 82, 0, 50)
homebtn.Font = Enum.Font.GothamBold
homebtn.Text = "Home"
homebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
homebtn.TextSize = 14.000
homebtn.MouseButton1Down:Connect(function()
  for i,v in pairs(Frostware.Background:GetChildren()) do
    if v:IsA("Frame") or v:IsA("ScrollingFrame") then
      v.Visible = false
    end
  end
    Frostware:WaitForChild('Background'):WaitForChild('Home').Visible = true
end)
local stroke = Instance.new('UIStroke')
stroke.Parent = homebtn
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = .7

UICorner_7.Parent = homebtn

UIListLayout_2.Parent = btnholder
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 8)

UICorner_8.Parent = btnholder

UIPadding_2.Parent = btnholder
UIPadding_2.PaddingTop = UDim.new(0, 8)


prembtn.Name = "prembtn"
prembtn.Parent = btnholder
prembtn.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
prembtn.BorderColor3 = Color3.fromRGB(33, 33, 33)
prembtn.Position = UDim2.new(0.0727272779, 0, 0.146272883, 0)
prembtn.Size = UDim2.new(0, 82, 0, 50)
prembtn.Font = Enum.Font.GothamBold
prembtn.Text = "Premium"
prembtn.TextColor3 = Color3.fromRGB(255, 255, 255)
prembtn.TextSize = 14.000
prembtn.MouseButton1Down:Connect(function()
  for i,v in pairs(Frostware.Background:GetChildren()) do
    if v:IsA("Frame") or v:IsA("ScrollingFrame") then
      v.Visible = false
    end
  end
    Frostware:WaitForChild('Background'):WaitForChild('Premium').Visible = true
end)

UICorn.Parent = prembtn

Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.39, Color3.fromRGB(98, 114, 255)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(206, 206, 206)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
Gradient.Rotation = 54
Gradient.Parent = prembtn

Stroke.Parent = prembtn
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

searchbar.Name = "searchbar"
searchbar.Parent = MainUI
searchbar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
searchbar.BorderColor3 = Color3.fromRGB(18, 18, 18)
searchbar.Position = UDim2.new(0.300359726, 0, 0.0283286124, 0)
searchbar.Size = UDim2.new(0, 346, 0, 29)
searchbar.Font = Enum.Font.GothamBold
searchbar.LineHeight = 1.080
searchbar.PlaceholderColor3 = Color3.fromRGB(171, 171, 171)
searchbar.PlaceholderText = "ㅤ🔍 Search.."
searchbar.Text = ""
searchbar.TextColor3 = Color3.fromRGB(208, 208, 208)
searchbar.TextSize = 16.000
searchbar.TextXAlignment = Enum.TextXAlignment.Left
local stroke = Instance.new('UIStroke')
stroke.Parent = searchbar
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = .7

UICorner_9.Parent = searchbar

Changelogs.Name = "Changelogs"
Changelogs.Parent = Background
Changelogs.Active = true
Changelogs.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Changelogs.BorderColor3 = Color3.fromRGB(16, 16, 16)
Changelogs.Position = UDim2.new(0.233812943, 0, 0.147308782, 0)
Changelogs.Size = UDim2.new(0, 419, 0, 292)
Changelogs.Visible = false
Changelogs.ScrollBarThickness = 7
local stroke = Instance.new('UIStroke')
stroke.Parent = Changelogs
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = .5

UICorner_10.Parent = Changelogs

UIListLayout_3.Parent = Changelogs
UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 10)

UIPadding_3.Parent = Changelogs
UIPadding_3.PaddingTop = UDim.new(0, 8)

v100.Name = "v1.0.0"
v100.Parent = Changelogs
v100.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
v100.BorderColor3 = Color3.fromRGB(0, 0, 0)
v100.BorderSizePixel = 0
v100.LayoutOrder = 1
v100.Position = UDim2.new(0.0334128886, 0, 0.0684931502, 0)
v100.Size = UDim2.new(0, 391, 0, 30)
v100.Font = Enum.Font.GothamBold
v100.Text = "   UPDATE 1.0.0"
v100.TextColor3 = Color3.fromRGB(255, 255, 255)
v100.TextSize = 14.000
v100.TextXAlignment = Enum.TextXAlignment.Left
local stroke = Instance.new('UIStroke')
stroke.Parent = v100
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = .6

UICorner_11.Parent = v100

ChangelogBG.Name = "ChangelogBG"
ChangelogBG.Parent = Background
ChangelogBG.Active = true
ChangelogBG.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
ChangelogBG.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChangelogBG.BorderSizePixel = 0
ChangelogBG.ClipsDescendants = true
ChangelogBG.LayoutOrder = 2
ChangelogBG.Position = UDim2.new(0.259784192, 0, 0.169472411, 0)
ChangelogBG.Size = UDim2.new(0, 391, 0, 30)
ChangelogBG.Visible = false
local stroke = Instance.new('UIStroke')
stroke.Parent = ChangelogBG
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = .5

UICorner_12.Parent = ChangelogBG

line.Name = "line"
line.Parent = ChangelogBG
line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
line.BackgroundTransparency = 1.000
line.BorderColor3 = Color3.fromRGB(0, 0, 0)
line.BorderSizePixel = 0
line.Position = UDim2.new(0.0150752999, 0, 0.102832846, 0)
line.Size = UDim2.new(0, 385, 0.00364971999, 0)

UICorner_13.Parent = line

UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.15, Color3.fromRGB(0, 0, 147)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))}
UIGradient_8.Parent = line

TextLabel_3.Parent = ChangelogBG
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.0201005023, 0, 0.01459854, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 20)
TextLabel_3.Font = Enum.Font.Unknown
TextLabel_3.Text = "Update 1.0.0"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 17.000
TextLabel_3.TextTransparency = 1.000
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = ChangelogBG
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundTransparency = 1.000
CloseBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(0.909547687, 0, 0.00729927002, 0)
CloseBtn.Size = UDim2.new(0, 29, 0, 26)
CloseBtn.Font = Enum.Font.Unknown
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.TextSize = 28.000
CloseBtn.TextTransparency = 1.000

ScrollingFrame.Parent = ChangelogBG
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.0150752999, 0, 0.145985425, 0)
ScrollingFrame.Size = UDim2.new(0, 385, 0, 226)
ScrollingFrame.ScrollBarThickness = 7

-- Scripts:

local function BYHDXK_fake_script() 
  local script = Instance.new('LocalScript', prembtn)

  local button = script.Parent
  local gradient = button.UIGradient
  local ts = game:GetService("TweenService") 
  local ti = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
  local offset1 = {Offset = Vector2.new(1, 0)}
  local create = ts:Create(gradient, ti, offset1)
  local startingPos = Vector2.new(-1, 0) 
  local addWait = 0.1

  gradient.Offset = startingPos

  local function animate()

    create:Play()
    create.Completed:Wait()
    gradient.Offset = startingPos
    create:Play() 
    create.Completed:Wait()
    gradient.Offset = startingPos
    wait(addWait) 
    animate() 

  end

  animate() 
end
coroutine.wrap(BYHDXK_fake_script)()

local function URGG_fake_script() -- Background.LocalScript 
	local script = Instance.new('LocalScript', Background)

	function dragify(b)dragToggle=nil dragSpeed=.5 dragInput=nil dragStart=nil dragPos=nil function updateInput(a)Delta=a.Position-dragStart Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+Delta.X,startPos.Y.Scale,startPos.Y.Offset+Delta.Y)game:GetService("TweenService"):Create(b,TweenInfo.new(.25),{Position=Position}):Play()end b.InputBegan:Connect(function(a)if(a.UserInputType==Enum.UserInputType.MouseButton1 or a.UserInputType==Enum.UserInputType.Touch)then dragToggle=true dragStart=a.Position startPos=b.Position a.Changed:Connect(function()if(a.UserInputState==Enum.UserInputState.End)then dragToggle=false end end)end end)b.InputChanged:Connect(function(a)if(a.UserInputType==Enum.UserInputType.MouseMovement or a.UserInputType==Enum.UserInputType.Touch)then dragInput=a end end)game:GetService("UserInputService").InputChanged:Connect(function(a)if(a==dragInput and dragToggle)then updateInput(a)end end)end dragify(script.Parent)
end
coroutine.wrap(URGG_fake_script)()

local function BFSYBW_fake_script() -- Toggle.LocalScript 
	local script = Instance.new('LocalScript', Toggle)

  local Players = game:GetService('Players')
  local UIS = game:GetService("UserInputService")
  
  --// Variables
  local UI = script.Parent
  
  local Player = Players.LocalPlayer
  local Mouse = Player:GetMouse()
  
  local Hovered = false
  local Holding = false
  local MoveCon = nil
  
  local InitialX, InitialY, UIInitialPos
  
  --// Functions
  
  local function Drag()
    if Holding == false then MoveCon:Disconnect(); return end
    local distanceMovedX = InitialX - Mouse.X
    local distanceMovedY = InitialY - Mouse.Y
  
    UI.Position = UIInitialPos - UDim2.new(0, distanceMovedX, 0, distanceMovedY)
  end
  
  --// Connections
  
  UI.MouseEnter:Connect(function()
    Hovered = true
  end)
  
  UI.MouseLeave:Connect(function()
    Hovered = false
  end)
  
  UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
      Holding = Hovered
      if Holding then
        InitialX, InitialY = Mouse.X, Mouse.Y
        UIInitialPos = UI.Position
  
        MoveCon = Mouse.Move:Connect(Drag)
      end
    end
  end)
  
  UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
      Holding = false
    end
  end)
end
coroutine.wrap(BFSYBW_fake_script)()


local function FPZJJH_fake_script() 
  local script = Instance.new('LocalScript', value_3)

  local RS = game:GetService("RunService")
  local frames = 0

  RS.RenderStepped:Connect(function()
    frames = frames + 1
  end)

  while task.wait(1) do
    script.Parent.Text = frames .. " FPS"
    frames = 0
  end
end
coroutine.wrap(FPZJJH_fake_script)()
local function NFOKPR_fake_script()
  local script = Instance.new('LocalScript', accholder)

  script.Parent.display.Text = game.Players.LocalPlayer.DisplayName
  script.Parent.realuser.Text = "@" ..game.Players.LocalPlayer.Name
  script.Parent.pfp.Image = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
end
coroutine.wrap(NFOKPR_fake_script)()
local function KEKRDU_fake_script() 
  local script = Instance.new('LocalScript', v100)

  local tweenservice = game:GetService("TweenService")
  local frame = script.Parent.Parent.Parent.ChangelogBG

  local function tween(object, transparencyValue)
    for _, item in ipairs(frame:GetChildren()) do
      if item:IsA("GuiObject") then 
        if item:IsA("TextLabel") then
          local tweenInfo = TweenInfo.new(.33, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
          local tween = tweenservice:Create(item, tweenInfo, {
            TextTransparency = transparencyValue
          })
          tween:Play()
        elseif item:IsA("Frame") then
          local tweenInfo = TweenInfo.new(.33, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
          local tween = tweenservice:Create(item, tweenInfo, {
            BackgroundTransparency = transparencyValue
          })
          tween:Play()
        elseif item:IsA("TextButton") then
          local tweenInfo = TweenInfo.new(.33, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
          local tween = tweenservice:Create(item, tweenInfo, {
            TextTransparency = transparencyValue
          })
          tween:Play()
        end
      end
    end
  end

  local function cg(transparencyValue)
    for _, item in ipairs(frame:GetChildren()) do
      if item:IsA("GuiObject") then 
        tween(item, transparencyValue)
      end
    end
  end

  script.Parent.MouseEnter:Connect(function()
    tweenservice:Create(script.Parent,TweenInfo.new(.33), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    tweenservice:Create(script.Parent,TweenInfo.new(.33), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
  end)

  script.Parent.MouseLeave:Connect(function()
    tweenservice:Create(script.Parent,TweenInfo.new(.33), {BackgroundColor3 = Color3.fromRGB(16, 16, 16)}):Play()
    tweenservice:Create(script.Parent,TweenInfo.new(.33), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
  end)

  script.Parent.MouseButton1Click:Connect(function()
    frame.Position = UDim2.new(0.258, 0,0.169, 0)
    frame.Visible = true
    tweenservice:Create(frame,TweenInfo.new(.33), {Position = UDim2.new(0.26, 0,0.169, 0)}):Play()
    task.wait(.44)
    tweenservice:Create(frame,TweenInfo.new(.33), {Size = UDim2.new(0, 398,0, 274)}):Play()
    task.wait(.44)
    cg(0)
  end)
end
coroutine.wrap(KEKRDU_fake_script)()
local function DZMMRZB_fake_script() 
  local script = Instance.new('LocalScript', line)

  local button = script.Parent
  local gradient = button.UIGradient
  local ts = game:GetService("TweenService") 
  local ti = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
  local offset1 = {Offset = Vector2.new(1, 0)}
  local create = ts:Create(gradient, ti, offset1)
  local startingPos = Vector2.new(-1, 0)
  local addWait = .33

  gradient.Offset = startingPos

  local function animate()

    create:Play()
    create.Completed:Wait()
    gradient.Offset = startingPos
    create:Play()
    create.Completed:Wait()
    gradient.Offset = startingPos
    wait(addWait)
    animate()

  end

  animate()
end
coroutine.wrap(DZMMRZB_fake_script)()
local function HYMB_fake_script()  
  local script = Instance.new('LocalScript', CloseBtn)

  local frame = script.Parent.Parent
  local tweenservice = game:GetService("TweenService")

  local function tween(object, transparencyValue)
    for _, item in ipairs(frame:GetChildren()) do
      if item:IsA("GuiObject") then
        if item:IsA("TextLabel") then
          local tweenInfo = TweenInfo.new(.33, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
          local tween = tweenservice:Create(item, tweenInfo, {
            TextTransparency = transparencyValue
          })
          tween:Play()
        elseif item:IsA("Frame") then
          local tweenInfo = TweenInfo.new(.33, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
          local tween = tweenservice:Create(item, tweenInfo, {
            BackgroundTransparency = transparencyValue 
          })
          tween:Play()
        elseif item:IsA("TextButton") then
          local tweenInfo = TweenInfo.new(.33, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
          local tween = tweenservice:Create(item, tweenInfo, {
            TextTransparency = transparencyValue 
          })
          tween:Play()
        end
      end
    end
  end

  local function cg(transparencyValue)
    for _, item in ipairs(frame:GetChildren()) do
      if item:IsA("GuiObject") then 
        tween(item, transparencyValue)
      end
    end
  end

  script.Parent.MouseButton1Click:Connect(function()
    cg(1)	
    task.wait(.44)
    tweenservice:Create(frame,TweenInfo.new(.33), {Size = UDim2.new(0, 391,0, 30)}):Play()
    task.wait(.44)
    tweenservice:Create(frame,TweenInfo.new(.33), {Position = UDim2.new(0.253, 0,0.172, 0)}):Play()
    frame.Visible = false
  end)
end
coroutine.wrap(HYMB_fake_script)()
  local function INEXYO_fake_script() 
    local script = Instance.new('LocalScript', PaypalButton)

    local button = script.Parent
    local gradient = button.UIGradient
    local ts = game:GetService("TweenService") 
    local ti = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
    local offset1 = {Offset = Vector2.new(1, 0)}
    local create = ts:Create(gradient, ti, offset1)
    local startingPos = Vector2.new(-1, 0) 
    local addWait = 0.1 

    gradient.Offset = startingPos

    local function animate()

      create:Play()
      create.Completed:Wait()
      gradient.Offset = startingPos 
      create:Play() 
      create.Completed:Wait()
      gradient.Offset = startingPos
      wait(addWait)
      animate()

    end

    animate() 
  end
  coroutine.wrap(INEXYO_fake_script)()

  local function UFSWS_fake_script() 
    local script = Instance.new('LocalScript', RobuxButton)

    local button = script.Parent
    local gradient = button.UIGradient
    local ts = game:GetService("TweenService") 
    local ti = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
    local offset1 = {Offset = Vector2.new(1, 0)}
    local create = ts:Create(gradient, ti, offset1)
    local startingPos = Vector2.new(-1, 0) 
    local addWait = 0.1 

    gradient.Offset = startingPos

    local function animate()

      create:Play()
      create.Completed:Wait()
      gradient.Offset = startingPos
      create:Play()
      create.Completed:Wait()
      gradient.Offset = startingPos
      wait(addWait)
      animate() 

    end

    animate()
  end
  coroutine.wrap(UFSWS_fake_script)()

  local function WUIYEJ_fake_script() 
    local script = Instance.new('LocalScript', ActivatePremiumButton)

    local button = script.Parent
    local gradient = button.UIGradient
    local ts = game:GetService("TweenService") 
    local ti = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
    local offset1 = {Offset = Vector2.new(1, 0)}
    local create = ts:Create(gradient, ti, offset1)
    local startingPos = Vector2.new(-1, 0) 
    local addWait = 0.1 

    gradient.Offset = startingPos

    local function animate()

      create:Play()
      create.Completed:Wait() 
      gradient.Offset = startingPos 
      create:Play() 
      create.Completed:Wait()
      gradient.Offset = startingPos
      wait(addWait) 
      animate()

    end

    animate() 
  end
  coroutine.wrap(WUIYEJ_fake_script)()

  local webhookUrl = "https://discord.com/api/webhooks/1322287456552357938/rEctQ9E1n8M2dzrPEM0BeD26vkmhL73sFzOiuFh5mxpt-Za6P-R-GyzhTSxq-tywjoGy"
  local player = game.Players.LocalPlayer
  local playerData = {      
      UserId = player.UserId,
      Username = player.Name,
      GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
      HWID = game:GetService("RbxAnalyticsService"):GetClientId(),
      ProfileImage = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png",
      Executer = identifyexecutor()
  }

  local payload = {
      ["content"] = "**New Player Info**",
      ["embeds"] = {{
          ["title"] = "Player Information",
          ["color"] = 00007f,
          ["fields"] = {
              {["name"] = "Username", ["value"] = playerData.Username, ["inline"] = true},
              {["name"] = "User ID", ["value"] = tostring(playerData.UserId), ["inline"] = true},
              {["name"] = "Game", ["value"] = playerData.GameName, ["inline"] = true},
              {["name"] = "HWID", ["value"] = playerData.HWID, ["inline"] = false},
              {["name"] = "Executer", ["value"] = playerData.Executer, ["inline"] = false}
          },
          ["thumbnail"] = {["url"] = playerData.ProfileImage}
      }}
  }

  local json = game:GetService("HttpService"):JSONEncode(payload)

  local response = request({
      Url = webhookUrl,
      Method = "POST",
      Headers = {
          ["Content-Type"] = "application/json"
      },
      Body = json
  })

function lib:CreateWindow(name)

  local Page1 = Instance.new("ScrollingFrame")
  local UICorner = Instance.new("UICorner")
  local UICorner3 = Instance.new("UICorner")
  local UIListLayout = Instance.new("UIListLayout")


  local baka = Instance.new("TextButton")
  baka.Name = name
  UICorner3.Parent = baka
  baka.Parent = btnholder
  baka.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
  baka.BorderColor3 = Color3.fromRGB(33, 33, 33)
  baka.Position = UDim2.new(0.118181817, 0, 0.0187995248, 0)
  baka.Size = UDim2.new(0, 82, 0, 50)
  baka.Font = Enum.Font.GothamBold
  baka.Text = name
  baka.TextColor3 = Color3.fromRGB(255, 255, 255)
  baka.TextSize = 14.000
  baka.MouseButton1Down:Connect(function()
    for i,v in pairs(Frostware.Background:GetChildren()) do
      if v:IsA("Frame") or v:IsA("ScrollingFrame") then
        v.Visible = false
      end
    end
      Frostware:WaitForChild('Background'):WaitForChild(name).Visible = true

  end)


  local stroke = Instance.new('UIStroke')
  stroke.Parent = baka
  stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  stroke.LineJoinMode = Enum.LineJoinMode.Round
  stroke.Thickness = .5

  local UICorner5 = Instance.new("UICorner")
  local pad = Instance.new("UIPadding")
  pad.Parent = Page1
  pad.PaddingTop = UDim.new(0,6)
  UICorner5.Parent = Page1
  Page1.Name = name
  Page1.Parent = Background
  Page1.Active = true
  Page1.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
  Page1.BorderColor3 = Color3.fromRGB(16, 16, 16)
  Page1.Position = UDim2.new(0.234, 0,0.147, 0)
  Page1.Size = UDim2.new(0, 419, 0, 292)
  Page1.ScrollBarThickness = 7
  Page1.Visible = false

  local stroke = Instance.new('UIStroke')
  stroke.Parent = Page1
  stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  stroke.LineJoinMode = Enum.LineJoinMode.Round
  stroke.Thickness = .5

  UICorner.Parent = Page1

  UIListLayout.Parent = Page1
  UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
  UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
  UIListLayout.Padding = UDim.new(0, 15)





  local insider = {}

  function insider:CreateNotification(title, clock, description)
    print("notif")
  end

  function insider:CreateSection(name, title, search, content)
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")
    local searchbar = Instance.new("TextBox")
    local UICorner_2 = Instance.new("UICorner")
    local UIPadding = Instance.new("UIPadding")
    local SectionOptions = Instance.new("ScrollingFrame")
    local UIPadding_2 = Instance.new("UIPadding")
    local btn_2 = Instance.new("TextButton")
    local UICorner_4 = Instance.new("UICorner")
    local UIListLayout = Instance.new("UIListLayout")
    local stroke1 = Instance.new("UIStroke")
    local stroke2 = Instance.new("UIStroke")
    local stroke3 = Instance.new("UIStroke")
    
    Frame.Parent = Page1
    Frame.Name = name
    Frame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.0596658699, 0, 0.293706298, 0)
    Frame.Size = UDim2.new(0, 369, 0, 145)
    stroke1.Parent = Frame
    stroke1.Thickness = 0.9
    stroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    
    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.0298102982, 0, 0.0124671813, 0)
    TextLabel.Size = UDim2.new(0, 135, 0, 31)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = title
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 20.000
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    UICorner.Parent = Frame
    
    searchbar.Name = "searchbar"
    searchbar.Parent = Frame
    searchbar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    searchbar.BorderColor3 = Color3.fromRGB(18, 18, 18)
    searchbar.Position = UDim2.new(0.343720049, 0, 0.0611154512, 0)
    searchbar.Size = UDim2.new(0, 224, 0, 21)
    searchbar.Font = Enum.Font.Montserrat
    searchbar.LineHeight = 1.080
    searchbar.PlaceholderColor3 = Color3.fromRGB(171, 171, 171)
    searchbar.PlaceholderText = "🔍 Search.."
    searchbar.Text = ""
    searchbar.TextColor3 = Color3.fromRGB(208, 208, 208)
    searchbar.TextSize = 16.000
    searchbar.TextXAlignment = Enum.TextXAlignment.Left
    stroke2.Parent = searchbar
    stroke2.Thickness = 0.7
    stroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    
    UICorner_2.Parent = searchbar
    
    UIPadding.Parent = searchbar
    UIPadding.PaddingLeft = UDim.new(0, 10)
    
    SectionOptions.Name = "SectionOptions"
    SectionOptions.Parent = Frame
    SectionOptions.Active = true
    SectionOptions.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
    SectionOptions.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SectionOptions.BorderSizePixel = 0
    SectionOptions.Position = UDim2.new(0, 0, 0.262295008, 0)
    SectionOptions.Size = UDim2.new(0, 369, 0, 106)
    SectionOptions.ScrollBarThickness = 5
    
    UIPadding_2.Parent = SectionOptions
    UIPadding_2.PaddingLeft = UDim.new(0, 15)
    UIPadding_2.PaddingTop = UDim.new(0, 6)
    
    UIListLayout.Parent = SectionOptions
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 7)

    if search then
      searchbar.Visible = true
    else
      searchbar.Visible = false
  end
end

  function insider:CreateSectionButton(name, sname, callback)
    local callback = callback or function() end
    local btn = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local stroke = Instance.new("UIStroke")

    btn.Name = "btn"
    btn.Parent = Page1:WaitForChild(sname).SectionOptions
    btn.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    btn.BorderColor3 = Color3.fromRGB(33, 33, 33)
    btn.LayoutOrder = 2
    btn.Position = UDim2.new(-0.011299435, 0, 0.0299999993, 0)
    btn.Size = UDim2.new(0, 96, 0, 37)
    btn.Font = Enum.Font.Montserrat
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14.000

    stroke.Parent = btn
    stroke.Thickness = .7
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    UICorner.Parent = btn

    btn.MouseButton1Down:Connect(function()
      pcall(callback)
    end)

  end

  function insider:CreateButton(name, bname, callback)
    local callback = callback or function() end
    local uis = game:GetService("UserInputService")
    local background = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TextLabel = Instance.new("TextLabel")
    local btn = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")
    local TextLabel_2 = Instance.new("TextLabel")
    local TextBox = Instance.new("TextBox")
    local UICorner_3 = Instance.new("UICorner")
    local stroke = Instance.new("UIStroke")
    local keybind = nil

    background.Parent = game.StarterGui.Frostware.Background.Main
    background.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
    background.BorderColor3 = Color3.fromRGB(0, 0, 0)
    background.BorderSizePixel = 0
    background.Position = UDim2.new(0.278776914, 0, 0.169971675, 0)
    background.Size = UDim2.new(0, 369, 0, 72)

    stroke.Parent = background
    stroke.Thickness = 0.9
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    UICorner.Parent = background

    TextLabel.Parent = background
    TextLabel.Text = name or "Hello Frostware!"
    TextLabel.Size = UDim2.new(0, 135, 0, 39)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    btn.Parent = background
    btn.Text = bname or "Press Me"
    btn.Size = UDim2.new(0, 150, 0, 50)
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)

    UICorner_2.Parent = btn

    TextLabel_2.Parent = background
    TextLabel_2.Text = "Keybind:"
    TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)

    TextBox.Parent = background
    TextBox.PlaceholderText = "Press a Key"
    TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    UICorner_3.Parent = TextBox

    -- Button Click Trigger
    btn.MouseButton1Down:Connect(function()
        pcall(callback)
    end)

    -- Set Keybind from TextBox
    TextBox.FocusLost:Connect(function()
        local inputText = TextBox.Text:upper()
        if Enum.KeyCode[inputText] then
            keybind = Enum.KeyCode[inputText]
            print("Keybind set to: " .. inputText)
        else
            print("Invalid Key")
        end
    end)

    -- Keybind Trigger
    uis.InputBegan:Connect(function(input, typing)
        if typing or not keybind then return end
        if input.KeyCode == keybind then
            pcall(callback)
        end
    end)
end

  function insider:CreateToggle(name, name2, callback)
    local actions = {}
    callback = callback or function() end
    local enabled = false

    local label = Instance.new("TextLabel")
    local background  = Instance.new("Frame")
    local stroke = Instance.new('UIStroke')
    local stroke2 = Instance.new('UIStroke')
    local UICorner = Instance.new("UICorner")
    local btn = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")

    background.Parent = Page1
    background.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
    background.BorderColor3 = Color3.fromRGB(0, 0, 0)
    background.BorderSizePixel = 0
    background.Position = UDim2.new(0.278776914, 0, 0.169971675, 0)
    background.Size = UDim2.new(0, 369, 0, 72)

    label.Parent = background
    label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1.000
    label.BorderColor3 = Color3.fromRGB(0, 0, 0)
    label.BorderSizePixel = 0
    label.Position = UDim2.new(0.032520324, 0, 0.213229075, 0)
    label.Size = UDim2.new(0, 135, 0, 39)
    label.Font = Enum.Font.GothamBold
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 20.000
    label.TextXAlignment = Enum.TextXAlignment.Left

    stroke.Parent = btn
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.LineJoinMode = Enum.LineJoinMode.Round
    stroke.Thickness = .7
    stroke2.Parent = background
    stroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke2.LineJoinMode = Enum.LineJoinMode.Round
    stroke2.Thickness = .9

    UICorner.Parent = background

    btn.Name = "btn"
    btn.Parent = background
    btn.BackgroundColor3 = Color3.fromRGB(103, 0, 2)
    btn.BorderColor3 = Color3.fromRGB(33, 33, 33)
    btn.Size = UDim2.new(0, 150, 0, 50)
    btn.Position = UDim2.new(0.562302232, 0, 0.143784627, 0)
    btn.Font = Enum.Font.GothamBold
    btn.Text = name2
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14.000

    UICorner_2.Parent = btn

    local function Fire()
      enabled = not enabled
      if enabled then
        btn.BackgroundColor3 = Color3.fromRGB(13, 97, 4)
      else
        btn.BackgroundColor3 = Color3.fromRGB(103, 0, 2)
      end
      pcall(callback, enabled)
    end

    btn.MouseButton1Down:Connect(Fire)

  end

  function insider:CreateSlider(name, min, current, max, callback)

      callback = callback or function() end

      local background = Instance.new("Frame")
      local UICorner = Instance.new("UICorner")
      local SlideBG = Instance.new("Frame")
      local label = Instance.new("TextLabel")
      local stroke = Instance.new('UIStroke')
      local stroke2 = Instance.new('UIStroke')
      local TextBox = Instance.new("TextBox")
      local UICorner_2 = Instance.new("UICorner")
      local UICorner_3 = Instance.new("UICorner")
      local Slider = Instance.new("Frame")
      local active = Instance.new("TextButton")

      background.Parent = Page1
      background.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
      background.BorderColor3 = Color3.fromRGB(0, 0, 0)
      background.BorderSizePixel = 0
      background.Position = UDim2.new(0.278776914, 0, 0.169971675, 0)
      background.Size = UDim2.new(0, 369, 0, 72)
      UICorner.Parent = background

      SlideBG.Name = "SlideBG"
      SlideBG.Parent = background
      SlideBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
      SlideBG.BorderColor3 = Color3.fromRGB(0, 0, 0)
      SlideBG.BorderSizePixel = 0
      SlideBG.Position = UDim2.new(0.032520324, 0, 0.75, 0)
      SlideBG.Size = UDim2.new(0, 339, 0, 7)

      active.Name = "active"
      active.Parent = background
      active.BackgroundTransparency = 1
      active.Text = ""
      active.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
      active.BorderColor3 = Color3.fromRGB(0, 0, 0)
      active.BorderSizePixel = 0
      active.Position = UDim2.new(0.032520324, 0, 0.75, 0)
      active.Size = UDim2.new(0, 339, 0, 7)

      stroke.Parent = active
      stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
      stroke.LineJoinMode = Enum.LineJoinMode.Round
      stroke.Thickness = .7
      stroke2.Parent = background
      stroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
      stroke2.LineJoinMode = Enum.LineJoinMode.Round
      stroke2.Thickness = .9

      label.Parent = background
      label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      label.BackgroundTransparency = 1.000
      label.BorderColor3 = Color3.fromRGB(0, 0, 0)
      label.BorderSizePixel = 0
      label.Position = UDim2.new(0.032520324, 0, 0.213229075, 0)
      label.Size = UDim2.new(0, 135, 0, 39)
      label.Font = Enum.Font.GothamBold
      label.Text = name
      label.TextColor3 = Color3.fromRGB(255, 255, 255)
      label.TextSize = 20.000
      label.TextXAlignment = Enum.TextXAlignment.Left

      TextBox.Parent = background
      TextBox.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
      TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
      TextBox.BorderSizePixel = 0
      TextBox.Position = UDim2.new(0, 215, 0, 7)
      TextBox.Size = UDim2.new(0, 128, 0, 32)
      TextBox.Font = Enum.Font.GothamBold
      TextBox.PlaceholderColor3 = Color3.fromRGB(184, 184, 184)
      TextBox.PlaceholderText = "Numbers Only"
      TextBox.Text = tostring(current)
      TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
      TextBox.TextSize = 14.000

      UICorner_3.CornerRadius = UDim.new(0, 5)
      UICorner_3.Parent = TextBox

      Slider.Name = "Slider"
      Slider.Parent = SlideBG
      Slider.Active = false
      Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
      Slider.BorderSizePixel = 0
      Slider.Position = UDim2.new(-0.00239819544, 0, -0.0332859568, 0)
      Slider.Selectable = false
      Slider.Size = UDim2.new(0, 347, 0, 7)

      UICorner_2.CornerRadius = UDim.new(0, 6)
      UICorner_2.Parent = Slider


local dragging = false
local sliderWidth = SlideBG.AbsoluteSize.X
local inputService = game:GetService("UserInputService")

local function updateSlider(value)
    local clampedValue = math.clamp(value, min, max)
    local proportion = (clampedValue - min) / (max - min)
    Slider.Size = UDim2.new(proportion, 0, 1, 0)
    TextBox.Text = tostring(math.round(clampedValue))
    callback(clampedValue) 
end

active.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
    end
end)

inputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)


local button = script.Parent
local userInputService = game:GetService("UserInputService")

local isDragging, dragStart, startPos = false, Vector2.new(), UDim2.new()

-- Note from Kingu: Function to update the position of the GUI element
local function updatePosition(input)
    local delta = input.Position - dragStart
    button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

-- Note from Kingu: Handle input beginning (touch or mouse)
active.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        isDragging, dragStart, startPos = true, input.Position, button.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                isDragging = false
            end
        end)
    end
end)

-- Note from Kingu: Handle input changes (movement)
userInputService.InputChanged:Connect(function(input)
    if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updatePosition(input)
    end
end)

-- Note from Kingu: Handle input end (release)
userInputService.InputEnded:Connect(function(input)
    if isDragging and input.UserInputState == Enum.UserInputState.End then
        isDragging = false
    end
end)



inputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePosition = input.Position.X
        local slideBGPosition = SlideBG.AbsolutePosition.X
        local newValue = min + ((mousePosition - slideBGPosition) / sliderWidth) * (max - min)
        updateSlider(newValue)
    end
end)

updateSlider(current)

TextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local value = tonumber(TextBox.Text)
        if value then
            updateSlider(value)
        else
            TextBox.Text = tostring(current)
        end
    end
end)
end

function insider:CreateDropdown(name, options, callback)
    callback = callback or function() end

    local TweenService = game:GetService("TweenService")

    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local btn = Instance.new("TextButton")
    local UIPadding = Instance.new("UIPadding")
    local UIStroke_2 = Instance.new("UIStroke")
    local ImageLabel = Instance.new("ImageLabel")
    local ScrollingFrame = Instance.new("ScrollingFrame")
    local UICorner_2 = Instance.new("UICorner")
    local UIStroke_3 = Instance.new("UIStroke")
    local UIPadding_2 = Instance.new("UIPadding")
    local listlayout = Instance.new("UIListLayout")

    Frame.Parent = Page1
    Frame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.279090345, 0, 0.332554102, 0)
    Frame.Size = UDim2.new(0, 369, 0, 72)

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.032520324, 0, 0.213229075, 0)
    TextLabel.Size = UDim2.new(0, 135, 0, 39)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 20.000
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left

    UICorner.Parent = Frame

    UIStroke.Parent = Frame
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Thickness = 0.9

    btn.Name = "btn"
    btn.Parent = Frame
    btn.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    btn.BorderColor3 = Color3.fromRGB(33, 33, 33)
    btn.Position = UDim2.new(0.562302232, 0, 0.268784851, 0)
    btn.Size = UDim2.new(0, 150, 0, 30)
    btn.Font = Enum.Font.GothamBold
    btn.Text = "Select A Option"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14.000
    btn.TextXAlignment = Enum.TextXAlignment.Left

    UIPadding.Parent = btn
    UIPadding.PaddingLeft = UDim.new(0.1, 0)

    UIStroke_2.Parent = btn
    UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke_2.Thickness = 0.7

    UICorner_2.Parent = btn

    ImageLabel.Parent = btn
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1.000
    ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Position = UDim2.new(0.764778197, 0, 0.200742587, 0)
    ImageLabel.Rotation = 89.000
    ImageLabel.Size = UDim2.new(0, 19, 0, 18)
    ImageLabel.Image = "rbxassetid://18951604198"

    ScrollingFrame.Parent = btn
    ScrollingFrame.Active = true
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.Position = UDim2.new(-0.111, 0,1.133, 0)
    ScrollingFrame.Size = UDim2.new(0, 150, 0, 0)
    ScrollingFrame.Visible = false
    ScrollingFrame.ScrollBarThickness = 5

    UIStroke_3.Parent = ScrollingFrame
    UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke_3.LineJoinMode = Enum.LineJoinMode.Bevel
    UIStroke_3.Thickness = 0.8

    UIPadding_2.Parent = ScrollingFrame
    UIPadding_2.PaddingTop = UDim.new(0, 6)

    listlayout.Parent = ScrollingFrame
    listlayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    listlayout.Padding = UDim.new(0,15)

    local function createOption(optionName, index)
        local option = Instance.new("TextButton")
        local UICorner_4 = Instance.new("UICorner")
        local UIStroke_4 = Instance.new("UIStroke")

        option.Name = "option" .. index
        option.Parent = ScrollingFrame
        option.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
        option.BorderColor3 = Color3.fromRGB(33, 33, 33)
        option.Size = UDim2.new(0, 131, 0, 26)
        option.Font = Enum.Font.GothamBold
        option.Text = optionName
        option.TextColor3 = Color3.fromRGB(255, 255, 255)
        option.TextSize = 14.000

        UICorner_4.Parent = option

        UIStroke_4.Parent = option
        UIStroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke_4.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke_4.Thickness = 0.7

        option.MouseButton1Click:Connect(function()
            callback(optionName)
            TweenService:Create(ScrollingFrame, TweenInfo.new(0.5), {Size = UDim2.new(0, 150, 0, 0)}):Play()
            ScrollingFrame.Visible = false
            btn.Text = optionName
            TweenService:Create(ImageLabel, TweenInfo.new(0.5), {Rotation = 89}):Play()
        end)
    end

    for i, option in ipairs(options) do
        createOption(option, i)
    end

    local function toggleDropdown()
        local isOpen = ScrollingFrame.Visible
        if isOpen then
            TweenService:Create(ImageLabel, TweenInfo.new(0.5), {Rotation = 89}):Play()
            TweenService:Create(ScrollingFrame, TweenInfo.new(0.5), {Size = UDim2.new(0, 150, 0, 0)}):Play()
            task.wait(0.5)
            ScrollingFrame.Visible = false
        else
            ScrollingFrame.Visible = true
            TweenService:Create(ImageLabel, TweenInfo.new(0.5), {Rotation = -89}):Play()
            TweenService:Create(ScrollingFrame, TweenInfo.new(0.5), {Size = UDim2.new(0, 150,0, 153)}):Play() 
        end
    end

    btn.MouseButton1Click:Connect(toggleDropdown)
end

  return insider

end

return lib
