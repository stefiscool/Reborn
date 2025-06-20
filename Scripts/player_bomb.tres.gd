extends Node2D

var speed = 500

func _ready() -> void:
	match Global.shipspecial:
		"Missile Barrage":
			$Area2D.queue_free()
			$NapalmBomb.queue_free()
			$"Ion Bomb".queue_free()
			$"EMP Pulse".queue_free()
			$Shockwave.queue_free()
		"Afterburner":
			$Area2D.queue_free()
			$NapalmBomb.queue_free()
			$"Ion Bomb".queue_free()
			$"EMP Pulse".queue_free()
			$Shockwave.queue_free()
			$"Missile Barrage".queue_free()
		"Napalm Bomb":
			$Area2D.queue_free()
			$"Ion Bomb".queue_free()
			$"EMP Pulse".queue_free()
			$Shockwave.queue_free()
			$"Missile Barrage".queue_free()
		"Shockwave":
			$Area2D.queue_free()
			$NapalmBomb.queue_free()
			$"Ion Bomb".queue_free()
			$"EMP Pulse".queue_free()
			$"Missile Barrage".queue_free()
		"Scrap Bomb":
			$NapalmBomb.queue_free()
			$"Ion Bomb".queue_free()
			$"EMP Pulse".queue_free()
			$Shockwave.queue_free()
			$"Missile Barrage".queue_free()
		"EMP Pulse":
			$Area2D.queue_free()
			$NapalmBomb.queue_free()
			$"Ion Bomb".queue_free()
			$Shockwave.queue_free()
			$"Missile Barrage".queue_free()
		"Ion Bomb":
			$Area2D.queue_free()
			$NapalmBomb.queue_free()
			$"EMP Pulse".queue_free()
			$Shockwave.queue_free()
			$"Missile Barrage".queue_free()
	await get_tree().create_timer(1.0).timeout
	queue_free()
func _process(delta: float) -> void:
	
	if Global.shipspecial == "Napalm Bomb":
		$NapalmBomb.scale.x += 70*delta
		$NapalmBomb.scale.y += 70*delta
		
	if Global.shipspecial == "Ion Bomb":
		$"Ion Bomb".scale.x += 70*delta
		$"Ion Bomb".scale.y += 70*delta
		
	if Global.shipspecial == "EMP Pulse":
		$"EMP Pulse".scale.x += 90*delta
		$"EMP Pulse".scale.y += 90*delta
		$"EMP Pulse/Tesla".frame = randi_range(0,5)
	
	if Global.shipspecial == "Shockwave":
		$Shockwave.scale.y += 100*delta
		$Shockwave.scale.x += 20*delta
		$Shockwave/Tesla.frame = randi_range(0,5)
		
	if Global.shipspecial == "Scrap Bomb":
		$Area2D/CollisionShape2D.position.y += speed * delta
		$Area2D/CollisionShape2D2.position.x += speed * delta
		$Area2D/CollisionShape2D3.position.y -= speed * delta
		$Area2D/CollisionShape2D4.position.x -= speed * delta
	
	if Global.shipspecial == "Missile Barrage":
		$"Missile Barrage".position.y -= speed * delta
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.shipcurrenthealth -= randi_range(30,100)
		queue_free()
