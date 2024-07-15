
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local ChatService = require(game:GetService("Chat"))


local chatFrame = Instance.new("Frame")
chatFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
chatFrame.Position = UDim2.new(0.7, 0, 0.6, 0)
chatFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
chatFrame.BackgroundTransparency = 0.5
chatFrame.Parent = PlayerGui

local chatMessages = Instance.new("TextLabel")
chatMessages.Size = UDim2.new(1, 0, 1, 0)
chatMessages.BackgroundTransparency = 1
chatMessages.TextColor3 = Color3.fromRGB(255, 255, 255)
chatMessages.TextStrokeTransparency = 0.7
chatMessages.TextScaled = true
chatMessages.TextWrapped = true
chatMessages.Parent = chatFrame


local function toggleChatVisibility()
    chatFrame.Visible = not chatFrame.Visible
end


local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.T then
        toggleChatVisibility()
    end
end)


ChatService.OnMessageAdded = function(message)
    local filteredMessage = ChatService:FilterStringForUser(message.Text, LocalPlayer.UserId)
    chatMessages.Text = chatMessages.Text .. "\n" .. filteredMessage
end
