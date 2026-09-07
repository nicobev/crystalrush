local World = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('World'))
local SystemRunner = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('SystemRunner'))

local MovementSystem = require(game:GetService('ReplicatedStorage'):WaitForChild('Shared'):WaitForChild('ECS'):WaitForChild('Systems'):WaitForChild('Movement'))

SystemRunner.add(MovementSystem)
print(World)