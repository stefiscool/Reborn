extends Label



func _process(delta: float) -> void:
	text = "Scrap: " + str(Global.scrap) + "lbs"
