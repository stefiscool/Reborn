extends Node2D

var random_item = ""
var dupe = false
var mission_reward = 0

func _ready():
	randomize()  

	var items = [
		"Glock 18",
		"Deagle",
		"Trench Shotgun",
		"Void Supercannon",
		"A-10 Shotgun",
		"White Feather Sniper",
		"Supercharged Crossbow",
		"Shock Cannon",
		"A-70 Shotgun",
		"RPG-30",
		"AT-10 Antitank Rifle",
		"P-10 Pistol",
		"Laser Pistol",
		"P-20 Supressed Pistol",
		"Shock Pistol"
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
	Global.secondweapon = Global.inventory[-1]  
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_3_pressed():
	Global.secondweapon = Global.inventory[-1]  
	get_tree().change_scene_to_file("res://Scenes/secondary_weapons.tscn")
