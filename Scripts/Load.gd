extends Node2D
func _ready():
	load_game()
	

func save():
	var save_dict = {
	"class" : Global.Class,
	"level" : Global.level,
	"weapon" : Global.weapon,
	"secondweapon" : Global.secondweapon, 
	"armor" : Global.armor 
		
	}
	return save_dict
	
	
func save_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	
	var json_string = JSON.stringify(save())
	
	save_game.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var _parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		Global.Class = node_data["class"]
		Global.level = node_data["level"]
		Global.weapon = node_data["weapon"]
		Global.secondweapon = node_data["secondweapon"]
		Global.armor = node_data["armor"]
		Global.xp = node_data["xp"]
		Global.xpneeded = node_data["xpneeded"]


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")
