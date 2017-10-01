
/datum/map/innie_base
	allowed_jobs = list(/datum/job/Insurrectionist,/datum/job/UNSC_assault,/datum/job/UNSC_Squad_Lead,/datum/job/UNSC_Team_Lead)

	allowed_spawns = list("Insurrectionist","UNSC Assault Squad Member","UNSC Assault Squad Lead","UNSC Assault Team Lead")


/datum/spawnpoint/insurrectionist
	display_name = "Insurrectionist"
	restrict_job = list(/datum/job/Insurrectionist) //Implement when job created.

/obj/effect/landmark/start/Insurrectionist
	name = "Insurrectionist"

/datum/spawnpoint/UNSC_A_S_M
	display_name = "UNSC Assault Squad Member"
	restrict_job = list(/datum/job/UNSC_assault)

/obj/effect/landmark/start/UNSC_A_S_M
	name = "UNSC Assault Squad Member"

/datum/spawnpoint/UNSC_A_S_L
	display_name = "UNSC Assault Squad Lead"
	restrict_job = list(/datum/job/UNSC_Squad_Lead)

/obj/effect/landmark/start/UNSC_A_S_L
	name = "UNSC Assault Squad Lead"

/datum/spawnpoint/UNSC_A_T_L
	display_name = "UNSC Assault Team Lead"
	restrict_job = list(/datum/job/UNSC_Team_Lead)

/obj/effect/landmark/start/UNSC_A_T_L
	name = "UNSC Assault Team Lead"
