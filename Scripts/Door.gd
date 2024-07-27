extends Area2D

@onready var anim = get_node("AnimatedSprite2D")
@onready var anim2 = get_node("AnimatedSprite2D2")
@onready var crash = $Crash
var fallen = false


func _on_backdoor_body_entered(body):
	if body.name == "Player" and fallen == false or body.is_in_group("Enemy") and fallen == false:
		fallen = true
		$AnimatedSprite2D.visible = false
		$AnimatedSprite2D2.visible = true
		anim2.play("fall")
		crash.play()
		


func _on_frontdoor_body_entered(body):
	if body.name == "Player" and fallen == false or body.is_in_group("Enemy") and fallen == false:
		fallen = true
		anim.play("fall")
		crash.play()
