extends AnimatedSprite2D

func _process(_delta):
	if Global.Class == "Noble":
		if Global.meleeing == false:
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
		else:
			play("melee")
			$"../Gun".visible = false
			
	elif Global.Class == "Bastion":
		if Global.meleeing == false:
			if Input.is_action_pressed("move_up"):
				play("walkbastion")
			elif Input.is_action_pressed("move_down"):
				play("walkbastion")
			elif Input.is_action_pressed("move_left"):
				play("walkbastion")
			elif Input.is_action_pressed("move_right"):
				play("walkbastion")
			else: 
				play("idlebastion")
		else:
			play("meleebastion")
			$"../Gun".visible = false
			
	elif Global.Class == "Assassin":
		if Global.meleeing == false:
			if Input.is_action_pressed("move_up"):
				play("walkassassin")
			elif Input.is_action_pressed("move_down"):
				play("walkassassin")
			elif Input.is_action_pressed("move_left"):
				play("walkassassin")
			elif Input.is_action_pressed("move_right"):
				play("walkassassin")
			else: 
				play("idleassassin")
		else:
			play("meleeassassin")
			$"../Gun".visible = false
			
	elif Global.Class == "Scholar":
		if Global.meleeing == false:
			if Input.is_action_pressed("move_up"):
				play("walkscholar")
			elif Input.is_action_pressed("move_down"):
				play("walkscholar")
			elif Input.is_action_pressed("move_left"):
				play("walkscholar")
			elif Input.is_action_pressed("move_right"):
				play("walkscholar")
			else: 
				play("idlescholar")
		else:
			play("meleescholar")
			$"../Gun".visible = false
