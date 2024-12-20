extends Node

func _process(_delta):
	if not Global.flamecharged:
		var weapons = {
			"P90": {"rateoffire": 0.06, "damage": 30, "maxammo": 50, "bulletvelocity": 1800, "element": "Kinetic", "zoom": 1.9, "description": "A compact submachine gun from WW3 with a high rate of fire and a large magazine. Ideal for close-quarters combat."},
			"AK-47": {"rateoffire": 0.1, "damage": 42, "maxammo": 30, "bulletvelocity": 1590, "element": "Kinetic", "zoom": 1.8, "description": "A powerful and reliable assault rifle used by bandits and rebels. Effective in mid to long-range engagements."},
			"FN FAL": {"rateoffire": 0.12, "damage": 45, "maxammo": 20, "bulletvelocity": 1700, "element": "Kinetic", "zoom": 1.7, "description": "A slow firing battle rifle from WW3 with high damage per shot. Perfect for those who prefer precision over spray-and-pray."},
			"SCAR": {"rateoffire": 0.08, "damage": 40, "maxammo": 30, "bulletvelocity": 1600, "element": "Kinetic", "zoom": 1.8, "description": "A old but trusty assualt rifle from the third world war. It provides reliable performance in various combat scenarios."},
			"G36": {"rateoffire": 0.075, "damage": 35, "maxammo": 30, "bulletvelocity": 1650, "element": "Kinetic", "zoom": 1.9, "description": "A well-rounded assault rifle with a moderate rate of fire and good accuracy. Suitable for most combat situations."},
			"The Troubleshooter": {"rateoffire": 0.06, "damage": 35, "maxammo": 35, "bulletvelocity": 1900, "element": "Kinetic", "zoom": 2, "description": "A gunsmith's first gun, made to deal with trouble. It offers precision and reliability in close-quarters combat."},
			"ARC-20": {"rateoffire": 0.07, "damage": 38, "maxammo": 30, "bulletvelocity": 1750, "element": "Kinetic", "zoom": 1.7, "description": "A lightweight, adaptable rifle with a smooth firing rate. It was made after WW3."},
			"M2000": {"rateoffire": 0.05, "damage": 28, "maxammo": 100, "bulletvelocity": 1650, "element": "Kinetic(MG)", "zoom": 1.8, "description": "A republic light machine gun with a high rate of fire and large magazine, ideal for suppressive fire."},
			"S-TAR": {"rateoffire": 0.06, "damage": 25, "maxammo": 32, "bulletvelocity": 1400, "element": "Kinetic", "zoom": 2, "description": "A republic submachine gun with a fast firing rate and compact design, excellent for urban combat."},
			"Headhunter DMR": {"rateoffire": 0.09, "damage": 50, "maxammo": 15, "bulletvelocity": 1900, "element": "Kinetic(Sn)", "zoom": 1.2, "description": "A designated marksman rifle with high damage and precision, designed for headshot enthusiasts."},
			"Photon SMG": {"rateoffire": 0.15, "damage": 40, "maxammo": 40, "bulletvelocity": 2000, "element": "Photon", "zoom": 2, "description": "An advanced energy-based SMG with superior velocity and damage, designed for CQB skirmishes."},
			"A-57": {"rateoffire": 0.06, "damage": 34, "maxammo": 30, "bulletvelocity": 1850, "element": "Kinetic(Su)", "zoom": 1.7, "description": "A supressed assault rifle with balanced damage and firing rate, ideal for mid-range combat."},
			"Laser SMG": {"rateoffire": 0.06, "damage": 22, "maxammo": 50, "bulletvelocity": 2100, "element": "Laser", "zoom": 1.9, "description": "A futuristic weapon firing concentrated laser beams with incredible speed and accuracy."},
			"XR-50": {"rateoffire": 0.05, "damage": 40, "maxammo": 25, "bulletvelocity": 1950, "element": "Kinetic(Su)", "zoom": 1.5, "description": "A cutting-edge republic rifle with high damage and precision, built for the modern battlefield."}
}

		var second_weapons = {
			"M1911": {"rateoffire": 0.2, "damage": 50, "maxammo": 9, "bulletvelocity": 1750, "element": "Kinetic", "zoom": 2.0, "description": "This gun has seen 3 world wars. A classic, high-caliber pistol with significant stopping power."},
			"Glock 18": {"rateoffire": 0.1, "damage": 33, "maxammo": 17, "bulletvelocity": 1700, "element": "Kinetic", "zoom": 2.0, "description": "A cool pistol used by WW3 soldiers. Ideal for quick, close-quarters engagements."},
			"Deagle": {"rateoffire": 0.3, "damage": 90, "maxammo": 7, "bulletvelocity": 1600, "element": "Kinetic(Sn)", "zoom": 2.0, "description": "A high-caliber pistol. Perfect for taking down enemies with a few well-placed shots."},
			"Trench Shotgun": {"rateoffire": 0.8, "damage": 45, "maxammo": 6, "bulletvelocity": 1200, "element": "Kinetic(Sh)", "zoom": 1.9, "description": "A close-range shotgun used in the trenches. Perfect for clearing out enemies in tight spaces."},
			"Void Supercannon": {"rateoffire": 1.2, "damage": 120, "maxammo": 6, "bulletvelocity": 2000, "element": "Void", "zoom": 1.5, "description": "A heavy, high-powered weapon with a massive damage output. Suitable for long-range destruction."},
			"A-10 Shotgun": {"rateoffire": 0.7, "damage": 40, "maxammo": 8, "bulletvelocity": 1200, "element": "Kinetic(Sh)", "zoom": 1.9, "description": "A powerful shotgun used by the republic, designed for clearing out groups of enemies."},
			"White Feather Sniper": {"rateoffire": 1, "damage": 100, "maxammo": 8, "bulletvelocity": 2500, "element": "Kinetic(Sn)", "zoom": 0.9, "description": "A high-precision sniper rifle, perfect for taking out enemies at long range with devastating shots."},
			"Supercharged Crossbow": {"rateoffire": 0.8, "damage": 70, "maxammo": 1, "bulletvelocity": 1800, "element": "Shock", "zoom": 1.5, "description": "A bandit crossbow with electrically charged bolts that can paralyze enemies. Ideal for medium-range engagements."},
			"Shock Cannon": {"rateoffire": 1, "damage": 80, "maxammo": 6, "bulletvelocity": 1000, "element": "Shock", "zoom": 2.0, "description": "A cannon that fires high-voltage projectiles, causing electric shock damage."},
			"A-70 Shotgun": {"rateoffire": 0.1, "damage": 35, "maxammo": 12, "bulletvelocity": 1350, "element": "Kinetic(Sh)", "zoom": 1.8, "description": "A semi-automatic shotgun designed for close-range combat, dealing massive damage in a short burst."},
			"RPG-30": {"rateoffire": 1.2, "damage": 500, "maxammo": 1, "bulletvelocity": 1250, "element": "Explosive", "zoom": 1.2, "description": "A powerful anti-tank rocket-propelled grenade launcher with high damage, designed to penetrate heavily armored vehicles."},
			"AT-10 Antitank Rifle": {"rateoffire": 1, "damage": 250, "maxammo": 4, "bulletvelocity": 2800, "element": "Kinetic(AT)", "zoom": 1.1, "description": "A powerful antitank rifle capable of piercing heavy armor. Effective against vehicles and heavily armored enemies."},
			"P-10 Pistol": {"rateoffire": 0.05, "damage": 45, "maxammo": 12, "bulletvelocity": 1600, "element": "Kinetic", "zoom": 2.0, "description": "A reliable and compact pistol with moderate damage and accuracy, ideal for backup."},
			"Laser Pistol": {"rateoffire": 0.15, "damage": 55, "maxammo": 10, "bulletvelocity": 2200, "element": "Laser", "zoom": 1.8, "description": "A futuristic pistol that fires high-energy laser bolts. Excellent for high-accuracy, medium-range engagements."},
			"P-20 Supressed Pistol": {"rateoffire": 0.25, "damage": 50, "maxammo": 15, "bulletvelocity": 1700, "element": "Kinetic(Su)", "zoom": 2.0, "description": "A silenced pistol for stealthy operations. Ideal for eliminating enemies quietly in close combat."},
			"Shock Pistol": {"rateoffire": 0.3, "damage": 30, "maxammo": 8, "bulletvelocity": 1800, "element": "Shock", "zoom": 2.0, "description": "A high-voltage pistol capable of stunning enemies. Does small electric damage."}
}

		var armors = {
			"Tactical Vest": {"speed": 230, "defaultdefense": 1, "maxhealth": 100, "maxshields": 100, "shieldcooldown": 10, "shieldregen": 1, "armordescription": "Standard-issue body armor providing balanced protection and mobility. Suitable for frontline soldiers."},
			"Mercenary Armor": {"speed": 220, "defaultdefense": 1, "maxhealth": 110, "maxshields": 75, "shieldcooldown": 8, "shieldregen": 1, "armordescription": "A robust armor set designed for mercenaries, offering extra health at the cost of reduced shield capacity."},
			"Infantry Armor": {"speed": 220, "defaultdefense": 1, "maxhealth": 130, "maxshields": 110, "shieldcooldown": 12, "shieldregen": 1, "armordescription": "Heavy republic armor with enhanced health for extended frontline engagements, balanced by a slower shield regen."},
			"Navy Armor": {"speed": 210, "defaultdefense": 1, "maxhealth": 110, "maxshields": 120, "shieldcooldown": 6, "shieldregen": 2, "armordescription": "A specialized republic armor set with enhanced shields and quicker shield regeneration. Ideal for defensive operations."},
			"Cyber Armor": {"speed": 200, "defaultdefense": 1, "maxhealth": 80, "maxshields": 150, "shieldcooldown": 5, "shieldregen": 3, "armordescription": "Advanced armor with superior shield capacity and regeneration, offset by reduced health and speed."},
			"Bandit Light Armor": {"speed": 240, "defaultdefense": 1, "maxhealth": 90, "maxshields": 50, "shieldcooldown": 9, "shieldregen": 1, "armordescription": "Lightweight armor favored by bandits for quick getaways. Offers minimal protection."},
			"Bandit Medium Armor": {"speed": 225, "defaultdefense": 1, "maxhealth": 100, "maxshields": 75, "shieldcooldown": 10, "shieldregen": 1, "armordescription": "A balanced armor used by bandits, providing decent mobility and moderate protection."},
			"Bandit Heavy Armor": {"speed": 210, "defaultdefense": 1.2, "maxhealth": 120, "maxshields": 90, "shieldcooldown": 12, "shieldregen": 0, "armordescription": "Bulky armor used by juggernaut bandits. It offers significant protection at the cost of reduced speed and no regen."},
			"Shock Robe": {"speed": 230, "defaultdefense": 1, "maxhealth": 70, "maxshields": 120, "shieldcooldown": 7, "shieldregen": 4, "armordescription": "An electrified robe that enhances shield capabilities, ideal for hit-and-run tactics."},
			"Void Robe": {"speed": 220, "defaultdefense": 1, "maxhealth": 60, "maxshields": 150, "shieldcooldown": 6, "shieldregen": 5, "armordescription": "A mysterious robe infused with void energy, maximizing shields but sacrificing health."},
			"Marine Armor": {"speed": 215, "defaultdefense": 1, "maxhealth": 120, "maxshields": 100, "shieldcooldown": 8, "shieldregen": 1, "armordescription": "A durable armor for republic marines, providing balanced health and shield capabilities."},
			"Arctic Soldier Armor": {"speed": 220, "defaultdefense": 1, "maxhealth": 110, "maxshields": 110, "shieldcooldown": 10, "shieldregen": 1, "armordescription": "Designed for icy environments, offering balanced protection with resistance to cold climates."},
			"Reborn Squire Armor": {"speed": 230, "defaultdefense": 1, "maxhealth": 100, "maxshields": 80, "shieldcooldown": 10, "shieldregen": 1, "armordescription": "A lightweight armor for aspiring Reborn Knights, offering decent mobility and basic protection."},
			"Reborn Knight Armor": {"speed": 210, "defaultdefense": 1.2, "maxhealth": 140, "maxshields": 120, "shieldcooldown": 12, "shieldregen": 0, "armordescription": "Heavy armor for chosen Reborn Knights, prioritizing defense and durability over mobility and regen."}
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
