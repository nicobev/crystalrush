local world = require(script.Parent:WaitForChild('World'))

local Entity = {}
Entity.__index = Entity

function Entity.new()
    local id = world:entity()
    return setmetatable({ id = id }, Entity)
end

function Entity:add(component)
    world:addComponent(self.id, component)
end

return Entity