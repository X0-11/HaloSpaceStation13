
/datum/job/geminus_innie
	title = "Horsch and Ivanov Security Corp. Worker"
	spawn_faction = "Insurrection"
	latejoin_at_spawnpoints = 1
	total_positions = -1
	spawn_positions = -1
	generate_email = 1
	account_allowed = 1
	access = list(access_innie)
	outfit_type = /decl/hierarchy/outfit/job/colonist/geminus_innie
	selection_color = "#ff0000"
	spawnpoint_override = "Geminus Innie"
	alt_titles = list()
	whitelisted_species = list(/datum/species/human)
	loadout_allowed = TRUE
	var/datum/antagonist/geminus_insurrectionist/antag
	intro_blurb = "You are an employee at HISC. As with many of your co-workers, you secretly serve the interests of the Insurrection. Treat your co-workers with respect and when performing illegal actions, make sure to remove all items linking you to HISC."

/datum/job/geminus_innie/get_email_domain()
	return "HISC.corp"

/datum/job/geminus_innie/New()
	. = ..()
	antag = all_antag_types()["Geminus Insurrectionist"]

/datum/job/geminus_innie/equip(var/mob/living/carbon/human/H, var/alt_title, var/datum/mil_branch/branch)
	. = ..()

	antag.add_antagonist_mind(H.mind, 1, "Geminus Insurrectionist")

/datum/job/geminus_innie/officer
	title = "Horsch and Ivanov Security Corp. Manager"
	spawn_faction = "Insurrection"
	open_slot_on_death = 1
	track_players = 1
	latejoin_at_spawnpoints = 1
	total_positions = 2
	spawn_positions = 2
	access = list(access_innie, access_innie_boss)
	selection_color = "#ff0000"
	spawnpoint_override = "Geminus Innie"
	alt_titles = null
	intro_blurb = "You are a HISC Manager. As with many employees of HISC, you secretly serve the Insurrection. Work with your fellow insurrection members to achieve your objectives, but don't break HISC's cover. Ensure you and your staff can be easily disavowed."

/datum/job/geminus_innie/officer/equip(var/mob/living/carbon/human/H, var/alt_title, var/datum/mil_branch/branch)
	. = ..()

	for(var/datum/mind/player in antag.faction_members)
		to_chat(player.current,"<span class='info'>[title] [H] has arrived at the base.</span>")

/datum/job/geminus_innie/commander
	title = "Horsch and Ivanov Security Corp. Board Director"
	department_flag = COM
	spawn_faction = "Insurrection"
	latejoin_at_spawnpoints = 1
	track_players = 1
	total_positions = 1
	spawn_positions = 1
	access = list(access_innie, access_innie_boss)
	selection_color = "#ff0000"
	spawnpoint_override = "Geminus Innie"
	faction_whitelist = "Insurrection"
	alt_titles = null
	intro_blurb = "Welcome to the board of HISC. Your role in this sector is to ensure that all insurrection operations are easily disavowed and that HISC's cover is not blown. Insurrection activities should NOT be traced back to the company at large. You will be used as a scapegoat if the need arises."

/datum/job/geminus_innie/commander/equip(var/mob/living/carbon/human/H, var/alt_title, var/datum/mil_branch/branch)
	. = ..()

	for(var/datum/mind/player in antag.faction_members)
		to_chat(player.current,"<span class='info'>[title] [H] has arrived at the base.</span>")
