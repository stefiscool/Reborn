extends Node2D

func _process(_delta):
	$Label.text = "Equipped: " + Global.shipname
	$Label2.text = "\nHealth: " + str(Global.shiphealth) +"\nSpeed: " + str(Global.shipspeed) +"\nWeapon: " + str(Global.shipweapon) +"\nWeapon Damage: " + str(Global.shipweapondamage)  + "\nSpecial: " + str(Global.shipspecial) + "\nSpecial Damage: " + str(Global.shipspecialdamage) + "\nSpecial Cooldown: " + str(Global.shipspecialcooldown)+ "s\n\n" + Global.shipdescription  
	
	


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")
