extends Area2D
@onready var zip = $Zip
var picked = false
@export var health = 40

func _ready() -> void:
	$AnimatedSprite2D.play(str(health))
	$Label.text = str(health) + "+ Health"

func _on_body_entered(body):
	if body.is_in_group("Player") and Global.health < 100 and picked == false:
		zip.play()
		picked = true
		$Timer.start()
		Global.health += health
		$AnimatedSprite2D.visible = false
		$Label.visible = true


func _on_timer_timeout():
	queue_free()
