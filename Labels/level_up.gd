extends Label



func _process(delta: float) -> void:
	if Global.levelupplayed == true:
		visible = true
	else:
		visible = false
	
