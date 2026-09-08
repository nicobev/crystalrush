local world = require(script.Parent:WaitForChild('World'))

local Entity = {}
Entity.__index = Entity

function Entity.new()
    local id = world:entity()
    return setmetatable({ id = id }, Entity)
end

function Entity:add(component)
    world:add(self.id, component)
end

function Entity:set(component, value)
    world:set(self.id, component, value)
end

return Entity