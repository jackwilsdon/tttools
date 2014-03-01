--[[
	 _______ _______ _______          _
	|__   __|__   __|__   __|        | |
	   | |     | |     | | ___   ___ | |___
	   | |     | |     | |/ _ \ / _ \| / __|
	   | |     | |     | | (_) | (_) | \__ \
	   |_|     |_|     |_|\___/ \___/|_|___/

	A set of tools for TTT addon developers.

	-- tttools/sv_hooks.lua
	A set of TTT-related hooks
--]]

--[[
	Hook namespace
--]]

local hook_namespace = 'tttools'
local namespace_delim = '_'

local function GetNamespace(action)
	return string.lower(tostring(hook_namespace) .. tostring(namespace_delim) .. tostring(action))
end

--[[
	Hooking functions
--]]

local function Hook(action, func, force)
	ise(action, 'string', 'action')
	ise(func, 'function', 'func')

	if not is(force, 'nil') and not isboolean(force) then
		error('force is not a boolean')
	end

	local name = GetNamespace(action)
	local exists = hook.Exists(action, name)
	if exists and not force then
		error('hook ' .. name .. ' already exists')
	elseif exists and force then
		hook.Remove(action, name)
	end

	hook.Add(action, name, func)
end

local function HookTable(tbl, force)
	for action, func in ipairs(tbl) do
		print("Hooking " .. action)
		Hook(action, func, force)
	end
end

--[[
	TTT-related hooks
--]]

local hooks = {}

function hooks.PlayerDeath(victim, weapon, killer)
	if not IsPlayer(victim) or not IsPlayer(killer) then return end
	if victim == weapon or victim == killer then return end

	local victim_role = victim:GetRoleStringRaw()
	local killer_role = killer:GetRoleStringRaw()

	if is(victim_role, 'nil') or is(killer_role, 'nil') then return end

	local nice_victim_role = victim_role:fupper()
	local nice_killer_role = killer_role:fupper()

	print(nice_victim_role, 'killed', nice_killer_role)
end

HookTable(hooks)