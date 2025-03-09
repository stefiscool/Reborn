extends Timer


var lvlupplayed = false

func _process(delta: float) -> void:
	if Global.levelupplayed == true:
		if lvlupplayed == false:
			$"../Audio/levelup".play()
			start()
			lvlupplayed = true
	


func _on_timeout() -> void:
	Global.levelupplayed = false
	lvlupplayed = false
