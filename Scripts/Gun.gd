extends AnimatedSprite2D

var weapon_animations = {
	"The Troubleshooter": "The Troubleshooter",
	"AK-47": "AK-47",
	"G36": "G36",
	"FN FAL": "FN FAL",
	"P90": "P90",
	"SCAR": "SCAR",
	"ARC-20": "ARC-20",
	"M2000": "M2000",
	"S-TAR": "S-TAR",
	"Headhunter DMR": "Headhunter DMR",
	"Photon SMG": "Photon SMG",
	"A-57": "A-57",
	"Laser SMG": "Laser SMG",
	"XR-50": "XR-50"
}

var secondary_animations = {
	"M1911": "M1911",
	"Glock 18": "Glock 18",
	"Deagle": "Deagle",
	"Trench Shotgun": "Trench Shotgun",
	"Void Supercannon": "Void Supercannon",
	"A-10 Shotgun": "A-10 Shotgun",
	"White Feather Sniper": "White Feather Sniper",
	"Supercharged Crossbow": "Supercharged Crossbow",
	"Shock Cannon": "Shock Cannon",
	"A-70 Shotgun": "A-70 Shotgun",
	"RPG-30": "RPG-30",
	"AT-10 Antitank Rifle": "AT-10 Antitank Rifle",
	"P-10 Pistol": "P-10 Pistol",
	"Laser Pistol": "Laser Pistol",
	"P-20 Supressed Pistol": "P-20 Supressed Pistol",
	"Shock Pistol": "Shock Pistol"
}

func _process(_delta):
	if not Global.secondary:
		if Global.weapon in weapon_animations:
			play(weapon_animations[Global.weapon])
	else:
		if Global.secondweapon in secondary_animations:
			play(secondary_animations[Global.secondweapon])
