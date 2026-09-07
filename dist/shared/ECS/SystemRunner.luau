local RunService = game:GetService("RunService")
local world = require(script.Parent:WaitForChild('World'))

local systems = {}

local SystemRunner = {}

function SystemRunner.add(system)
    table.insert(systems, system)
end

RunService.Heartbeat:Connect(function(dt)
    for _, system in ipairs(systems) do
        system:update(world, dt)
    end
end)

return SystemRunner
