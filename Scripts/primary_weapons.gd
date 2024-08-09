extends Node2D
func _ready():
	Global.secondary = false
	Global.flamecharged = false
func _process(_delta):
	$Label.text = "Equipped: " + Global.weapon
	$Label2.text = "Firerate: " + str(int((1 / Global.rateoffire) * 60)) + " RPM" + "\nZoom: " + str(3.0 - Global.zoom) +"x" + "\nDamage: " + str(Global.damage) +"\nCapacity: " + str(Global.maxammo) +"\nBullet Velocity: " + str(Global.bulletvelocity) + " f/s" +"\nElement: " + str(Global.element) +"\n\n" + Global.description 
	
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
