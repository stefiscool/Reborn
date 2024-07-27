extends Label

func _process(_delta):
	text = "Level " + str(Global.level) + " " + str(Global.Class)
