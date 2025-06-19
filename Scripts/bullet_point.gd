extends Node2D

var bullet = preload("res://Scenes/enemy_ship_bullet.tscn")
var timer = 0.0

func _process(delta: float) -> void:
	timer += delta
	
	if timer >= 0.5:
		spawn_bullet()
		timer = 0.0

func spawn_bullet() -> void:
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = global_position
	get_tree().current_scene.add_child(bullet_instance)
