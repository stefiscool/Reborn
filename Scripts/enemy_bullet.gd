extends RigidBody2D

var damage = 20

func _on_body_entered(body):
	if !body.is_in_group("Water"):
		queue_free()
	if body.is_in_group("Player"):
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.health -= damage
		queue_free()
