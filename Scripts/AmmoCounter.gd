extends Label

func _process(_delta):
	if Global.secondary == false:
		text = "Ammo: " + str(Global.ammo) + "/" + str(Global.maxammo)
	if Global.secondary == true:
		text = "Ammo: " + str(Global.secondammo) + "/" + str(Global.secondmaxammo)
