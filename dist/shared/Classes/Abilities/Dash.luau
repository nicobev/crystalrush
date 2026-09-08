local AbilityBase = require(script.Parent:WaitForChild('Base'))

local DashAbility = {}
DashAbility.__index = DashAbility
setmetatable(DashAbility, AbilityBase)

function DashAbility.new(player)
    local self = AbilityBase.new(player, {
        cooldown = 2,
    })

    setmetatable(self, DashAbility)
    return self
end

function DashAbility:Activate()
    if not self:CanActivate() then return end

    self.Activated:Fire()

    local char = self.player.Character
    local root = char:FindFirstChild("HumanoidRootPart")

    -- Dash impulse
    root.AssemblyLinearVelocity = root.CFrame.LookVector * 80

    -- Cooldown
    self:StartCooldown()
end

return DashAbility