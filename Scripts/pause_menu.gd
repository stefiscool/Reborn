extends CanvasLayer
@onready var main = $"../"

func _on_resume_game_pressed():
	main.pauseMenu()



func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_quit_pressed():
	get_tree().quit()
