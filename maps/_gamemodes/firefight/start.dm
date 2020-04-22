
/datum/game_mode/firefight/pre_setup()
	..()

	GLOB.hostile_attackables += /obj/structure/evac_ship
	GLOB.hostile_attackables += /obj/structure/tanktrap
	GLOB.max_flood_simplemobs = 100

	overmind = new()

	enemy_faction = GLOB.factions_by_name[enemy_faction_name]
	player_faction = GLOB.factions_by_name[player_faction_name]
	overmind.comms_channel = enemy_faction.default_radio_channel

	//loop over the map creating resupply spawn points
	spawn(-1)
		var/resup_dist = 20
		for(var/curx = 1, curx < world.maxx, curx += resup_dist + pick(-7,0,7))
			for(var/cury = 1, cury < world.maxy, cury += resup_dist)
				var/turf/T = locate(curx, cury, 1)
				//if there is a scavenge_spawn_skip landmark, skip this spot (place one eg near the player base)
				var/obj/effect/landmark/scavenge_spawn_skip/N = locate() in range(resup_dist, T)
				if(N)
					continue
				var/obj/effect/landmark/scavenge_spawn/S = new(T)
				available_resupply_points.Add(S)

	spawn(-1)

		for(var/obj/effect/landmark/firefight_spawn_easy/F in world)
			spawn_landmarks.Add(F)

		for(var/obj/effect/landmark/firefight_spawn_medium/F in world)
			spawn_landmarks.Add(F)

		for(var/obj/effect/landmark/firefight_spawn_hard/F in world)
			spawn_landmarks.Add(F)

	//planet_area = locate() in world

/datum/game_mode/firefight/announce()
	..()
	to_world("<span class='notice'>You must survive for [max_waves] waves until the evacuation ship arrives. \
		Chop down trees, dig up rocks and sand, gather cloth from plants or scavenge resources from around the map.</span>")

/datum/game_mode/firefight/post_setup()
	..()
	time_next_resupply = world.time + interval_resupply
	time_rest_end = world.time// + rest_time		//for testing have the waves start immediately
	safe_time = world.time + rest_time
	//time_new_cycle = world.time + solar_cycle_duration - solar_cycle_duration * threshold_dawn

	/*daynight_controller = locate() in world
	if(!daynight_controller)
		daynight_controller = new (1,1,1)*/

	//for all protagonist faction members set an AI path target on their mob
	for(var/datum/mind/M in player_faction.assigned_minds)
		new assault_landmark_type(M.current)

/datum/game_mode/firefight/handle_latejoin(var/mob/living/carbon/human/character)
	. = ..()

	//set an AI path target on their mob
	if(character.faction == player_faction_name)
		new assault_landmark_type(character)
