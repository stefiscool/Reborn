extends Label

func _process(_delta):
	text = " Health: " + str(Global.health) + "/" + str(Global.maxhealth)
	$ColorRect2.scale.x = (float(Global.health)/float(Global.maxhealth))
