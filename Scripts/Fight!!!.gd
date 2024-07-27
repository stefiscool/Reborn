extends Button


func _on_pressed():
	if Global.level == 1:
		get_tree().change_scene_to_file("res://Scenes/warehouse.tscn")
	elif Global.level == 2:
		get_tree().change_scene_to_file("res://Scenes/house.tscn")
	elif Global.level == 3:
		get_tree().change_scene_to_file("res://Scenes/port.tscn")
	elif Global.level == 4:
		get_tree().change_scene_to_file("res://Scenes/office.tscn")
	Global.health = 100
	Global.ammo = Global.maxammo
	Global.mags = 3
	Global.secondammo = Global.secondmaxammo
	Global.secondmags = 2
