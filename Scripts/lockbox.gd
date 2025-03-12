extends StaticBody2D
class_name WeightedRandomGenerator
@export var max_value: int = 10
@export var weight_strength: float = 2.0
var skill = "Engineering"
var level = 1

func _ready() -> void:
	var skillnumber = randi() % 2
	if skillnumber == 0:
		skill = "Engineering"
	elif skillnumber == 1:
		skill = "Computing"
	level = get_random_value()
	if level == 0:
		queue_free()
	if Global.mission == 0:
		queue_free()
	$Label.text = "Need "+ str(level) + " " + skill + " to open"
		
func get_random_value() -> int:
	var luck_factor = clamp(Global.Luck, 0.0, 1.0)
	var adjusted_weight = weight_strength * (1.0 + luck_factor)
	var random_value = randf()
	random_value = pow(random_value, adjusted_weight)
	return int(random_value * float(max_value))




func _on_skill_check_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if Global.get(skill) >= level:
			queue_free()
		else:
			$Label.visible = true
