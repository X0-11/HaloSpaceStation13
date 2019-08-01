/obj/item/weapon
	name = "weapon"
	icon = 'icons/obj/weapons.dmi'
	hitsound = "swing_hit"
	var/parry_projectiles = 0

/obj/item/weapon/Bump(mob/M as mob)
	spawn(0)
		..()
	return

/obj/item/weapon/handle_shield(var/mob/user, var/damage, var/atom/dam_source = null, var/mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	var/obj/item/damage_source = dam_source
	if(!attacker && isnull(damage_source))
		return 0
	//Checks done, Parrycode starts here.//
	if(attacker && istype(attacker,/mob/living) && damage < 5 && (attacker.a_intent == "help" || attacker.a_intent == "grab")) //We don't need to block helpful actions. (Or grabs)
		return 0
	var/parry_chance_divisor = 1
	var/force_half_damage = 0
	var/obj/item/weapon/gun/this_weapon = src
	if(istype(this_weapon) && this_weapon.one_hand_penalty == -1 && !this_weapon.is_held_twohanded(user))//Ensure big twohanded guns are worse at parrying when not twohanded.
		parry_chance_divisor = 2
	if(istype(damage_source,/obj/item/projectile))
		if(parry_projectiles)
			parry_chance_divisor = 4
		else
			return 0
	if(!prob((BASE_WEAPON_PARRYCHANCE * (w_class - 1))/parry_chance_divisor)) //Do our base parrychance calculation.
		return 0
	if(!damage_source || damage_source == attacker)
		visible_message("<span class = 'danger'>[user] counters [attacker]'s unarmed attack with their [src.name]!</span>")
		attack(attacker,user,pick("l_arm","r_arm","chest"))
		force_half_damage = 1
	else if (attacker)
		visible_message("<span class = 'danger'>[user] parries [attacker]'s [damage_source.name] with their [src.name]</span>")
		playsound(loc, hitsound, 50, 1, -1)
		playsound(loc, damage_source.hitsound, 50, 1, -1)
	else
		visible_message("<span class = 'danger'>[user] deflects [damage_source] with their [src]!</span>")
		playsound(loc, hitsound, 50, 1, -1)

	var/obj/item/item_to_disintegrate
	var/mob/living/mob_holding_disintegrated

	//Grab a set of references to the weapon and person being disintegrated.
	if(istype(src,/obj/item/weapon/melee/energy/elite_sword) && !istype(damage_source,/obj/item/weapon/melee/energy/elite_sword))
		item_to_disintegrate = damage_source
		mob_holding_disintegrated = attacker
	if(istype(damage_source,/obj/item/weapon/melee/energy/elite_sword) && !istype(src,/obj/item/weapon/melee/energy/elite_sword))
		item_to_disintegrate = src
		mob_holding_disintegrated = user

	if(isnull(item_to_disintegrate) || isnull(mob_holding_disintegrated) && !force_half_damage)
		return 1

	if(!isnull(item_to_disintegrate) && istype(item_to_disintegrate,/obj/item/weapon/gun) && !prob(BASE_PARRY_PLASMA_DESTROY))
		force_half_damage = 1

	if(force_half_damage)
		to_chat(user,"<span class = 'warning'>[src] fails to fully deflect [attacker]'s attack!</span>")
		var/obj/item/projectile/proj = item_to_disintegrate
		var/orig_force = item_to_disintegrate.force
		if(istype(proj))
			orig_force = proj.damage
			proj.damage /= 2
			spawn(2)
				proj.damage = orig_force
		else
			item_to_disintegrate.force /= 2
			spawn(2)
				item_to_disintegrate.force = orig_force
		return 0

	visible_message("<span class = 'danger'>[item_to_disintegrate == damage_source ? "[user]" : "[attacker]"] cuts through [mob_holding_disintegrated]'s [item_to_disintegrate.name] with their [item_to_disintegrate == damage_source ? "[src.name]" : "[damage_source.name]"], rendering it useless!</span>")
	mob_holding_disintegrated.drop_from_inventory(item_to_disintegrate)
	new /obj/effect/decal/cleanable/ash (item_to_disintegrate.loc)
	new /obj/item/metalscrap (item_to_disintegrate.loc)
	qdel(item_to_disintegrate)

	return 1
