extends CharacterBody2D


const HORIZONTAL_SPEED_MIN = 50.0
const HORIZONTAL_SPEED_MAX = 200.0

@export var speed = 300
@export var hp = 100
@export var damage = 100
var horizontal_direction = 0.0
var horizontal_speed = 0.0
var direction_change_timer = 0.0
var direction_change_interval = 1.0  # Change direction every 1 second

func _physics_process(delta: float) -> void:
	# Always move downward
	velocity.y = speed
	
	# Handle random horizontal movement
	direction_change_timer += delta
	
	# Change direction and speed at random intervals
	if direction_change_timer >= direction_change_interval:
		# Reset timer with some randomness
		direction_change_timer = 0.0
		direction_change_interval = randf_range(0.5, 2.0)  # Random interval between 0.5-2 seconds
		
		# Choose random direction: -1 (left), 0 (straight), or 1 (right)
		horizontal_direction = randi_range(-1, 1)
		
		# Choose random horizontal speed
		horizontal_speed = randf_range(HORIZONTAL_SPEED_MIN, HORIZONTAL_SPEED_MAX)
	
	# Apply horizontal movement
	velocity.x = horizontal_direction * horizontal_speed
	
	move_and_slide()



func _on_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("Border"):
		queue_free()
	
	
