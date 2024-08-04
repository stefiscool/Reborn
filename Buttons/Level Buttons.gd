extends Node2D

func _ready():
	Global.health = Global.maxhealth
	Global.shields = Global.maxshields
	Global.meleeing = false
	Global.defense = Global.defaultdefense
	Global.ammo = Global.maxammo
	Global.secondammo = Global.secondmaxammo
	Global.damaged = false
	Global.mags = 3
	Global.secondmags = 2

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/warehouse.tscn")


func _on_button_2_pressed():
	pass # Replace with function body.


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")
