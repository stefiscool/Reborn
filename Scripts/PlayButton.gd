extends Button


func _on_pressed():
	Global.Class = "Noble"
	Global.level = 1
	Global.weapon = "SCAR"
	Global.secondweapon = "M1911"
	Global.armor = "Tactical Vest"
	Global.xp = 0
	Global.xpneeded = 20
	Global.inventory = ["SCAR", "M1911", "Tactical Vest"]
	Global.beattutorial = false
	Global.health = Global.maxhealth
	Global.shields = Global.maxshields
	Global.meleeing = false
	Global.defense = Global.defaultdefense
	Global.ammo = Global.maxammo
	Global.secondammo = Global.secondmaxammo
	Global.damaged = false
	Global.mags = 3
	Global.secondmags = 2
	Global.missionobjectives = 0
	Global.mission = 1
	get_node("../Camera2D").position.x = 1771
	get_node("../Camera2D").position.y = 328
	
