GLOBAL_LIST_EMPTY(x52_base_spawns)

/datum/spawnpoint/x52
	display_name = "HISC Researcher"
	restrict_job = list("HISC Researcher")

/datum/spawnpoint/x52/New()
	..()
	turfs = GLOB.x52_base_spawns

/obj/effect/landmark/start/x52
	name = "HISC Researcher"

/obj/effect/landmark/start/x52/New()
	..()
	GLOB.x52_base_spawns += loc

///////////////////////////////////////////////////////

GLOBAL_LIST_EMPTY(x52_rd_base_spawns)

/datum/spawnpoint/x52_rd
	display_name = "HISC RD"
	restrict_job = list("HISC Research Director")

/datum/spawnpoint/x52_rd/New()
	..()
	turfs = GLOB.x52_rd_base_spawns

/obj/effect/landmark/start/x52_rd
	name = "HISC Research Director"

/obj/effect/landmark/start/x52_rd/New()
	..()
	GLOB.x52_rd_base_spawns += loc
