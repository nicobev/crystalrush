local Players = game:GetService("Players")

local Entity = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Entity'))

local createPosition = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Components'):WaitForChild('Position')).Create
local createMovement = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Components'):WaitForChild('Movement')).Create
local createPlayerTag = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Components'):WaitForChild('PlayerTag')).Create
local createAbility = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Components'):WaitForChild('Ability')).Create

local DashAbility = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('Classes'):WaitForChild('Abilities'):WaitForChild('Dash'))

local onCharAdded = function(player,char)

        local root = char:WaitForChild("HumanoidRootPart")

        local e = Entity.new()
        createPosition(e, root.Position)
        createMovement(e, 20)
        createPlayerTag(e)

        createAbility(e, {
            Dash = DashAbility.new(player)
        })

end

local onPlayerAdded = function(player)

    player.CharacterAdded:Connect(function(char)
        onCharAdded(player, char)
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)
for _, player in pairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

print("PlayerEntityInit running")
