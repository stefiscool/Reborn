extends Node2D


func _on_primary_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/primary_weapons.tscn")


func _on_secondary_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/secondary_weapons.tscn")

func _on_armor_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/armor.tscn")
