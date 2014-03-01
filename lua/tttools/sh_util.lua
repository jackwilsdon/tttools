--[[
	 _______ _______ _______          _
	|__   __|__   __|__   __|        | |
	   | |     | |     | | ___   ___ | |___
	   | |     | |     | |/ _ \ / _ \| / __|
	   | |     | |     | | (_) | (_) | \__ \
	   |_|     |_|     |_|\___/ \___/|_|___/

	A set of tools for TTT addon developers.

	-- tttools/sh_util.lua
	Utility functions for tttools
--]]


--[[
	Type checking functions
--]]

function is(var, tp) return type(var) == tostring(tp) end

function istable(var) return type(var) == 'table' end
function isnumber(var) return type(var) == 'number' end
function isstring(var) return type(var) == 'string' end
function isboolean(var) return type(var) == 'boolean' end
function isfunction(var) return type(var) == 'function' end

function ise(var, tp, name)
	local err = tostring(name or 'var') .. ' is not a ' .. tostring(tp)
	assert(is(var, tp), err)
end

--[[
	String functions
--]]

function string.fupper(self)
	if not isstring(self) then return self end

	local up = self:sub(1, 1)
	local down = self:sub(2)

	return up:upper() .. down:lower()
end

--[[
	Hook functions
--]]

function hook.Exists(action, name)
	ise(action, 'string', 'action')
	ise(name, 'string', 'name')

	local hooks = hook.GetTable()

	if not istable(hooks) then return false end
	if not istable(hooks[action]) then return false end

	return istable(hooks[action][name])
end