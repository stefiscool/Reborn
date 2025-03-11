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
		Global.skillpoints = node_data["skillpoints"]
		Global.Ballistics = node_data["Ballistics"]
		Global.Energy = node_data["Energy"]
		Global.Explosives = node_data["Explosives"]
		Global.Melee = node_data["Melee"]
		Global.Engineering = node_data["Engineering"]
		Global.Medicine = node_data["Medicine"]
		Global.Computing = node_data["Computing"]
		Global.Piloting = node_data["Piloting"]
		Global.Barter = node_data["Barter"]
		Global.Luck = node_data["Luck"]
		Global.Speech = node_data["Speech"]
		Global.shipname = node_data["shipname"]


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")
