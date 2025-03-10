extends Button

@export var skillname = "Ballistics"


func _process(delta: float) -> void:
	$".".text = skillname + ": " + str(Global.get(skillname))
	


func _on_pressed() -> void:
	if Global.skillpoints > 0:
		var current_value = Global.get(skillname)
		Global.set(skillname, current_value + 1)
		Global.skillpoints -= 1
