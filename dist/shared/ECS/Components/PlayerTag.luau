local jecs = require(game:GetService('ReplicatedStorage'):WaitForChild('Packages'):WaitForChild('Jecs'))
local world = require(script.Parent.Parent:WaitForChild('World'))

local PlayerTag = world:component() :: jecs.Id<{
    isPlayer: boolean
}>

return {
    Component = PlayerTag,
    Create = function(entity)
        entity:set(PlayerTag, {
            isPlayer = true
        })
    end
}