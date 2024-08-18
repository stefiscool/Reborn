extends RigidBody2D



func _on_body_entered(body):
	if !body.is_in_group("Player") and !body.is_in_group("Water"):
		queue_free()
	if body.is_in_group("Enemy"):
		if Global.secondary == false:
			body.hp -= Global.damage
			body.vision = true
		if Global.secondary == true:
			body.hp -= Global.seconddamage
			body.vision = true
			
