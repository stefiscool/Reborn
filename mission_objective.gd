extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		Global.missionobjectives += 1
		$AudioStreamPlayer2D.play()
		visible = false
		queue_free()
		#$Timer.start()
		#
#
#
#func _on_timer_timeout() -> void:
	#queue_free()
