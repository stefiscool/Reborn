extends Label

func _process(_delta):
	
	if Global.secondary == false:
		text = " Mags: " + str(Global.mags) + "/"+ str(Global.maxprimarymags)
	if Global.secondary == true:
		text = " Mags: " + str(Global.secondmags)+ "/"+ str(Global.maxsecondarymags)
