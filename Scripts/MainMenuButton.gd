extends Button

func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	Global.health = 100
	Global.ammo = Global.maxammo
	Global.mags = 3
