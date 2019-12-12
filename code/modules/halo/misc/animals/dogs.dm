/mob/living/simple_animal/dog
	name = "\improper Dog"
	real_name ="Dog"
	desc = "It's a dog."
	icon = 'code/modules/halo/misc/animals/dogs.dmi'
	icon_state = "german_shep"
	icon_living = "german_shep"
	icon_dead = "german_shep_dead"
	speak = list("Bark!","Arf!","Bork!")
	speak_emote = list("barks", "woofs")
	emote_hear = list("barks", "woofs", "yaps","pants")
	emote_see = list("shakes its head", "shivers")
	speak_chance = 1
	turns_per_move = 10
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	see_in_dark = 5
	pass_flags = PASSTABLE
	mob_size = MOB_MEDIUM

/mob/living/simple_animal/dog/battledog
	name = "\improper Dog"
	desc = "It's a battledog."
	icon_state = "battle_gshep"
	icon_living = "battle_gshep"
	icon_dead = "battle_gshep_d"
	pass_flags = PASSTABLE
	mob_size = MOB_MEDIUM

	speak = list("Bark!","Arf!","Bork!")

/mob/living/simple_animal/dog/pmc
	name = "\improper Dog"
	desc = "It's a battledog. This has a black pelt and sports a fancy, white beret with a blue insignia. Better not anger a potential veteran, this one looks like he could get out of a room with your forearm."
	icon_state = "pmc_gshep"
	icon_living = "pmc_gshep"
	icon_dead = "pmc_gshep_d"
	pass_flags = PASSTABLE
	mob_size = MOB_MEDIUM

	speak = list("Bark!","Arf!","Bork!")

//Thanks to Fingerspitzengef�hl#9389 on discord for the sprites.