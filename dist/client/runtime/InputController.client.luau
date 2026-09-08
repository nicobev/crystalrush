local UserInputService = game:GetService("UserInputService")
local World = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('World'))
local AbilityComponent = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Components'):WaitForChild('Ability')).Component

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end

    if input.KeyCode == Enum.KeyCode.E then
        for id, abilityComp in World:query(AbilityComponent) do
            if abilityComp.abilities.Dash then
                abilityComp.abilities.Dash._activateFlag = true
            end
        end
    end
end)
