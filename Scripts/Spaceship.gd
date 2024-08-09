extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		Global.health = Global.maxhealth
		Global.shields = Global.maxshields
		Global.meleeing = false
		Global.defense = Global.defaultdefense
		Global.ammo = Global.maxammo
		Global.secondammo = Global.secondmaxammo
		Global.damaged = false
		Global.mags = 3
		Global.secondmags = 2
		
		get_tree().change_scene_to_file("res://Scenes/victory.tscn")
