extends CharacterBody2D

const HORIZONTAL_SPEED_MIN = 50.0
const HORIZONTAL_SPEED_MAX = 400.0
@export var speed = 400
@export var hp = 50
@export var damage = 100
@export var tracking_speed = 200.0  # Speed when moving toward player

var player: Node2D = null

func _ready():
	# Find the player node
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() > 0:
		player = players[0]

func _physics_process(delta: float) -> void:
	# Always move downward
	velocity.y = speed
	
	# Track player's horizontal position
	if player != null:
		var distance_to_player = player.global_position.x - global_position.x
		
		# Move toward the player's x position
		if abs(distance_to_player) > 10.0:  # Dead zone to prevent jittering
			if distance_to_player > 0:
				velocity.x = tracking_speed  # Move right toward player
			else:
				velocity.x = -tracking_speed  # Move left toward player
		else:
			velocity.x = 0  # Stop horizontal movement when close enough
	else:
		# Fallback: try to find player again if reference was lost
		var players = get_tree().get_nodes_in_group("Player")
		if players.size() > 0:
			player = players[0]
		else:
			velocity.x = 0
	
	move_and_slide()
	
	if hp <= 0:
		queue_free()

func _on_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("Border"):
		queue_free()
		
	if body.is_in_group("Enemy") and body != self:
		queue_free()
		
	if body.is_in_group("Player"):
		queue_free()
		Global.shipcurrenthealth -= randi_range(50,150)
