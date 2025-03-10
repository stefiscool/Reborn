extends Area2D

@export var damage = 0

func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		body.hp -= damage + (Global.Melee * 10)
