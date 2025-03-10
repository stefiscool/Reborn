extends RigidBody2D

@export var skill = "Ballistics"

func _on_body_entered(body):
	if !body.is_in_group("Player") and !body.is_in_group("Water"):
		queue_free()
	if body.is_in_group("Enemy"):
		if Global.secondary == false:
			body.hp -= (Global.damage + (Global.get(skill) * (Global.damage/20)))
			body.vision = true
		if Global.secondary == true:
			body.hp -= (Global.seconddamage + (Global.get(skill) * (Global.seconddamage/20)))
			body.vision = true
			
