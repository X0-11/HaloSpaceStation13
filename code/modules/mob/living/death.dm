/mob/living/death()
	if(hiding)
		hiding = FALSE
	mobs_in_sector["[last_z]"] -= src
	. = ..()
