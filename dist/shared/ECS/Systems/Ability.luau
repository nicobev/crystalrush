local AbilitySystem = {}
local AbilityComponent = require(script.Parent.Parent:WaitForChild('Components'):WaitForChild('Ability')).Component

function AbilitySystem:update(world, dt)
	for id, abilityComp in world:query(AbilityComponent) do
		if abilityComp and abilityComp.abilities then
			for _, ability in pairs(abilityComp.abilities) do
				if ability._activateFlag then
					ability._activateFlag = false
					ability:Activate()
				end
			end
		end
	end
end

return AbilitySystem
