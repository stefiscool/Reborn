extends Node2D

	

func save():
	var save_dict = {
	"class" : Global.Class,
	"level" : Global.level,
	"weapon" : Global.weapon,
	"secondweapon" : Global.secondweapon, 
	"armor" : Global.armor,
	"xp" : Global.xp,
	"xpneeded" : Global.xpneeded
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
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		print(node_data)


func _on_button_2_pressed():
	save_game()
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")

func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")
