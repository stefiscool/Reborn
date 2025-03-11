extends Label

func _process(_delta):
	text = str(Global.xp) + "/" + str(Global.xpneeded) + " XP"
	$ColorRect2.scale.x = (float(Global.xp)/float(Global.xpneeded))
