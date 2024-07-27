extends Button

func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/gameoverboom.tscn")
	Global.health = 100
	Global.ammo = 30
	Global.mags = 3
