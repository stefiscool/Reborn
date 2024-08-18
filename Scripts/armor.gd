extends Node2D

func _process(_delta):
	$Label.text = "Equipped: " + Global.armor
	$Label2.text = "\nHealth: " + str(Global.maxhealth) +"\nShields: " + str(Global.maxshields) +"\nShield Cooldown: " + str(Global.shieldcooldown) + " s" +"\nShield Regen: " + str(Global.shieldregen) + "/s"  + "\nSpeed: " + str(Global.speed) + "\nDamage Taken: 1/" + str(Global.defaultdefense) + "\n\n" + Global.armordescription  
	
	if "Tactical Vest" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button.visible = true
	if "Mercenary Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button2.visible = true
	if "Infantry Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button3.visible = true
	if "Navy Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button4.visible = true
	if "Cyber Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button5.visible = true



func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")



func _on_button_pressed():
	Global.armor = "Tactical Vest"

func _on_button_2_pressed():
	Global.armor = "Mercenary Armor"

func _on_button_3_pressed():
	Global.armor = "Infantry Armor"

func _on_button_4_pressed():
	Global.armor = "Navy Armor"

func _on_button_5_pressed():
	Global.armor = "Cyber Armor"
