extends Node2D

var random_item = ""

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
	Global.inventory.append(random_item)

	
func _process(_delta):
	$Label.text = "You Got:\n" + random_item


func _on_button_pressed():
	Global.secondweapon = Global.inventory[-1]  
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_3_pressed():
	Global.secondweapon = Global.inventory[-1]  
	get_tree().change_scene_to_file("res://Scenes/secondary_weapons.tscn")
