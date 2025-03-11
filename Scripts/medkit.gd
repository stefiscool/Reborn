extends Area2D
@onready var zip = $Zip
var picked = false
var health = 40

func _ready():
	var random_number = get_weighted_random_value()
	health = random_number
	if health == 0:
		queue_free()
	$AnimatedSprite2D.play(str(health))
	

	


func get_weighted_random_value() -> int:
	var values = [0, 20, 40, 50, 60, 75, 80, 100, 120, 150, 200]
	
	# Base weights
	var base_weights = [20, 18, 16, 14, 12, 10, 8, 6, 4, 2, 1]
	
	# Modified weights that will be affected by luck
	var modified_weights = base_weights.duplicate()
	
	# Apply a dramatic luck effect
	# At Luck = 0, the first item (0 value) has its normal weight
	# At Luck = 10, the first item (0 value) has 0 weight
	var luck = clamp(Global.Luck, 0, 10)
	
	# Reduce the weight of the 0 value based on luck
	var zero_reduction_factor = 1.0 - (luck / 10.0)
	modified_weights[0] = int(base_weights[0] * zero_reduction_factor)
	
	# Optionally, increase weights of better rewards as luck increases
	for i in range(1, modified_weights.size()):
		var position_factor = float(i) / float(modified_weights.size() - 1)
		var boost_factor = 1.0 + (luck / 10.0) * position_factor * 2.0
		modified_weights[i] = int(base_weights[i] * boost_factor)
	
	# Calculate total weight after modifications
	var total_weight = 0
	for weight in modified_weights:
		total_weight += weight
	
	# Generate random value and determine result
	var random_value = randf() * total_weight
	var current_weight = 0
	
	for i in range(values.size()):
		current_weight += modified_weights[i]
		if random_value <= current_weight:
			return values[i]
	
	return values[0]
	


func _on_body_entered(body):
	if body.is_in_group("Player") and Global.health < Global.maxhealth and picked == false:
		zip.play()
		picked = true
		$Timer.start()
		Global.health += ((health-20) + (Global.Medicine * 10))
		$Label.text = str(((health-20) + (Global.Medicine * 10))) + "+ Health"
		$AnimatedSprite2D.visible = false
		$Label.visible = true


func _on_timer_timeout():
	queue_free()
