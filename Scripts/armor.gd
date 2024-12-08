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
	if "Bandit Light Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button6.visible = true
	if "Bandit Medium Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button7.visible = true
	if "Bandit Heavy Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button8.visible = true
	if "Shock Robe" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button9.visible = true
	if "Void Robe" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button10.visible = true
	if "Marine Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button11.visible = true
	if "Arctic Soldier Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button12.visible = true
	if "Reborn Squire Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button13.visible = true
	if "Reborn Knight Armor" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button14.visible = true


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

func _on_button_6_pressed():
	Global.armor = "Bandit Light Armor"

func _on_button_7_pressed():
	Global.armor = "Bandit Medium Armor"

func _on_button_8_pressed():
	Global.armor = "Bandit Heavy Armor"

func _on_button_9_pressed():
	Global.armor = "Shock Robe"

func _on_button_10_pressed():
	Global.armor = "Void Robe"

func _on_button_11_pressed():
	Global.armor = "Marine Armor"

func _on_button_12_pressed():
	Global.armor = "Arctic Soldier Armor"

func _on_button_13_pressed():
	Global.armor = "Reborn Squire Armor"

func _on_button_14_pressed():
	Global.armor = "Reborn Knight Armor"
