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
	var values = [0, 10, 20, 50, 100, 500, 1000, 5000, 10000, 50000, 100000]
	
	# Extremely skewed base weights
	# At luck = 1, 100000 will have ~0.01% chance
	var base_weights = [1000, 600, 350, 200, 100, 50, 25, 10, 3, 1, 0.1]
	
	# Modified weights that will be affected by luck
	var modified_weights = base_weights.duplicate()
	
	# Apply a dramatic luck effect
	var luck = clamp(Global.Luck, 0, 10)
	
	# Reduce the weight of the lower values based on luck
	for i in range(4):  # First 4 values (0, 10, 20, 50)
		var reduction_factor = 1.0 - (luck / 10.0) * 0.9  # Up to 90% reduction
		modified_weights[i] = base_weights[i] * reduction_factor
	
	# Dramatically increase weights of higher rewards as luck increases
	for i in range(4, modified_weights.size()):
		var position_factor = float(i) / float(modified_weights.size() - 1)
		# Exponential scaling for high-end values that gets more extreme at the end
		var boost_factor = pow(2.0, luck/3.0) * pow(position_factor, 2) * luck
		modified_weights[i] = base_weights[i] * max(1.0, boost_factor)
	
	# Extra boost for the highest values when luck is high
	if luck >= 10:
		var top_tier_boost = pow(luck, 2) / 5.0
		modified_weights[8] *= top_tier_boost  # 10000 value
		modified_weights[9] *= top_tier_boost * 1.5  # 50000 value
		modified_weights[10] *= top_tier_boost * 2.0  # 100000 value
	
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
	if body.is_in_group("Player") and picked == false:
		zip.play()
		picked = true
		$Timer.start()
		Global.credits += health
		$Label.text = "+" + str(health) + " Republic Credits"
		$AnimatedSprite2D.visible = false
		$Label.visible = true


func _on_timer_timeout():
	queue_free()
