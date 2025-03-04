extends Node2D
func _ready():
	Global.secondary = false
	Global.flamecharged = false
func _process(_delta):
	$Label.text = "Equipped: " + Global.weapon
	$Label2.text = "Firerate: " + str(int((1 / Global.rateoffire) * 60)) + " RPM" + "\nZoom: " + str(3.0 - Global.zoom) +"x" + "\nDamage: " + str(Global.damage) +"\nCapacity: " + str(Global.maxammo) +"\nBullet Velocity: " + str(Global.bulletvelocity) + " f/s"  + str(Global.element) +"\n\n" + Global.description 
	
	if "P90" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button.visible = true
	if "AK-47" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button2.visible = true
	if "FN FAL" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button3.visible = true
	if "SCAR" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button4.visible = true
	if "G36" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button5.visible = true
	if "The Troubleshooter" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button6.visible = true
	if "ARC-20" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button7.visible = true
	if "M2000" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button8.visible = true
	if "S-TAR" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button9.visible = true
	if "Headhunter DMR" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button10.visible = true
	if "Photon SMG" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button11.visible = true
	if "A-57" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button12.visible = true
	if "Laser SMG" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button13.visible = true
	if "XR-50" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button14.visible = true




func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")
	



func _on_button_pressed():
	Global.weapon = "P90"

func _on_button_2_pressed():
	Global.weapon = "AK-47"

func _on_button_3_pressed():
	Global.weapon = "FN FAL"

func _on_button_4_pressed():
	Global.weapon = "SCAR"

func _on_button_5_pressed():
	Global.weapon = "G36"

func _on_button_6_pressed():
	Global.weapon = "The Troubleshooter"

func _on_button_7_pressed():
	Global.weapon = "ARC-20"

func _on_button_8_pressed():
	Global.weapon = "M2000"

func _on_button_9_pressed():
	Global.weapon = "S-TAR"

func _on_button_10_pressed():
	Global.weapon = "Headhunter DMR"

func _on_button_11_pressed():
	Global.weapon = "Photon SMG"

func _on_button_12_pressed():
	Global.weapon = "A-57"

func _on_button_13_pressed():
	Global.weapon = "Laser SMG"

func _on_button_14_pressed():
	Global.weapon = "XR-50"
