extends StaticBody2D
class_name WeightedRandomGenerator

var skill = "Engineering"
var level = 1
var spawn_chance = 0.75  # 75% chance to spawn (increased from implicit 0 elimination)

func _ready() -> void:
	# Determine if the lockbox should spawn
	if randf() > spawn_chance or Global.mission == 0:
		queue_free()
		return
		
	# Choose random skill type
	var skillnumber = randi() % 2
	if skillnumber == 0:
		skill = "Engineering"
		$AnimatedSprite2D.play("Engineering")
	elif skillnumber == 1:
		skill = "Computing"
		$AnimatedSprite2D.play("Computing")
	
	# Get level requirement
	level = get_random_value()
	if level == 0:
		queue_free()
		
	$Label.text = "Need "+ str(level) + " " + skill + " to open"
		
func get_random_value() -> int:
	# Use Global.level as max value
	var max_level = max(1, Global.level)  # Ensure at least level 1
	
	# Apply luck factor
	var luck_factor = clamp(Global.Luck / 10.0, 0.0, 1.0)  # Assuming Luck ranges from 0-10
	var weight_strength = 2.0  # Base difficulty curve
	var adjusted_weight = weight_strength * (1.0 - luck_factor * 0.5)  # Luck reduces difficulty
	
	# Generate weighted random value
	var random_value = randf()
	random_value = pow(random_value, adjusted_weight)
	
	# Scale to max level, but ensure minimum of 1
	return max(1, int(random_value * float(max_level)))

func _on_skill_check_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if Global.get(skill) >= level:
			queue_free()
		else:
			$Label.visible = true