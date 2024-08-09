extends Node2D


func _on_level_select_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/Levels/levels.tscn")


func _on_save_game_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/save.tscn")


func _on_weapon_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/primary_weapons.tscn")


