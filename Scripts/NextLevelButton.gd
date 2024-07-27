extends Button

func _on_pressed():
	if Global.level == 1:
		get_tree().change_scene_to_file("res://Scenes/level2briefing.tscn")
	elif Global.level == 2:
		get_tree().change_scene_to_file("res://Scenes/level3briefing.tscn")
	elif Global.level == 3:
		get_tree().change_scene_to_file("res://Scenes/level4briefing.tscn")
		
	Global.health = 100
	Global.ammo = Global.maxammo
	Global.mags = 3
