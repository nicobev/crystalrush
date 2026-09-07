local MovementSystem = {}

function MovementSystem:update(world, dt)
    for id, pos, move in world:query("PositionComponent", "MovementComponent") do
        pos.x += move.direction.X * move.speed * dt
        pos.y += move.direction.Y * move.speed * dt
        pos.z += move.direction.Z * move.speed * dt
    end
end

return MovementSystem
