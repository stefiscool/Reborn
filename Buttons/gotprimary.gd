extends Node2D

var random_item = ""
var dupe = false
var mission_reward = 0
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

	if !Global.inventory.has(random_item):
		Global.inventory.append(random_item)
	else:
		dupe = true
		$Button.queue_free()
		$Button3.queue_free()
		$Button2.text = "Go to Hub"
		mission_reward = (100 * Global.level) + randi() % 100 + 1
		Global.credits += mission_reward
	
func _process(_delta):
	if dupe == false:
		$Label.text = "You Got:\n" + random_item
	else:
		$Label.text = "You Got:\n" + str(mission_reward) + " Republic Credits"


func _on_button_pressed():
	Global.weapon = Global.inventory[-1]  
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_3_pressed():
	Global.weapon = Global.inventory[-1]  
	get_tree().change_scene_to_file("res://Scenes/primary_weapons.tscn")
