
/datum/job/Insurrectionist
	title = "Insurrectionist"
	total_positions = 46
	selection_color = "#ffff00"

	supervisors = list("Insurrectionist Leader")

	create_record = 0
	account_allowed = 0
	generate_email = 0

	loadout_allowed = TRUE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/Insurrectionist

	latejoin_at_spawnpoints = TRUE

/datum/job/UNSC_assault
	title = "UNSC Assault Squad Member"
	total_positions = 40
	selection_color = "#ffff00"

	supervisors = list("UNSC Assault Team Lead","UNSC Assault Squad Lead")

	create_record = 0
	account_allowed = 0
	generate_email = 0

	loadout_allowed = FALSE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/UNSC_Assault

	latejoin_at_spawnpoints = TRUE

/datum/job/UNSC_Squad_Lead
	title = "UNSC Assault Squad Lead"
	head_position = 1
	total_positions = 5
	selection_color = "#ffff00"

	supervisors = list("UNSC Assault Team Lead")

	create_record = 0
	account_allowed = 0
	generate_email = 0

	loadout_allowed = FALSE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/UNSC_Assault

	latejoin_at_spawnpoints = TRUE

/datum/job/UNSC_Team_Lead
	title = "UNSC Assault Team Lead"
	head_position = 1
	total_positions = 1
	selection_color = "#ffff00"

	create_record = 0
	account_allowed = 0
	generate_email = 0

	loadout_allowed = FALSE
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/UNSC_Assault

	latejoin_at_spawnpoints = TRUE
