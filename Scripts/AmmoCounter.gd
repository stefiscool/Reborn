extends Label

func _process(_delta):
	if Global.secondary == false:
		text = "Ammo: " + str(Global.ammo) + "/" + str(Global.maxammo)
		$ColorRect2.scale.x = (float(Global.ammo)/float(Global.maxammo))
	if Global.secondary == true:
		text = "Ammo: " + str(Global.secondammo) + "/" + str(Global.secondmaxammo)
		$ColorRect2.scale.x = (float(Global.secondammo)/float(Global.secondmaxammo))
