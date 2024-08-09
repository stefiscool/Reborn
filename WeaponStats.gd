extends Node

func _process(_delta):
	if Global.flamecharged == false:
		match Global.weapon:
			"P90":
				Global.rateoffire = 0.06
				Global.damage = 30
				Global.maxammo = 50
				Global.bulletvelocity = 1800
				Global.element = "Kinetic"
				Global.zoom = 1.9
			"AK-47":
				Global.rateoffire = 0.1
				Global.damage = 42
				Global.maxammo = 30
				Global.bulletvelocity = 1590
				Global.element = "Kinetic"
				Global.zoom = 1.8
			"FN FAL":
				Global.rateoffire = 0.09
				Global.damage = 45
				Global.maxammo = 20
				Global.bulletvelocity = 1700
				Global.element = "Kinetic"
				Global.zoom = 1.7
			"SCAR":
				Global.rateoffire = 0.08
				Global.damage = 40
				Global.maxammo = 30
				Global.bulletvelocity = 1600
				Global.element = "Kinetic"
				Global.zoom = 1.8
			"G36":
				Global.rateoffire = 0.075
				Global.damage = 35
				Global.maxammo = 30
				Global.bulletvelocity = 1650
				Global.element = "Kinetic"
				Global.zoom = 1.9
		match Global.secondweapon:
			"M1911":
				Global.secondrateoffire = 0.2
				Global.seconddamage = 50
				Global.secondmaxammo = 9
				Global.secondbulletvelocity = 1750
				Global.secondelement = "Kinetic"
				Global.secondzoom = 2.0
			"Glock 18":
				Global.secondrateoffire = 0.1
				Global.seconddamage = 33
				Global.secondmaxammo = 17
				Global.secondbulletvelocity = 1700
				Global.secondelement = "Kinetic"
				Global.secondzoom = 2.0
			"Deagle":
				Global.secondrateoffire = 0.3
				Global.seconddamage = 70
				Global.secondmaxammo = 7
				Global.secondbulletvelocity = 1600
				Global.secondelement = "Kinetic"
				Global.secondzoom = 2.0
	match Global.armor:
		"Tactical Vest":
			Global.speed = 230
			Global.defaultdefense = 1
			Global.maxhealth = 100
			Global.maxshields = 100
			Global.shieldcooldown = 10
			Global.shieldregen = 1
		"Mercenary Armor":
			Global.speed = 220
			Global.defaultdefense = 1
			Global.maxhealth = 110
			Global.maxshields = 75
			Global.shieldcooldown = 8
			Global.shieldregen = 1
		"Infantry Armor":
			Global.speed = 220
			Global.defaultdefense = 1
			Global.maxhealth = 130
			Global.maxshields = 110
			Global.shieldcooldown = 12
			Global.shieldregen = 1
		"Navy Armor":
			Global.speed = 210
			Global.defaultdefense = 1
			Global.maxhealth = 110
			Global.maxshields = 120
			Global.shieldcooldown = 6
			Global.shieldregen = 2
		"Cyber Armor":
			Global.speed = 200
			Global.defaultdefense = 1
			Global.maxhealth = 80
			Global.maxshields = 150
			Global.shieldcooldown = 5
			Global.shieldregen = 3
