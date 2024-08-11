extends RigidBody2D


var blown = false
var timeout = false

func _on_audio_stream_player_2d_finished():
	freeze = true
	$boom.play()
	blown = true
	scale.x = 70
	scale.y = 70
	

func _on_boom_finished():
	queue_free()

func _process(_delta):
	if blown == true:
		$Gre.visible = false

func _on_blast_radius_body_entered(body):
	if blown == true and body.is_in_group("Enemy"):
		body.hp -= 80
	

func _physics_process(_delta):
	if blown == true and scale.x > 0.9:
		scale.x -= 2.5
		scale.y -= 2.5
	if scale.x <= 0.9 and timeout == true:
		$Timer.start()
		queue_free()
		


func _on_timer_timeout():
	timeout = true
