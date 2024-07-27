extends Area2D
@onready var sfx = $SFX
var picked = false

func _on_body_entered(body):
	if body.is_in_group("Player") and picked == false:
		sfx.play()
		picked = true
		$Timer.start()
		Global.mags += 1
		$Mag.visible = false


func _on_timer_timeout():
	queue_free()
