extends Label

func _process(_delta):
	text = "Shields: " + str(Global.shields) + "/100"
