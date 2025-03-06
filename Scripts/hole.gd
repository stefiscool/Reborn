extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/gameover.tscn")
		$AudioStreamPlayer2D.pitch_scale = 1.7
		$AudioStreamPlayer2D.play()
	if body.is_in_group("Enemy"):
		body.hp -= 1000000000
		$AudioStreamPlayer2D.play()
