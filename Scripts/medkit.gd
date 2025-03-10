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
	$Label.text = str(health) + "+ Health"

	

func get_weighted_random_value() -> int:
	var values = [0, 20, 40, 50, 60, 75, 80, 100, 120, 150, 200]
	

	var weights = [20, 18, 16, 14, 12, 10, 8, 6, 4, 2, 1]

	var total_weight = 0
	for weight in weights:
		total_weight += weight

	var random_value = randf() * total_weight

	var current_weight = 0
	for i in range(values.size()):
		current_weight += weights[i]
		if random_value <= current_weight:
			return values[i]

	return values[0]
	


func _on_body_entered(body):
	if body.is_in_group("Player") and Global.health < Global.maxhealth and picked == false:
		zip.play()
		picked = true
		$Timer.start()
		Global.health += ((health-20) + (Global.Medicine * 10))
		$AnimatedSprite2D.visible = false
		$Label.visible = true


func _on_timer_timeout():
	queue_free()
