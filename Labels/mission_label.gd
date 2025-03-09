extends Label

func _process(_delta):
	var mission_texts = {
		0: "",
		1: "Find a spaceship",
		2: "Infiltrate the bandit camp and recover the stolen technology (%s/%s)",
		3: "Retrieve vital intel from the city's central building (%s/%s)",
		4: "Survive the harsh tundra and recover the 3 ark energy cores (%s/%s)",
		5: "Unearth the hidden base and plant the bomb on the enemy bioweapon stash (%s/%s)",
		6: "Break through the defenses and dismantle the drone army",
		7: "Rescue captive scientists and disrupt smuggler operations (%s/%s)",
		8: "Investigate the secret underwater lab and recover the prototype",
		9: "Recover encrypted data and uncover the bandits' future plans",
		10: "Disable the launch systems in the lunar colony (%s/%s)"
	}
	
	if Global.missionobjectives >= Global.maxmissionobjectives and Global.mission > 1:
		text = "Return to the ship"
	elif Global.mission in mission_texts:
		if "%s" in mission_texts[Global.mission]:
			text = mission_texts[Global.mission] % [Global.missionobjectives, Global.maxmissionobjectives]
		else:
			text = mission_texts[Global.mission]
