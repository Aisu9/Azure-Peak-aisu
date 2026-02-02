/datum/advclass/mystic
	name = "Mystic"
	tutorial = "I have spent my youth deepening my faith, only to be lured by the way of the magi, to the great regret of my family"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/mystic
	class_select_category = CLASS_CAT_MYSTIC
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	traits_applied = list(TRAIT_MAGEARMOR, TRAIT_SEEDKNOW, TRAIT_ARCYNE_T1)
	subclass_stats = list(
			STATKEY_INT = 1,
			STATKEY_CON = 1,
			STATKEY_WIL = 2,
	)
	age_mod = /datum/class_age_mod/mystic
	subclass_spellpoints = 6
	subclass_skills = list(
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/magic/arcane = SKILL_LEVEL_APPRENTICE,
		/datum/skill/magic/holy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
	)

/datum/outfit/job/roguetown/adventurer/mystic/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("I have spent my youth deepening my faith, only to be lured by the way of the magi, to the great regret of my family"))
	head = /obj/item/clothing/head/roguetown/roguehood/mage
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel
	H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()
	if(H.mind)
		var/spec = list("Balanced Studies", "Resilient Soul", "Spellblade Trainee", "Sorcerer Trainee")
		var/spec_choice = input(H, "What drove me away on the fence between Faith and Arcyne", "WHO AM I?") as anything in spec
		switch(spec_choice)
			if("Balanced Studies")
				backr = /obj/item/rogueweapon/woodstaff
				H.adjust_skillrank_up_to(/datum/skill/combat/staves, SKILL_LEVEL_JOURNEYMAN, TRUE)
				backpack_contents = list(
					/obj/item/roguegem/amethyst = 1,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/recipe_book/survival = 1,
				)
				H.change_stat(STATKEY_LCK, 1)
				var/datum/devotion/C = new /datum/devotion(H, H.patron)
				C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_1)
				switch(H.patron?.type)
					if(/datum/patron/old_god)
						neck = /obj/item/clothing/neck/roguetown/psicross
					if(/datum/patron/divine/undivided)
						neck = /obj/item/clothing/neck/roguetown/psicross/undivided
					if(/datum/patron/divine/astrata)
						neck = /obj/item/clothing/neck/roguetown/psicross/astrata
						H.cmode_music = 'sound/music/cmode/church/combat_astrata.ogg'
					if(/datum/patron/divine/noc)
						neck = /obj/item/clothing/neck/roguetown/psicross/noc
					if(/datum/patron/divine/abyssor)
						neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
						H.grant_language(/datum/language/abyssal)
					if(/datum/patron/divine/dendor)
						neck = /obj/item/clothing/neck/roguetown/psicross/dendor
						H.cmode_music = 'sound/music/cmode/garrison/combat_warden.ogg'
					if(/datum/patron/divine/necra)
						neck = /obj/item/clothing/neck/roguetown/psicross/necra
						H.cmode_music = 'sound/music/cmode/church/combat_necra.ogg'
					if(/datum/patron/divine/pestra)
						neck = /obj/item/clothing/neck/roguetown/psicross/pestra
					if(/datum/patron/divine/ravox)
						neck = /obj/item/clothing/neck/roguetown/psicross/ravox
					if(/datum/patron/divine/malum)
						neck = /obj/item/clothing/neck/roguetown/psicross/malum
					if(/datum/patron/divine/eora)
						neck = /obj/item/clothing/neck/roguetown/psicross/eora
						H.cmode_music = 'sound/music/cmode/church/combat_eora.ogg'
					if(/datum/patron/inhumen/zizo)
						H.cmode_music = 'sound/music/combat_heretic.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/matthios)
						H.cmode_music = 'sound/music/combat_matthios.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/graggar)
						H.cmode_music = 'sound/music/combat_graggar.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/baotha)
						H.cmode_music = 'sound/music/combat_baotha.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/divine/xylix)
						neck = /obj/item/clothing/neck/roguetown/luckcharm
						H.cmode_music = 'sound/music/combat_jester.ogg'
			if("Resilient Soul")
				backr = /obj/item/rogueweapon/woodstaff
				H.adjust_skillrank_up_to(/datum/skill/combat/staves, SKILL_LEVEL_APPRENTICE, TRUE)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/stoneskin)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/fortitude)
				backpack_contents = list(
					/obj/item/roguegem/amethyst = 1,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/recipe_book/survival = 1,
				)
				H.mind?.adjust_spellpoints(-4)
				H.change_stat(STATKEY_CON, 1)
				var/datum/devotion/C = new /datum/devotion(H, H.patron)
				C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_DEVOTEE, devotion_limit = CLERIC_REQ_1)
				switch(H.patron?.type)
					if(/datum/patron/old_god)
						neck = /obj/item/clothing/neck/roguetown/psicross
					if(/datum/patron/divine/undivided)
						neck = /obj/item/clothing/neck/roguetown/psicross/undivided
					if(/datum/patron/divine/astrata)
						neck = /obj/item/clothing/neck/roguetown/psicross/astrata
						H.cmode_music = 'sound/music/cmode/church/combat_astrata.ogg'
					if(/datum/patron/divine/noc)
						neck = /obj/item/clothing/neck/roguetown/psicross/noc
					if(/datum/patron/divine/abyssor)
						neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
						H.grant_language(/datum/language/abyssal)
					if(/datum/patron/divine/dendor)
						neck = /obj/item/clothing/neck/roguetown/psicross/dendor
						H.cmode_music = 'sound/music/cmode/garrison/combat_warden.ogg'
					if(/datum/patron/divine/necra)
						neck = /obj/item/clothing/neck/roguetown/psicross/necra
						H.cmode_music = 'sound/music/cmode/church/combat_necra.ogg'
					if(/datum/patron/divine/pestra)
						neck = /obj/item/clothing/neck/roguetown/psicross/pestra
					if(/datum/patron/divine/ravox)
						neck = /obj/item/clothing/neck/roguetown/psicross/ravox
					if(/datum/patron/divine/malum)
						neck = /obj/item/clothing/neck/roguetown/psicross/malum
					if(/datum/patron/divine/eora)
						neck = /obj/item/clothing/neck/roguetown/psicross/eora
						H.cmode_music = 'sound/music/cmode/church/combat_eora.ogg'
					if(/datum/patron/inhumen/zizo)
						H.cmode_music = 'sound/music/combat_heretic.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/matthios)
						H.cmode_music = 'sound/music/combat_matthios.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/graggar)
						H.cmode_music = 'sound/music/combat_graggar.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/baotha)
						H.cmode_music = 'sound/music/combat_baotha.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/divine/xylix)
						neck = /obj/item/clothing/neck/roguetown/luckcharm
						H.cmode_music = 'sound/music/combat_jester.ogg'
			if("Spellblade Trainee")
				backr = /obj/item/rogueweapon/shield/wood
				beltr = /obj/item/rogueweapon/sword/iron
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_NOVICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_APPRENTICE, TRUE)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/enchant_weapon)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/airblade)
				backpack_contents = list(
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/recipe_book/survival = 1,
				)
				H.mind?.adjust_spellpoints(-5)
				H.change_stat(STATKEY_STR, 1)
				var/datum/devotion/C = new /datum/devotion(H, H.patron)
				C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_WITCH, devotion_limit = CLERIC_REQ_1)
				switch(H.patron?.type)
					if(/datum/patron/old_god)
						neck = /obj/item/clothing/neck/roguetown/psicross
					if(/datum/patron/divine/undivided)
						neck = /obj/item/clothing/neck/roguetown/psicross/undivided
					if(/datum/patron/divine/astrata)
						neck = /obj/item/clothing/neck/roguetown/psicross/astrata
						H.cmode_music = 'sound/music/cmode/church/combat_astrata.ogg'
					if(/datum/patron/divine/noc)
						neck = /obj/item/clothing/neck/roguetown/psicross/noc
					if(/datum/patron/divine/abyssor)
						neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
						H.grant_language(/datum/language/abyssal)
					if(/datum/patron/divine/dendor)
						neck = /obj/item/clothing/neck/roguetown/psicross/dendor
						H.cmode_music = 'sound/music/cmode/garrison/combat_warden.ogg'
					if(/datum/patron/divine/necra)
						neck = /obj/item/clothing/neck/roguetown/psicross/necra
						H.cmode_music = 'sound/music/cmode/church/combat_necra.ogg'
					if(/datum/patron/divine/pestra)
						neck = /obj/item/clothing/neck/roguetown/psicross/pestra
					if(/datum/patron/divine/ravox)
						neck = /obj/item/clothing/neck/roguetown/psicross/ravox
					if(/datum/patron/divine/malum)
						neck = /obj/item/clothing/neck/roguetown/psicross/malum
					if(/datum/patron/divine/eora)
						neck = /obj/item/clothing/neck/roguetown/psicross/eora
						H.cmode_music = 'sound/music/cmode/church/combat_eora.ogg'
					if(/datum/patron/inhumen/zizo)
						H.cmode_music = 'sound/music/combat_heretic.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/matthios)
						H.cmode_music = 'sound/music/combat_matthios.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/graggar)
						H.cmode_music = 'sound/music/combat_graggar.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/baotha)
						H.cmode_music = 'sound/music/combat_baotha.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/divine/xylix)
						neck = /obj/item/clothing/neck/roguetown/luckcharm
						H.cmode_music = 'sound/music/combat_jester.ogg'
			if("Sorcerer Trainee")
				backr = /obj/item/rogueweapon/woodstaff
				H.adjust_skillrank_up_to(/datum/skill/combat/staves, SKILL_LEVEL_APPRENTICE, TRUE)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/arcynebolt)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/repulse)
				backpack_contents = list(
					/obj/item/roguegem/amethyst = 1,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/recipe_book/survival = 1,
				)
				H.mind?.adjust_spellpoints(-5) //so they can pick conjure companion
				H.change_stat(STATKEY_INT, 1)
				var/datum/devotion/C = new /datum/devotion(H, H.patron)
				C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_WITCH, devotion_limit = CLERIC_REQ_1)
				switch(H.patron?.type)
					if(/datum/patron/old_god)
						neck = /obj/item/clothing/neck/roguetown/psicross
					if(/datum/patron/divine/undivided)
						neck = /obj/item/clothing/neck/roguetown/psicross/undivided
					if(/datum/patron/divine/astrata)
						neck = /obj/item/clothing/neck/roguetown/psicross/astrata
						H.cmode_music = 'sound/music/cmode/church/combat_astrata.ogg'
					if(/datum/patron/divine/noc)
						neck = /obj/item/clothing/neck/roguetown/psicross/noc
					if(/datum/patron/divine/abyssor)
						neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
						H.grant_language(/datum/language/abyssal)
					if(/datum/patron/divine/dendor)
						neck = /obj/item/clothing/neck/roguetown/psicross/dendor
						H.cmode_music = 'sound/music/cmode/garrison/combat_warden.ogg'
					if(/datum/patron/divine/necra)
						neck = /obj/item/clothing/neck/roguetown/psicross/necra
						H.cmode_music = 'sound/music/cmode/church/combat_necra.ogg'
					if(/datum/patron/divine/pestra)
						neck = /obj/item/clothing/neck/roguetown/psicross/pestra
					if(/datum/patron/divine/ravox)
						neck = /obj/item/clothing/neck/roguetown/psicross/ravox
					if(/datum/patron/divine/malum)
						neck = /obj/item/clothing/neck/roguetown/psicross/malum
					if(/datum/patron/divine/eora)
						neck = /obj/item/clothing/neck/roguetown/psicross/eora
						H.cmode_music = 'sound/music/cmode/church/combat_eora.ogg'
					if(/datum/patron/inhumen/zizo)
						H.cmode_music = 'sound/music/combat_heretic.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/matthios)
						H.cmode_music = 'sound/music/combat_matthios.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/graggar)
						H.cmode_music = 'sound/music/combat_graggar.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/inhumen/baotha)
						H.cmode_music = 'sound/music/combat_baotha.ogg'
						ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
					if(/datum/patron/divine/xylix)
						neck = /obj/item/clothing/neck/roguetown/luckcharm
						H.cmode_music = 'sound/music/combat_jester.ogg'
