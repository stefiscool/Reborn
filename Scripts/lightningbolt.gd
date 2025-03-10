extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		body.hp -= 130  + (Global.Energy * 10)
		body.vision = false
