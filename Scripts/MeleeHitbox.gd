extends Area2D

func _process(delta):
	if Global.meleeing == true:
		rotation_degrees += 500 * delta


func _on_body_entered(body):
	if body.is_in_group("Enemy") and Global.meleeing == true:
		body.hp -= 30 + (Global.Melee * 10)
