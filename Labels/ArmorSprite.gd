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
	if Global.armor == "Bandit Light Armor":
		play("Bandit Light Armor")
	if Global.armor == "Bandit Medium Armor":
		play("Bandit Medium Armor")
	if Global.armor == "Bandit Heavy Armor":
		play("Bandit Heavy Armor")
	if Global.armor == "Shock Robe":
		play("Shock Robe")
	if Global.armor == "Void Robe":
		play("Void Robe")
	if Global.armor == "Marine Armor":
		play("Marine Armor")
	if Global.armor == "Arctic Soldier Armor":
		play("Arctic Soldier Armor")
	if Global.armor == "Reborn Squire Armor":
		play("Reborn Squire Armor")
	if Global.armor == "Reborn Knight Armor":
		play("Reborn Knight Armor")
