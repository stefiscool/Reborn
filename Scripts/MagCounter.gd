extends Label

func _process(_delta):
	
	if Global.secondary == false:
		text = "Mags: " + str(Global.mags)
	if Global.secondary == true:
		text = "Mags: " + str(Global.secondmags)
