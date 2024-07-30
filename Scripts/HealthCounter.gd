extends Label

func _process(_delta):
	text = "Health: " + str(Global.health) + "/" + str(Global.maxhealth)
