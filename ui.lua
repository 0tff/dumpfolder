local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AriesUI"
screenGui.Parent = playerGui

-- Create frame for buttons
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 200)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 102, 204)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Create first button
local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(0, 150, 0, 50)
executeButton.Position = UDim2.new(0.5, -75, 0.3, -25)
executeButton.BackgroundColor3 = Color3.fromRGB(0, 153, 255)
executeButton.Text = "Execute Script"
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.Font = Enum.Font.SourceSans
executeButton.TextSize = 24
executeButton.Parent = mainFrame

-- Create second button
local popupButton = Instance.new("TextButton")
popupButton.Size = UDim2.new(0, 150, 0, 50)
popupButton.Position = UDim2.new(0.5, -75, 0.7, -25)
popupButton.BackgroundColor3 = Color3.fromRGB(0, 153, 255)
popupButton.Text = "Show Popup"
popupButton.TextColor3 = Color3.fromRGB(255, 255, 255)
popupButton.Font = Enum.Font.SourceSans
popupButton.TextSize = 24
popupButton.Parent = mainFrame

-- Create textbox for script execution
local scriptTextbox = Instance.new("TextBox")
scriptTextbox.Size = UDim2.new(0, 300, 0, 100)
scriptTextbox.Position = UDim2.new(0.5, -150, 0.5, -50)
scriptTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scriptTextbox.Visible = false
scriptTextbox.Font = Enum.Font.SourceSans
scriptTextbox.TextSize = 18
scriptTextbox.TextColor3 = Color3.fromRGB(0, 0, 0)
scriptTextbox.Parent = screenGui

-- Create popup label
local popupLabel = Instance.new("TextLabel")
popupLabel.Size = UDim2.new(0, 300, 0, 100)
popupLabel.Position = UDim2.new(0.5, -150, 0.5, -50)
popupLabel.BackgroundColor3 = Color3.fromRGB(0, 102, 204)
popupLabel.Text = "Made by Aries Team"
popupLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
popupLabel.Font = Enum.Font.SourceSans
popupLabel.TextSize = 24
popupLabel.Visible = false
popupLabel.Parent = screenGui

-- Tween function
local function createTween(instance, properties, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(instance, tweenInfo, properties)
    return tween
end

-- Button click events
executeButton.MouseButton1Click:Connect(function()
    scriptTextbox.Visible = true
    local rotateTween = createTween(scriptTextbox, {Rotation = 360}, 1)
    rotateTween:Play()
end)

popupButton.MouseButton1Click:Connect(function()
    popupLabel.Visible = true
    local rotateTween = createTween(popupLabel, {Rotation = 360}, 1)
    rotateTween:Play()
end)
