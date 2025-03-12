extends Label

func _process(_delta):
	if Global.secondary == false:
		text =  Global.weapon
	if Global.secondary == true:
		text =  Global.secondweapon
