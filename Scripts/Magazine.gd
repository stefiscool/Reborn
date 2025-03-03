extends Area2D
@onready var sfx = $SFX
var picked = false
@export var primary = true

func _ready() -> void:
	if primary == false:
		$Label.text = "+1 Secondary Mag"
		$AnimatedSprite2D.queue_free()
		$AnimatedSprite2D2.play(Global.secondelement)
	if primary == true:
		$AnimatedSprite2D2.queue_free()
		$AnimatedSprite2D.play(Global.element)


func _on_body_entered(body):
	if body.is_in_group("Player") and picked == false:
		if primary == false:
			Global.secondmags += 1
			$AnimatedSprite2D2.visible = false
		if primary == true:
			Global.mags += 1
			$AnimatedSprite2D.visible = false
		sfx.play()
		picked = true
		$Timer.start()
		
		
		$Label.visible = true


func _on_timer_timeout():
	queue_free()
