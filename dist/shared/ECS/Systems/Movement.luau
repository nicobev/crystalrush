local MovementSystem = {}
local MovementComponent = require(script.Parent.Parent:WaitForChild('Components'):WaitForChild('Movement')).Component
local PositionComponent = require(script.Parent.Parent:WaitForChild('Components'):WaitForChild('Position')).Component

function MovementSystem:update(world, dt)
    for id, pos, move in world:query(PositionComponent, MovementComponent) do
        if id and pos and move then
            local newPos = pos + move.direction * move.speed * dt
            world:set(id, PositionComponent, newPos)
        end
    end
end

return MovementSystem
