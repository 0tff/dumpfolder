local screenGui = script.Parent
local logoButton = Instance.new("ImageButton", screenGui)
local mainFrame = Instance.new("Frame", screenGui)
local textBox = Instance.new("TextBox", mainFrame)
local executeButton = Instance.new("TextButton", mainFrame)

screenGui.ResetOnSpawn = false

logoButton.Name = "LogoButton"
logoButton.Size = UDim2.new(0, 50, 0, 50)
logoButton.Position = UDim2.new(0, 10, 0, 10)
logoButton.Image = "rbxassetid://"
logoButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logoButton.BorderSizePixel = 0

mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

textBox.Name = "ScriptTextBox"
textBox.Size = UDim2.new(0.9, 0, 0.6, 0)
textBox.Position = UDim2.new(0.05, 0, 0.2, 0)
textBox.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
textBox.BorderColor3 = Color3.fromRGB(0, 0, 255)
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textBox.TextScaled = true
textBox.Font = Enum.Font.SourceSansBold
textBox.PlaceholderText = "Enter your script here..."

executeButton.Name = "ExecuteButton"
executeButton.Size = UDim2.new(0.5, 0, 0.2, 0)
executeButton.Position = UDim2.new(0.25, 0, 0.8, 0)
executeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.Text = "Execute"
executeButton.TextScaled = true
executeButton.Font = Enum.Font.SourceSansBold

logoButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

executeButton.MouseButton1Click:Connect(function()
    local scriptText = textBox.Text
    local success, err = pcall(function()
        loadstring(scriptText)()
    end)
    if not success then
        warn("Error executing script: " .. err)
    end
end)
