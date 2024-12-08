extends Node2D

var random_item = ""

func _ready():
	randomize()  

	var items = [
		"G36",
		"The Troubleshooter",
		"P90",
		"FN FAL",
		"AK-47",
		"ARC-20",
		"M2000",
		"S-TAR",
		"Headhunter DMR",
		"Photon SMG",
		"A-57",
		"Laser SMG",
		"XR-50"
	]
	var random_index = randi() % items.size()
	random_item = items[random_index]

	Global.inventory.append(random_item)
	
func _process(_delta):
	$Label.text = "You Got:\n" + random_item


func _on_button_pressed():
	Global.weapon = Global.inventory[-1]  
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_3_pressed():
	Global.weapon = Global.inventory[-1]  
	get_tree().change_scene_to_file("res://Scenes/primary_weapons.tscn")
