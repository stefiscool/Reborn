extends Label

func _process(_delta):
	text = "Shields: " + str(Global.shields) + "/" + str(Global.maxshields)
