extends RigidBody2D


var blown = false

func _on_audio_stream_player_2d_finished():
	freeze = true
	$boom.play()
	blown = true
	$CollisionShape2D.disabled = true
	


func _process(_delta):
	if blown == true:
		$Gre.visible = false

func _on_blast_radius_body_entered(body):
	if blown == true and body.is_in_group("Enemy"):
		body.hp -= 30 + (Global.Explosives * 10)
		body.speed -= 5000

func _physics_process(_delta):
	if blown == true and scale.x < 35:
		scale.x += 1.5
		scale.y += 1.5
	if scale.x >= 5:
		scale.x = 15
		scale.y = 15


func _on_grenade_timer_timeout():
	queue_free()
