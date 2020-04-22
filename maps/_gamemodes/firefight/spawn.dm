
/obj/effect/landmark/firefight_spawn_easy
	name = "spawn marker easy"
	icon = 'spawn.dmi'
	icon_state = "easy"

/obj/effect/landmark/firefight_spawn_medium
	name = "spawn marker medium"
	icon = 'spawn.dmi'
	icon_state = "medium"

/obj/effect/landmark/firefight_spawn_hard
	name = "spawn marker hard"
	icon = 'spawn.dmi'
	icon_state = "hard"

/datum/game_mode/firefight/proc/spawn_attackers_tick()
	set background = 1
	if(allowed_ghost_roles.len == 0 || isnull(allowed_ghost_roles))
		allowed_ghost_roles += list(/datum/ghost_role/flood_combat_form)
	var/amount = min(max_spawns_tick, enemy_strength_left)
	enemy_strength_left -= amount

	//pick a hostile mob to spawn
	//todo: replace this with faction specific mob list
	while(amount >= 1)
		var/number_to_spawn
		var/spawn_type
		if(prob(33))
			number_to_spawn = 1
			spawn_type = pick(typesof(/mob/living/simple_animal/hostile/flood/combat_form) - list(/mob/living/simple_animal/hostile/flood/combat_form,/mob/living/simple_animal/hostile/flood/combat_form/juggernaut))
		else if(prob(50))
			number_to_spawn = 1
			spawn_type = /mob/living/simple_animal/hostile/flood/carrier
		else
			number_to_spawn = rand(4,6)
			spawn_type = /mob/living/simple_animal/hostile/flood/infestor
		spawn_attackers(spawn_type, number_to_spawn)
		amount -= 1

/datum/game_mode/firefight/proc/spawn_attackers(var/spawntype, var/amount)
	if(GLOB.live_flood_simplemobs.len >= GLOB.max_flood_simplemobs)
		return
	if(spawn_landmarks.len)
		for(var/i = 0, i < amount, i++)
			var/obj/spawn_landmark = pick(spawn_landmarks)
			var/atom/spawnloc = spawn_landmark.loc		//could be inside a vehicle etc
			var/mob/living/simple_animal/hostile/H = new spawntype(spawnloc)
			H.our_overmind = overmind
			H.assault_target_type = assault_landmark_type
			overmind.combat_troops += H
	else
		log_admin("GAMEMODE ERROR: gamemode unable to find any spawn landmarks")
