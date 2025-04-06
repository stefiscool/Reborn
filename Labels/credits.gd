extends Label



func _process(delta: float) -> void:
	text = "Money: R$" + str(Global.credits)
