extends Label

func _process(_delta):
	text = str(Global.xp) + "/" + str(Global.xpneeded) + " XP"
