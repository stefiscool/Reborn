extends Node2D

func save():
	var save_dict = {
	"class" : Global.Class,
	"level" : Global.level,
	"weapon" : Global.weapon,
	"secondweapon" : Global.secondweapon, 
	"armor" : Global.armor,
	"xp" : Global.xp,
	"xpneeded" : Global.xpneeded,
	"inventory" : Global.inventory,
	"autosave" : Global.autosave
	}
	return save_dict
	
	
func save_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	
	var json_string = JSON.stringify(save())
	
	save_game.store_line(json_string)



func _ready():
	if Global.autosave == true:
		save_game()
	else:
		pass
