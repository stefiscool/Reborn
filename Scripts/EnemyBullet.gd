extends Area2D

@onready var gunshot = $Gunshot
@onready var hit = $Hit
var vision = false
var can_fire = true
var dead = false

func _process(delta):
	if vision == true and can_fire == true and dead == false:
		position.x += 1000 * delta
		gunshot.play()



func _on_body_entered(body):
	if body.is_in_group("Player") and dead == false:
		hit.play()
		if Global.shields <= 0:
			Global.health -= int(15/(Global.defense))
			Global.damaged = true

		else:
			Global.shields -= int(15/(Global.defense))
			Global.damaged = true

		position.x = 0
		can_fire = false
		$Firerate.start()
		
	if !body.is_in_group("Player") and dead == false:
		position.x = 0
		can_fire = false
		$Firerate.start()
		


func _on_firerate_timeout():
	can_fire = true

	


func _on_vision_line_vision():
	vision = true



func _on_criminal_dead_2():
	dead = true
	queue_free()


func _on_vision_line_novision():
	vision = false
