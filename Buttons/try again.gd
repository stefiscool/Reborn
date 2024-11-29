extends Button

func _ready():
	if Global.beattutorial == true:
		visible = false

func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/warehouse.tscn")
	Global.health = Global.maxhealth
	Global.shields = Global.maxshields
	Global.meleeing = false	
	Global.defense = Global.defaultdefense
	Global.ammo = Global.maxammo
	Global.secondammo = Global.secondmaxammo
	Global.damaged = false
	Global.mags = 3
	Global.secondmags = 2
