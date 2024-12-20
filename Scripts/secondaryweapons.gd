extends Node2D
func _ready():
	Global.secondary = true
func _process(_delta):
	$Label.text = "Equipped: " + Global.secondweapon
	if Global.secondelement == "Kinetic(Sh)":
		$Label2.text = "Firerate: " + str((1 / Global.secondrateoffire) * 60) + " RPM" + "\nZoom: " + str(3.0 - Global.secondzoom) + "x" + "\nDamage: " + str(Global.seconddamage) + "x5" + "\nCapacity: " + str(Global.secondmaxammo) + "\nBullet Velocity: " + str(Global.secondbulletvelocity) + " f/s" + "\nElement: " + str(Global.secondelement) + "\n\n" + Global.seconddescription
	else:
		$Label2.text = "Firerate: " + str((1 / Global.secondrateoffire) * 60) + " RPM" + "\nZoom: " + str(3.0 - Global.secondzoom) + "x" + "\nDamage: " + str(Global.seconddamage) + "\nCapacity: " + str(Global.secondmaxammo) + "\nBullet Velocity: " + str(Global.secondbulletvelocity) + " f/s" + "\nElement: " + str(Global.secondelement) + "\n\n" + Global.seconddescription	
	
	if "M1911" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button.visible = true
	if "Glock 18" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button2.visible = true
	if "Deagle" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button3.visible = true
	if "Trench Shotgun" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button4.visible = true
	if "Void Supercannon" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button5.visible = true
	if "A-10 Shotgun" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button6.visible = true
	if "White Feather Sniper" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button7.visible = true
	if "Supercharged Crossbow" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button8.visible = true
	if "Shock Cannon" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button9.visible = true
	if "A-70 Shotgun" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button10.visible = true
	if "RPG-30" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button11.visible = true
	if "AT-10 Antitank Rifle" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button12.visible = true
	if "P-10 Pistol" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button13.visible = true
	if "Laser Pistol" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button14.visible = true
	if "P-20 Supressed Pistol" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button15.visible = true
	if "Shock Pistol" in Global.inventory:
		$ScrollContainer/ColorRect/VBoxContainer/Button16.visible = true




func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")



func _on_button_pressed():
	Global.secondweapon = "M1911"

func _on_button_2_pressed():
	Global.secondweapon = "Glock 18"

func _on_button_3_pressed():
	Global.secondweapon = "Deagle"

func _on_button_4_pressed():
	Global.secondweapon = "Trench Shotgun"

func _on_button_5_pressed():
	Global.secondweapon = "Void Supercannon"

func _on_button_6_pressed():
	Global.secondweapon = "A-10 Shotgun"

func _on_button_7_pressed():
	Global.secondweapon = "White Feather Sniper"

func _on_button_8_pressed():
	Global.secondweapon = "Supercharged Crossbow"

func _on_button_9_pressed():
	Global.secondweapon = "Shock Cannon"

func _on_button_10_pressed():
	Global.secondweapon = "A-70 Shotgun"

func _on_button_11_pressed():
	Global.secondweapon = "RPG-30"

func _on_button_12_pressed():
	Global.secondweapon = "AT-10 Antitank Rifle"

func _on_button_13_pressed():
	Global.secondweapon = "P-10 Pistol"

func _on_button_14_pressed():
	Global.secondweapon = "Laser Pistol"

func _on_button_15_pressed():
	Global.secondweapon = "P-20 Supressed Pistol"

func _on_button_16_pressed():
	Global.secondweapon = "Shock Pistol"
	pass # Replace with function body.
