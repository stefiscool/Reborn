extends RigidBody2D

var blown = false
var boomplayed = false

func boom():
	mass = 1000000
	freeze = true
	if boomplayed == false:
		$boom.play()
		blown = true
		boomplayed = true
	
func _physics_process(delta):
	if blown == true:
		$Polygon2D2.visible = false
		$BlastRadius/Polygon2D.visible = true
		$BlastRadius.scale.x += 40 * delta
		$BlastRadius.scale.y += 40 * delta


func _on_body_entered(body):
	if !body.is_in_group("Player") and !body.is_in_group("Water"):
		freeze = true
		mass = 10000
		boom()




func _on_boom_finished():
	queue_free()
	

func _on_blast_radius_body_entered(body):
	if body.is_in_group("Enemy"):
		if Global.secondary == false:
			body.hp -= Global.damage
			body.vision = true
		if Global.secondary == true:
			body.hp -= Global.seconddamage
			body.vision = true
			
