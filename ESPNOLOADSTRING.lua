-- Function to put a green box on all players
local function putGreenBoxOnPlayers()
    -- Get all players in the game
    local players = game:GetService("Players"):GetPlayers()
    
    -- Loop through each player
    for _, player in ipairs(players) do
        -- Check if the player has a character and is not the local player
        if player.Character and player ~= game:GetService("Players").LocalPlayer then
            -- Create a green box part
            local greenBox = Instance.new("Part")
            greenBox.Name = "PlayerGreenBox"
            greenBox.Size = Vector3.new(2, 2, 2)
            greenBox.BrickColor = BrickColor.new("Bright green")
            
            -- Attach the green box to the player's character
            greenBox.Parent = player.Character
            
            -- Position the green box above the player's head
            local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")
            greenBox.Position = humanoidRootPart.Position + Vector3.new(0, 3, 0)
        end
    end
end

-- Function to remove the green boxes from all players
local function removeGreenBoxes()
    -- Get all players in the game
    local players = game:GetService("Players"):GetPlayers()
    
    -- Loop through each player
    for _, player in ipairs(players) do
        -- Check if the player has a character and is not the local player
        if player.Character and player ~= game:GetService("Players").LocalPlayer then
            -- Find and remove the green box from the player's character
            local greenBox = player.Character:FindFirstChild("PlayerGreenBox")
            if greenBox then
                greenBox:Destroy()
            end
        end
    end
end

-- Bind the functions to key presses

-- When "E" key is pressed, call the putGreenBoxOnPlayers function
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        putGreenBoxOnPlayers()
    end
end)

-- When "E" key is released, call the removeGreenBoxes function
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        removeGreenBoxes()
    end
en

