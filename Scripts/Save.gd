extends Node2D

func _process(delta):
	$Label.text = "Autosave: " + str(Global.autosave)

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
	"autosave" : Global.autosave, 
	"beattutorial" : Global.beattutorial
	}
	return save_dict
	
	
func save_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	
	var json_string = JSON.stringify(save())
	
	save_game.store_line(json_string)




func _on_button_2_pressed():
	save_game()
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")

func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")


func _on_button_4_pressed():
	Global.autosave = true


func _on_button_5_pressed():
	Global.autosave = false
