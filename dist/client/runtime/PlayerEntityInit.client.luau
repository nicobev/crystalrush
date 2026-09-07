local Players = game:GetService("Players")

local Entity = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Entity'))
local PositionComponent = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Components'):WaitForChild('Position'))
local MovementComponent = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Components'):WaitForChild('Movement'))
local PlayerTag = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Components'):WaitForChild('PlayerTag'))

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        local root = char:WaitForChild("HumanoidRootPart")

        local e = Entity.new()
        e:add(PositionComponent(root.Position.X, root.Position.Y, root.Position.Z))
        e:add(MovementComponent(20))
        e:add(PlayerTag())
    end)
end)
