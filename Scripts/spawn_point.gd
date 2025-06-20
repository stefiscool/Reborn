extends Node2D

var enemy = preload("res://Scenes/Enemies/enemy_ship.tscn")
var spawn_timer = 0.0
var next_spawn_time = 0.0

# Spawn interval range (in seconds)
const SPAWN_TIME_MIN = 1.0
const SPAWN_TIME_MAX = 3.0

func _ready() -> void:
	var i = randi_range(0,2)
	if i == 0:
		enemy = preload("res://Scenes/Enemies/enemy_ship.tscn")
	if i == 1:
		enemy = preload("res://Scenes/Enemies/enemybomber.tscn")
	if i == 2:
		enemy = preload("res://Scenes/Enemies/enemyheavybomber.tscn")
	next_spawn_time = randf_range(SPAWN_TIME_MIN, SPAWN_TIME_MAX)

func _process(delta: float) -> void:
	spawn_timer += delta
	
	# Check if it's time to spawn an enemy
	if spawn_timer >= next_spawn_time:
		spawn_enemy()
		
		# Reset timer and set next random spawn time
		spawn_timer = 0.0
		next_spawn_time = randf_range(SPAWN_TIME_MIN, SPAWN_TIME_MAX)

func spawn_enemy() -> void:
	# Instance the enemy scene
	var enemy_instance = enemy.instantiate()
	
	# Set random spawn position (adjust these values based on your game)
	var spawn_x = randf_range(0, get_viewport().size.x)  # Random X across screen width
	var spawn_y = -50  # Spawn above the screen
	
	enemy_instance.global_position = Vector2(spawn_x, spawn_y)
	
	# Add the enemy to the scene tree
	get_tree().current_scene.add_child(enemy_instance)
