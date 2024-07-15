

-- made for fun 
function checkOffsets()
    -- Replace these with actual memory addresses and values you're checking lmfao
    local offset1 = readMemory(0x12345678, "int")  --  replace memory address
    local offset2 = readMemory(0x23456789, "int")  --  replace memory address

    -- Check the values at these memory addresses (example values)
    if offset1 == 0xDEADBEEF and offset2 == 0xBEEFDEAD then
        return true
    else
        return false
    end
end


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
textLabel.Text = "Checking offsets..."
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.TextScaled = true


if checkOffsets() then
    textLabel.Text = "Offsets verified\n\nExecuting.. Cubix Agentusernify\n\nUsername: " .. username
    

    wait(2)
    




    textLabel.Text = "Executed"
else
    textLabel.Text = "Offset check failed"
end


