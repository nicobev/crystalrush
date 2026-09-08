local jecs = require(game:GetService('ReplicatedStorage'):WaitForChild('Packages'):WaitForChild('Jecs'))
local world = require(script.Parent.Parent:WaitForChild('World'))

local Ability = world:component() :: jecs.Id<{
    abilities: {[string]: any},
}>

return {
    Component = Ability,
    Create = function(entity, abilities)

        entity:set(Ability, {
            abilities = abilities or {}
        })
    end
}