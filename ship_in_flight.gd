extends CharacterBody2D

var bullet = preload("res://Scenes/ship_bullet.tscn")
var can_fire = true

func _physics_process(delta: float) -> void:
	var input = Input.get_vector("move_left","move_right","move_up","move_down")
	player_movement(input, delta)

func _process(delta: float) -> void:
	$Firerate.wait_time = Global.shipfirerate
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instantiate()
		$Gunfire.play()
		bullet_instance.position = $BulletPoint.get_global_position()
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		$Firerate.start()

func player_movement(input, delta):
	if input:
		velocity = input * Global.shipspeed / 10
		velocity = velocity.limit_length(Global.shipspeed)
	else:
		velocity = Vector2(0,0)
	move_and_slide()


func _on_firerate_timeout() -> void:
	can_fire = true
