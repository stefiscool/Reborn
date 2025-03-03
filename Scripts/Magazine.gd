extends Area2D
@onready var sfx = $SFX
var picked = false
var primary: int

func _ready() -> void:
	primary = randi() % 3
	if primary == 0:
		queue_free()
	if primary == 2:
		$Label.text = "+1 Secondary Mag"
		$AnimatedSprite2D.queue_free()
		$AnimatedSprite2D2.play(Global.secondelement)
	if primary == 1:
		$AnimatedSprite2D2.queue_free()
		$AnimatedSprite2D.play(Global.element)


func _on_body_entered(body):
	if body.is_in_group("Player") and picked == false:
		if primary == 2:
			Global.secondmags += 1
			$AnimatedSprite2D2.visible = false
		if primary == 1:
			Global.mags += 1
			$AnimatedSprite2D.visible = false
		sfx.play()
		picked = true
		$Timer.start()
		
		
		$Label.visible = true


func _on_timer_timeout():
	queue_free()
