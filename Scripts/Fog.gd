extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Player") or body.is_in_group("Enemy"):
		queue_free()
