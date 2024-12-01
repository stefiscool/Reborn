extends Node

func _process(_delta):
	if not Global.flamecharged:
		var weapons = {
			"P90": {"rateoffire": 0.06, "damage": 30, "maxammo": 50, "bulletvelocity": 1800, "element": "Kinetic", "zoom": 1.9, "description": "A compact submachine gun with a high rate of fire and a large magazine. Ideal for close-quarters combat."},
			"AK-47": {"rateoffire": 0.1, "damage": 42, "maxammo": 30, "bulletvelocity": 1590, "element": "Kinetic", "zoom": 1.8, "description": "A powerful and reliable assault rifle known for its high damage and range. Effective in mid to long-range engagements."},
			"FN FAL": {"rateoffire": 0.12, "damage": 45, "maxammo": 20, "bulletvelocity": 1700, "element": "Kinetic", "zoom": 1.7, "description": "A slow firing battle rifle with high damage per shot. Perfect for those who prefer precision over spray-and-pray."},
			"SCAR": {"rateoffire": 0.08, "damage": 40, "maxammo": 30, "bulletvelocity": 1600, "element": "Kinetic", "zoom": 1.8, "description": "A versatile assault rifle with balanced stats, providing reliable performance in various combat scenarios."},
			"G36": {"rateoffire": 0.075, "damage": 35, "maxammo": 30, "bulletvelocity": 1650, "element": "Kinetic", "zoom": 1.9, "description": "A well-rounded assault rifle with a moderate rate of fire and good accuracy. Suitable for most combat situations."},
			"The Troubleshooter": {"rateoffire": 0.06, "damage": 35, "maxammo": 35, "bulletvelocity": 1900, "element": "Kinetic", "zoom": 2, "description": "A gunsmiths first gun, made to deal with trouble. It offers precision and reliability in close-quarters combat."}
		}

		var second_weapons = {
			"M1911": {"rateoffire": 0.2, "damage": 50, "maxammo": 9, "bulletvelocity": 1750, "element": "Kinetic", "zoom": 2.0, "description": "A classic, high-caliber pistol with significant stopping power. Effective as a reliable backup weapon."},
			"Glock 18": {"rateoffire": 0.1, "damage": 33, "maxammo": 17, "bulletvelocity": 1700, "element": "Kinetic", "zoom": 2.0, "description": "A cool pistol with a high rate of fire. Ideal for quick, close-quarters engagements."},
			"Deagle": {"rateoffire": 0.3, "damage": 90, "maxammo": 7, "bulletvelocity": 1600, "element": "Kinetic", "zoom": 2.0, "description": "A high-caliber pistol with exceptional damage. Perfect for taking down enemies with a few well-placed shots."}
		}

		var armors = {
			"Tactical Vest": {"speed": 230, "defaultdefense": 1, "maxhealth": 100, "maxshields": 100, "shieldcooldown": 10, "shieldregen": 1, "armordescription": "Standard-issue body armor providing balanced protection and mobility. Suitable for frontline soldiers."},
			"Mercenary Armor": {"speed": 220, "defaultdefense": 1, "maxhealth": 110, "maxshields": 75, "shieldcooldown": 8, "shieldregen": 1, "armordescription": "A robust armor set designed for mercenaries, offering extra health at the cost of reduced shield capacity."},
			"Infantry Armor": {"speed": 220, "defaultdefense": 1, "maxhealth": 130, "maxshields": 110, "shieldcooldown": 12, "shieldregen": 1, "armordescription": "Heavy armor with enhanced health for extended frontline engagements, balanced by a slower shield regen."},
			"Navy Armor": {"speed": 210, "defaultdefense": 1, "maxhealth": 110, "maxshields": 120, "shieldcooldown": 6, "shieldregen": 2, "armordescription": "A specialized armor set with enhanced shields and quicker shield regeneration. Ideal for defensive operations."},
			"Cyber Armor": {"speed": 200, "defaultdefense": 1, "maxhealth": 80, "maxshields": 150, "shieldcooldown": 5, "shieldregen": 3, "armordescription": "Advanced armor with superior shield capacity and regeneration, offset by reduced health and speed."}
		}

		if Global.weapon in weapons:
			for key in weapons[Global.weapon]:
				Global.set(key, weapons[Global.weapon][key])

		if Global.secondweapon in second_weapons:
			for key in second_weapons[Global.secondweapon]:
				Global.set("second" + key, second_weapons[Global.secondweapon][key])

		if Global.armor in armors:
			for key in armors[Global.armor]:
				Global.set(key, armors[Global.armor][key])
