/mob/living/death()
	if(hiding)
		hiding = FALSE
	GLOB.mobs_in_sectors["[last_z]"] -= src
	. = ..()
