extends Button


func _on_pressed():
	Global.level = 4
	get_tree().change_scene_to_file("res://loading.tscn")
		
