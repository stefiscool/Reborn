extends Label

func _process(_delta):
	text = "Shields: " + str(Global.shields) + "/" + str(Global.maxshields)
	$ColorRect3.scale.x = (float(Global.shields)/float(Global.maxshields))
