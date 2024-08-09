extends Node2D
func _ready():
	load_game()
	


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
		Global.inventory = node_data["inventory"]
		Global.autosave = node_data["autosave"]


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")
