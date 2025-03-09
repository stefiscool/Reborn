extends StaticBody2D

@export var hp = 450
var boomplayed = false
var fireplayed = false

func _on_area_2d_body_entered(body):
	if body.is_in_group("bullet"):
		$AudioStreamPlayer2D.play()
		if Global.secondary == false:
			hp -=  Global.damage
		if Global.secondary == true:
			hp -= Global.seconddamage
func _process(delta):
	if hp <= 100:
		$Smoke.visible = true
	if hp <= 50:
		if fireplayed == false:
			$AudioStreamPlayer2D2.play()
			fireplayed = true
		$Fire.visible = true
	if hp <= 0:
		if boomplayed == false:
			boomplayed = true
			$boom.play()
		$Smoke.visible = false
		$Fire.visible = false
		$BlastRadius/Polygon2D.visible = true
		$BlastRadius.scale.x += 40 * delta
		$BlastRadius.scale.y += 40 * delta


func _on_boom_finished():
	queue_free()


func _on_blast_radius_body_entered(body):
	if body.is_in_group("Enemy"):
		body.hp -= 200


func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		$AudioStreamPlayer2D.play()
		hp -=  1000
		
