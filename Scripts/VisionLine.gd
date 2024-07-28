extends RayCast2D


signal vision()
signal novision()


func _process(_delta):
	if get_collider() is CharacterBody2D:
		emit_signal("vision")
	else:
		emit_signal("novision")
