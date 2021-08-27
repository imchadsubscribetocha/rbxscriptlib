local rawmetatable = getrawmetatable(game) -- Can be userdata too.
setreadonly(rawmetatable, false) -- This allows the metatable to be modified
local latestmethod = rawmetatable.__namecall -- The original method, save it

rawmetatable.__namecall = newcclosure(function(self, ...) -- This is important, always use newcclosure.
	local tuple = {...} -- Pack the arguments into a table if you're needing to index them

	if self == game.GetService(game, "MarketplaceService") then -- You can index your functions from the userdata you converted, but don't use it in method form because it calls this method (__namecall)
		if getnamecallmethod() --[[ This gets the method that was requested, then we compare it ]] == "UserOwnsGamePassAsync" --[[We're checking if the method is the gamepass check method]] then
			return true -- You can spoof or "fork" the response that is given back, this is what makes this a powerful script.
		end
	end

	return latestmethod(self, unpack(tuple)) -- Then you unpack it along with "self" to assure the original method is called depending on wether or not the use of forking or hooking functions and methods has occured
end) -- The function within is the overriding function, you must return the original method that came with it (including the arguments passed).
