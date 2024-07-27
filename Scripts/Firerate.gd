extends Timer



func _process(_delta):
	if Global.secondary == false:
		wait_time = Global.rateoffire
	if Global.secondary == true:
		wait_time = Global.secondrateoffire
