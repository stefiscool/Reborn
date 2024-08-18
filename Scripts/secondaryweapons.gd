extends Node2D
func _ready():
	Global.secondary = true
func _process(_delta):
	$Label.text = "Equipped: " + Global.secondweapon
	$Label2.text = "Firerate: " + str((1 / Global.secondrateoffire) * 60) + " RPM" + "\nZoom: " + str(3.0 - Global.secondzoom) +"x" + "\nDamage: " + str(Global.seconddamage) +"\nCapacity: " + str(Global.secondmaxammo) +"\nBullet Velocity: " + str(Global.secondbulletvelocity) + " f/s" +"\nElement: " + str(Global.secondelement)  +"\n\n" + Global.seconddescription  
	
	if "M1911" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button.visible = true
	if "Glock 18" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button2.visible = true
	if "Deagle" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button3.visible = true




func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")



func _on_button_pressed():
	Global.secondweapon = "M1911"

func _on_button_2_pressed():
	Global.secondweapon = "Glock 18"

func _on_button_3_pressed():
	Global.secondweapon = "Deagle"
