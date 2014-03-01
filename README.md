# TTTools #
A set of tools for TTT addon developers.

## Usage ##
### Hooks ###
#### KillerRoleKillVictimRole ####
This hook will be called whenever a player of `KillerRole` kills `VictimRole`.

Accepts the same arguments as the [PlayerDeath](http://wiki.garrysmod.com/page/GM/PlayerDeath) hook.

##### Example #####
	function RandomDeathMatch(victim, weapon, killer)
		print(killer:GetName() .. ' has RDM\'d ' .. victim:GetName())
	end

	hook.Add('TraitorKillTraitor', 'rdm_trait', RandomDeathMatch)
	hook.Add('InnocentKillInnocent', 'rdm_inno', RandomDeathMatch)
	hook.Add('DetectiveKillDetective', 'rdm_detec', RandomDeathMatch)