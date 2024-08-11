extends Area2D
@onready var zip = $Zip
var picked = false

func _on_body_entered(body):
	if body.is_in_group("Player") and Global.health < 100 and picked == false:
		zip.play()
		picked = true
		$Timer.start()
		Global.health += 20
		$Med.visible = false
		$Label.visible = true


func _on_timer_timeout():
	queue_free()
