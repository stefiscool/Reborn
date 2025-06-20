extends Node2D

var speed = 500

func _process(delta: float) -> void:
	$Area2D/CollisionShape2D.position.y += speed * delta
	$Area2D/CollisionShape2D2.position.x += speed * delta
	$Area2D/CollisionShape2D3.position.y -= speed * delta
	$Area2D/CollisionShape2D4.position.x -= speed * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.shipcurrenthealth -= randi_range(30,100)
		queue_free()
