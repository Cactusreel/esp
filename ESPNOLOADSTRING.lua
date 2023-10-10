--FOR MORE SCRIPTS PLS SUB--
--no loadstring--
--press e--


-- Function to highlight all players
local function highlightPlayers()
    -- Get all players in the game
    local players = game:GetService("Players"):GetPlayers()
    
    -- Loop through each player
    for _, player in ipairs(players) do
        -- Check if the player has a character and is not the local player
        if player.Character and player ~= game:GetService("Players").LocalPlayer then
            -- Create a highlight effect
            local highlight = Instance.new("SelectionBox")
            highlight.Name = "PlayerHighlight"
            highlight.Adornee = player.Character.PrimaryPart
            highlight.Color3 = Color3.fromRGB(255, 255, 0) -- Yellow color
            
            -- Attach the highlight effect to the player's character
            highlight.Parent = player.Character
        end
    end
end

-- Function to remove highlights from all players
local function removeHighlights()
    -- Get all players in the game
    local players = game:GetService("Players"):GetPlayers()
    
    -- Loop through each player
    for _, player in ipairs(players) do
        -- Check if the player has a character and is not the local player
        if player.Character and player ~= game:GetService("Players").LocalPlayer then
            -- Find and remove the highlight effect from the player's character
            local highlight = player.Character:FindFirstChild("PlayerHighlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end

-- Bind the functions to key presses

-- When "E" key is pressed, call the highlightPlayers function
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        highlightPlayers()
    end
end)

-- When "E" key is released, call the removeHighlights function
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        removeHighlights()
    end
end)

