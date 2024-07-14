
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer


local function dumpScripts()
    local scripts = {}
    local function dumpDescendants(parent)
        for _, child in ipairs(parent:GetChildren()) do
            if child:IsA("Script") or child:IsA("LocalScript") then
                table.insert(scripts, {path = child:GetFullName(), source = child.Source})
            end
            dumpDescendants(child)
        end
    end

    dumpDescendants(game)

    local log = "Script Dump:\n"
    for _, script in ipairs(scripts) do
        log = log .. "Path: " .. script.path .. "\nSource:\n" .. script.source .. "\n\n"
    end

    
    local ScreenGui = Instance.new("ScreenGui", Player.PlayerGui)
    local TextBox = Instance.new("TextBox", ScreenGui)
    TextBox.Text = log
    TextBox.Size = UDim2.new(1, 0, 1, 0)
    TextBox.Position = UDim2.new(0, 0, 0, 0)
    TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextScaled = true
    TextBox.TextWrapped = true
    TextBox.TextSize = 14
    TextBox.ClearTextOnFocus = false
    TextBox.MultiLine = true
end


dumpScripts()
