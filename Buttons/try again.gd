extends Button

func _ready():
	if Global.beattutorial == true:
		visible = false

func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/warehouse.tscn")
	Global.health = Global.maxhealth
	Global.defense = Global.defaultdefense
	Global.ammo = Global.maxammo
	Global.damaged = false
