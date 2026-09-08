local jecs = require(game:GetService('ReplicatedStorage'):WaitForChild('Packages'):WaitForChild('Jecs'))
local world = require(script.Parent.Parent:WaitForChild('World'))

local Position = world:component() :: jecs.Id<Vector3>

return {
    Component = Position,
    Create = function(entity, position)
        entity:set(Position, position or Vector3.zero)
    end
}