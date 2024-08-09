extends Button

func _ready():
	randomize()
	Global.flamecharged = false
	
func _on_pressed():
	var scenes = [
		"res://Scenes/gotprimary.tscn",
		"res://Scenes/gotsecondary.tscn",
		"res://Scenes/gotarmor.tscn"
	]
	var random_index = randi() % scenes.size()
	get_tree().change_scene_to_file(scenes[random_index])
