--[[
	 _______ _______ _______          _
	|__   __|__   __|__   __|        | |
	   | |     | |     | | ___   ___ | |___
	   | |     | |     | |/ _ \ / _ \| / __|
	   | |     | |     | | (_) | (_) | \__ \
	   |_|     |_|     |_|\___/ \___/|_|___/

	A set of tools for TTT addon developers.

	-- autorun/tttools.lua
	Loads all of the necessary client and server-side files
--]]

if SERVER then
	include('tttools/sh_util.lua')
	include('tttools/shared.lua')
	include('tttools/sv_hooks.lua')
end

if CLIENT then
	include('tttools/sh_util.lua')
	include('tttools/shared.lua')
end