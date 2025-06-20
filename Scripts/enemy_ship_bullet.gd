extends Area2D


@export var shipweapon = "Kinetic Cannons"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += 1000 * delta
	match shipweapon:
		"Ion Cannons":
			$Sprite2D.frame = 0
		"Precision Lasers":
			$Sprite2D.frame = 7
		"Heavy Lasers":
			$Sprite2D.frame = 4
		"Heavy Cannons":
			$Sprite2D.frame = 5
		"Kinetic Cannons":
			$Sprite2D.frame = 2
		"Rapid Blasters":
			$Sprite2D.frame = 1
		"Plasma Cannons:":
			$Sprite2D.frame = 3
		


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Border"):
		queue_free()
		
	if body.is_in_group("Player"):
		Global.shipcurrenthealth -= randi_range(30,100)
