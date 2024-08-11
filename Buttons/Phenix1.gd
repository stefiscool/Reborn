extends Sprite2D


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		$".".visible = true
		$AudioStreamPlayer2D.play()

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		$".".visible = false
		$AudioStreamPlayer2D.play()
