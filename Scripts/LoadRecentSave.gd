extends Button

func _ready():
	Global.mission = 0
	if Global.beattutorial == false:
		visible = false
	

func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/load.tscn")
