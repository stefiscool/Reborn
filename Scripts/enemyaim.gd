extends RayCast2D

var dead = false
@export var player: Node2D


func _process(_delta):
	if dead == false and $"..".vision == true:
		look_at(player.global_position)


func _on_criminal_dead_2():
	dead = true
