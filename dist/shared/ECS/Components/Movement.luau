local jecs = require(game:GetService('ReplicatedStorage'):WaitForChild('Packages'):WaitForChild('Jecs'))
local world = require(script.Parent.Parent:WaitForChild('World'))

local Movement = world:component() :: jecs.Id<{
    speed: number,
    direction: Vector3,
}>

return {
    Component = Movement,
    Create = function(entity, speed)
        entity:set(Movement, {
            speed = speed or 16,
            direction = Vector3.new(0, 0, 0),
        })
    end
}
