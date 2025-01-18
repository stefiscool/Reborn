extends AnimatedSprite2D

func _process(_delta):

	if Input.is_action_pressed("move_up"):
		play("walk")
	elif Input.is_action_pressed("move_down"):
		play("walk")
	elif Input.is_action_pressed("move_left"):
		play("walk")
	elif Input.is_action_pressed("move_right"):
		play("walk")
	else: 
		play("idle")
