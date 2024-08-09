extends AnimatedSprite2D

func _process(_delta):
	if Global.armor == "Tactical Vest":
		play("Tactical Vest")
	if Global.armor == "Mercenary Armor":
		play("Mercenary Armor")
	if Global.armor == "Infantry Armor":
		play("Infantry Armor")
	if Global.armor == "Navy Armor":
		play("Navy Armor")
	if Global.armor == "Cyber Armor":
		play("Cyber Armor")
