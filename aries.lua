local screenGui = script.Parent
local titleLabel = screenGui:WaitForChild("TitleLabel")

screenGui.ResetOnSpawn = false

titleLabel.Text = "Aries and Team"
titleLabel.TextColor3 = Color3.fromRGB(0, 0, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextScaled = true
titleLabel.BackgroundTransparency = 1
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)

local backgroundFrame = Instance.new("Frame", screenGui)
backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backgroundFrame.ZIndex = -1

local function fadeInAndOut(label)
    for _ = 1, 2 do
        for i = 0, 1, 0.01 do
            label.TextTransparency = 1 - i
            wait(0.05)
        end
        wait(1)
        for i = 0, 1, 0.01 do
            label.TextTransparency = i
            wait(0.05)
        end
        wait(1)
    end
end

local function executeGitHubScript(url)
    local http = game:GetService("HttpService")
    local response = http:GetAsync(url)
    local scriptFunction = loadstring(response)
    if scriptFunction then
        scriptFunction()
    else
        warn("Failed to load the script from GitHub")
    end
end

local githubScriptURL = "https://raw.githubusercontent.com/yourusername/yourrepository/main/yourscript.lua"

spawn(function()
    fadeInAndOut(titleLabel)
    executeGitHubScript(githubScriptURL)
end)
