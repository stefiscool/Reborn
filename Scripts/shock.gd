extends RigidBody2D



func _on_body_entered(body):
	if !body.is_in_group("Player") and !body.is_in_group("Water"):
		queue_free()
	if body.is_in_group("Enemy"):
		if Global.secondary == false:
			body.hp -= (Global.damage + (Global.Energy * (Global.damage/20)))
			body.vision = false
		if Global.secondary == true:
			body.hp -= (Global.seconddamage + (Global.Energy * (Global.seconddamage/20)))
			body.vision = false
			
