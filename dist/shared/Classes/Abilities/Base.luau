local Promise = require(game:GetService('ReplicatedStorage'):WaitForChild('Packages'):WaitForChild('Promise'))
local Trove = require(game:GetService('ReplicatedStorage'):WaitForChild('Packages'):WaitForChild('Trove'))
local Signal = require(game:GetService('ReplicatedStorage'):WaitForChild('Packages'):WaitForChild('Signal'))

local AbilityBase = {}
AbilityBase.__index = AbilityBase

function AbilityBase.new(player,config)
    local self = setmetatable({}, AbilityBase)

    self.player = player
    self.cooldown = config.cooldown or 1
    self.isCoolingDown = false

    self._trove = Trove.new()
    self.Activated = Signal.new()

    return self
end

function AbilityBase:CanActivate()
    return not self.isCoolingDown
end

function AbilityBase:StartCooldown()
    self.isCoolingDown = true
    Promise.delay(self.cooldown):andThen(function()
        self.isCoolingDown = false
    end)
end

function AbilityBase:Destroy() 
    self._trove:Destroy()
end

return AbilityBase