extends Area2D
const Balloon = preload("res://Dialouge/balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"



func action() -> void:
	if Global.indialogue == false:
		var balloon: Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
	


func _on_body_entered(body):
	if body.name == "Player":
		Global.nearperson = true


func _on_body_exited(body):
	if body.name == "Player":
		Global.nearperson = false
