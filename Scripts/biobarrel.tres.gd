extends StaticBody2D

@export var hp = 450
var boomplayed = false
var blown = false

func _on_area_2d_body_entered(body):
	if body.is_in_group("bullet"):
		$AudioStreamPlayer2D.play()
		$AudioStreamPlayer2D3.play()
		if Global.secondary == false:
			hp -=  Global.damage
		if Global.secondary == true:
			hp -= Global.seconddamage
func _process(delta):
	if hp < 100:
		$Smoke.visible = true
	if hp <= 50:
		$AudioStreamPlayer2D2.play()
		$Fire.visible = true
	if hp <= 0:
		if boomplayed == false:
			boomplayed = true
			$boom.play()
		$Smoke.visible = false
		$Fire.visible = false
		$BlastRadius/Polygon2D.visible = true
		if blown == false:
			$BlastRadius.scale.x += 30 * delta
			$BlastRadius.scale.y += 30 * delta
	


func _on_boom_finished():
	blown = true
	$Timer.start()


func _on_blast_radius_body_entered(body):
	if body.is_in_group("Enemy"):
		body.hp -= 50
		$AudioStreamPlayer2D4.play()
		


		


func _on_timer_timeout() -> void:
	queue_free()
