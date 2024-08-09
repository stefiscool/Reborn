extends AnimatedSprite2D


func _process(_delta):
	if Global.secondary == false:
		if Global.weapon == "AK-47":
			play("AK-47")
		if Global.weapon == "G36":
			play("G36")
		if Global.weapon == "FN FAL":
			play("FN FAL")
		if Global.weapon == "P90":
			play("P90")
		if Global.weapon == "SCAR":
			play("SCAR")
			
	if Global.secondary == true:
		if Global.secondweapon == "M1911":
			play("M1911")
		if Global.secondweapon == "Glock 18":
			play("Glock 18")
		if Global.secondweapon == "Deagle":
			play("Deagle")
			
