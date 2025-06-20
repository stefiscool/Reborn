extends Node2D

var bullet = preload("res://Scenes/enemy_ship_bullet.tscn")
var bomb = preload("res://Scenes/enemy_bomb.tscn")
var timer = 0.0
var bombtimer = 0.0
@export var rof = 0.5
@export var bombchance = 35.0

func _process(delta: float) -> void:
	timer += delta
	bombtimer += delta
	
	if timer >= rof:
		spawn_bullet()
		timer = 0.0
	
	if bombtimer >= randf_range(2.0,bombchance):
		spawn_bomb()
		bombtimer = 0.0

func spawn_bullet() -> void:
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = global_position
	get_tree().current_scene.add_child(bullet_instance)

func spawn_bomb() -> void:
	var bomb_instance = bomb.instantiate()
	bomb_instance.global_position = global_position
	get_tree().current_scene.add_child(bomb_instance)
