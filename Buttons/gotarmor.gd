extends Node2D

var random_item = ""

func _ready():
	randomize()  

	var items = [
		"Mercenary Armor",
		"Infantry Armor",
		"Navy Armor",
		"Cyber Armor",
		"Bandit Light Armor",
		"Bandit Medium Armor",
		"Bandit Heavy Armor",
		"Shock Robe",
		"Void Robe",
		"Marine Armor",
		"Arctic Soldier Armor",
		"Reborn Squire Armor",
		"Reborn Knight Armor"
	]
	var random_index = randi() % items.size()
	random_item = items[random_index]
	Global.inventory.append(random_item)

	
func _process(_delta):
	$Label.text = "You Got:\n" + random_item


func _on_button_pressed():
	Global.armor = Global.inventory[-1]  
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_3_pressed():
	Global.armor = Global.inventory[-1]  
	get_tree().change_scene_to_file("res://Scenes/armor.tscn")
