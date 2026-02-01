/datum/advclass/mystic
	name = "Mystic"
	tutorial = "I have spent my youth deepening my faith, only to be lured by the way of the magi, to the great regret of my family"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(RACES_ALL_KINDS)
	outfit = /datum/outfit/job/roguetown/adventurer/mystic
	class_select_category = CLASS_CAT_MYSTIC
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	traits_applied = list(TRAIT_MAGEARMOR, TRAIT_SEEDKNOW, TRAIT_ARCYNE_T1)
	subclass_stats = list(
			STATKEY_PER = 1,
			STATKEY_INT = 1,
			STATKEY_CON = 1,
			STATKEY_WIL = 2,
	)
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
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
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
					)
					subclass_stats = list(
						STATKEY_LUC = 1,
					)
					var/datum/devotion/C = new /datum/devotion(H, H.patron)
					C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_1)
				if("Resilient Soul")
					backr = /obj/item/rogueweapon/woodstaff
					H.adjust_skillrank_up_to(/datum/skill/combat/staves, SKILL_LEVEL_JOURNEYMAN, TRUE)
					H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/stoneskin)
					H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/fortitude)
					backpack_contents = list(
						/obj/item/roguegem/amethyst = 1,
					)
					H.mind?.adjust_spellpoints(-4)
					subclass_stats = list(
						STATKEY_CON = 1,
					)
					var/datum/devotion/C = new /datum/devotion(H, H.patron)
					C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_DEVOTEE, devotion_limit = CLERIC_REQ_1)
				if("Spellblade Trainee")
					backr = /obj/item/rogueweapon/shield/wood
					beltr = /obj/item/rogueweapon/sword/iron
					H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_APPRENTICE, TRUE)
					H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
					H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/enchant_weapon)
					H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/airblade)
					H.mind?.adjust_spellpoints(-5)
					subclass_stats = list(
						STATKEY_STR = 1,
					)
					var/datum/devotion/C = new /datum/devotion(H, H.patron)
					C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_WITCH, devotion_limit = CLERIC_REQ_1)
				if("Sorcerer Trainee")
					backr = /obj/item/rogueweapon/woodstaff
					H.adjust_skillrank_up_to(/datum/skill/combat/staves, SKILL_LEVEL_JOURNEYMAN, TRUE)
					H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/arcynebolt)
					H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/repulse)
					backpack_contents = list(
						/obj/item/roguegem/amethyst = 1,
					)
					H.mind?.adjust_spellpoints(-5) //so they can pick conjure companion
					subclass_stats = list(
						STATKEY_INT = 1,
					)
					var/datum/devotion/C = new /datum/devotion(H, H.patron)
					C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_WITCH, devotion_limit = CLERIC_REQ_1)
