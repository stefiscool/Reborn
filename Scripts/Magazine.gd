extends Area2D
@onready var sfx = $SFX
var picked = false
var primary: int

func _ready() -> void:
	primary = get_primary()
	if primary == 0:
		queue_free()
	if primary == 2:
		$Label.text = "+1 Secondary Mag"
		$AnimatedSprite2D.queue_free()
		$AnimatedSprite2D2.play(Global.secondelement)
	if primary == 1:
		$AnimatedSprite2D2.queue_free()
		$AnimatedSprite2D.play(Global.element)
	

func get_primary() -> int:
	var luck = clamp(Global.Luck, 0, 10)
	
	if luck >= 10:
		return 1 + randi() % 2
	else:
		var skip_zero_chance = luck / 10.0
		
		if randf() < skip_zero_chance:
			return 1 + randi() % 2
		else:
			return randi() % 3

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
