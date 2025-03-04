extends RigidBody2D


var blown = false

func _on_audio_stream_player_2d_finished():
	freeze = true
	$boom.play()
	blown = true
	

func _on_boom_finished():
	queue_free()

func _process(_delta):
	if blown == true:
		$Gre.visible = false

func _on_blast_radius_body_entered(body):
	if blown == true and body.is_in_group("Enemy"):
		body.hp -= 10 + (Global.level * 10)
		body.vision = false

func _physics_process(_delta):
	if blown == true and scale.x < 35:
		scale.x += 1.5
		scale.y += 1.5
	if scale.x >= 30:
		queue_free()
		
