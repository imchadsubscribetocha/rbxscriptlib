-- Using index, value loops, or "iterations" can be useful.
-- The purpose is to index through several objects within a list at once.

local list = workspace:GetChildren() -- Now, it depends on what you're finding.
-- For those who are legitamately exploiting in roblox, let's say that you theoretically want to loop through objects in the workspace or World.
-- GetChildren is a method that gets the objects whose parent properties are workspace.
-- You can use GetDescendants to get the descending objects in the workspace, this means any object under any other object in workspace will be accounted for.


for index, value in pairs(list) do
	-- Now that we have our variable, let's input that into the pairs function.
	-- Now looping can be easy for those exploiting in roblox, but sometimes tables can have different value types.

	-- We should check the value's existance and it's type first before proceeding to do anything else
	-- Since I'm looking through the workspace, I'll be checking if it's an Instance and if typeof is a valid function.
	if value and typeof and typeof(value) == "Instance" then
		-- Now that we have our Instance, we can check what the class of the Instance is.
		if value:IsA("VehicleSeat") then
			-- Let's give all vehicle seats a little boost.
			-- This typically wouldn't work in client-sided exploiting, so the best way this would work is through the server.
			value.AssemblyLinearVelocity = value.AssemblyLinearVelocity * (value.CFrame.LookVector.Unit * Vector3.new(4, 4, 4))
		end
	end
end

-- Keep in mind there are other ways to loop through objects & do iterations.
-- Below are all examples of iterations.

for index, value in pairs({}) do
	
end

for index, value in next, {} do
	
end

local yourtable = {}
for index = 1, table.getn(yourtable) do
	local value = yourtable[index]
end
