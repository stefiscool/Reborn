extends Node2D


func _on_button_pressed():
	Global.Class = "Noble"
	get_tree().change_scene_to_file("res://Scenes/warehouse.tscn")

func _on_button_2_pressed():
	Global.Class = "Bastion"
	get_tree().change_scene_to_file("res://Scenes/warehouse.tscn")

func _on_button_3_pressed():
	Global.Class = "Assasin"
	get_tree().change_scene_to_file("res://Scenes/warehouse.tscn")

func _on_button_4_pressed():
	Global.Class = "Scholar"
	get_tree().change_scene_to_file("res://Scenes/warehouse.tscn")
