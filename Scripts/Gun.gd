extends AnimatedSprite2D

var weapon_animations = {
	"The Troubleshooter": "The Troubleshooter",
	"AK-47": "AK-47",
	"G36": "G36",
	"FN FAL": "FN FAL",
	"P90": "P90",
	"SCAR": "SCAR"
	
}

var secondary_animations = {
	"M1911": "M1911",
	"Glock 18": "Glock 18",
	"Deagle": "Deagle"
}

func _process(_delta):
	if not Global.secondary:
		if Global.weapon in weapon_animations:
			play(weapon_animations[Global.weapon])
	else:
		if Global.secondweapon in secondary_animations:
			play(secondary_animations[Global.secondweapon])
