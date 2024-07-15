
    print"script loaded x1 )
    -- Create the GUI elements
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local AutoButton = Instance.new("TextButton")
local ManualButton = Instance.new("TextButton")

-- Set properties for the ScreenGui
ScreenGui.Name = "PurchaseGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Set properties for the Frame
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.Size = UDim2.new(0, 200, 0, 100)

-- Set properties for the TextBox
TextBox.Name = "ProductIdBox"
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
TextBox.Position = UDim2.new(0.1, 0, 0.1, 0)
TextBox.Size = UDim2.new(0.8, 0, 0.3, 0)
TextBox.PlaceholderText = "Enter Product ID"

-- Set properties for the AutoButton
AutoButton.Name = "AutoButton"
AutoButton.Parent = Frame
AutoButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
AutoButton.Position = UDim2.new(0.1, 0, 0.5, 0)
AutoButton.Size = UDim2.new(0.35, 0, 0.3, 0)
AutoButton.Text = "Auto"

-- Set properties for the ManualButton
ManualButton.Name = "ManualButton"
ManualButton.Parent = Frame
ManualButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
ManualButton.Position = UDim2.new(0.55, 0, 0.5, 0)
ManualButton.Size = UDim2.new(0.35, 0, 0.3, 0)
ManualButton.Text = "Manual"

-- Reference to MarketplaceService
local MarketplaceService = game:GetService("MarketplaceService")

-- Function to prompt a purchase
local function promptPurchase(productId)
    local player = game.Players.LocalPlayer
    if not player then
        warn("LocalPlayer not found")
        return
    end
    if not tonumber(productId) then
        warn("Invalid Product ID")
        return
    end

    local success, errorMessage = pcall(function()
        MarketplaceService:PromptProductPurchase(player, tonumber(productId))
    end)

    if not success then
        warn("Failed to prompt purchase: " .. errorMessage)
    end
end

-- Connect AutoButton to promptPurchase
AutoButton.MouseButton1Click:Connect(function()
    local productId = TextBox.Text
    if productId == "" then
        warn("Product ID is empty")
        return
    end
    print("AutoButton clicked with Product ID: " .. productId)
    promptPurchase(productId)
end)

-- Connect ManualButton to promptPurchase
ManualButton.MouseButton1Click:Connect(function()
    local productId = TextBox.Text
    if productId == "" then
        warn("Product ID is empty")
        return
    end
    print("ManualButton clicked with Product ID: " .. productId)
    promptPurchase(productId)
end)
