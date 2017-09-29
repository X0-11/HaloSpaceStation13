
/datum/map/innie_base
	name = "Innie Base"
	full_name = "Insurrection Base"
	path = "innie_base"
	station_levels = list(1,2)
	admin_levels = list(3)
	accessible_z_levels = list("1" = 1,"2" = 2)
	//lobby_icon = 'maps/example/example_lobby.dmi'
	lobby_icon = 'code/modules/halo/splashworks/title6.png'
	id_hud_icons = 'code/modules/halo/gamemodes/slayer-team-slayer/slayer_hud_icons.dmi'

	allowed_jobs = list(/datum/job/Insurrectionist,/datum/job/UNSC_assault,/datum/job/UNSC_Squad_Lead,/datum/job/UNSC_Team_Lead)

	allowed_spawns = list("Insurrectionist","UNSC Assault Squad Member","UNSC Assault Squad Lead","UNSC Assault Team Lead")
