-- Dependencies
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer
local Chat = game:GetService("Chat")

-- Function to hide all GUI buttons
local function hideGUI()
    for _, child in ipairs(Player.PlayerGui:GetChildren()) do
        if child:IsA("GuiObject") and child:IsA("Button") then
            child.Visible = false
        end
    end
end

-- Function to simulate character movement
local function moveCharacter()
    local character = Player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local rootPart = character.HumanoidRootPart
        local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
        local goal = {Position = rootPart.Position + Vector3.new(10, 0, 10)}
        local tween = TweenService:Create(rootPart, tweenInfo, goal)
        tween:Play()
    end
end

-- Function to simulate sending a message in chat
local function spamChat()
    while true do
        Chat:Chat(Player.Character.Head, "discord.gg/cubix", Enum.ChatColor.Red)
        wait(5) -- Adjust the delay as needed
    end
end

-- Function to simulate the prank
local function simulatePrank()
    hideGUI()
    wait(1) -- Wait for a second before moving the character
    moveCharacter()
    wait(1) -- Wait a bit before starting the chat spam
    spamChat()
end

-- Main execution
simulatePrank()
