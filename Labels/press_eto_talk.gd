extends Label


func _process(delta: float) -> void:
	if Global.nearperson == true:
		visible = true
	else:
		visible = false
