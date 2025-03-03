extends Node2D
var missions = {
	2: { "name": "Sahara Desert", "desc": "The vast, arid expanse of the Sahara is teeming with bandit strongholds and ancient ruins. The bandits hid a stolen weapons cache here. Your mission is to infiltrate the bandit camp and recover the cache that could shift the balance of power." },
	3: { "name": "London", "desc": "Once a hub of innovation, this sprawling city is now a neon-lit battleground controlled by the bandit invaders. Navigate the chaos to retrieve vital intel hidden in the city's central building. But be careful, a bandit juggernaut guards the building." },
	4: { "name": "Antartica", "desc": "The frozen tundra hides more than ice. The bandits have overrun a research and mining station, guarding valuable energy cores. Survive the harsh environment and bring the bandits to justice. Also, watch out for the enemy snipers." },
	5: { "name": "Amazon Rainforest", "desc": "The overgrown remnants of Earth's most famous rainforest now serve as a haven for bandits. Unearth their hidden base and shut down their illegal bioweapon operations." },
	6: { "name": "Tokyo", "desc": "The once-thriving megacity is now a shadow of its former self, ruled by a cyber-enhanced warlord. Break through his defenses and dismantle his drone army." },
	7: { "name": "Mojave Desert", "desc": "Dust storms and desolation make the Mojave desert a perfect hideout for smugglers. Disrupt their operations and rescue captive scientists forced to work on advanced weaponry." },
	8: { "name": "Mediterranean Isles", "desc": "Idyllic islands turned lawless, these havens are rife with pirate-like bandits. Investigate rumors of a secret underwater lab and recover its experimental prototype." },
	9: { "name": "Appalachian Redoubt", "desc": "Deep in the Appalachian Mountains lies a fortress rigged with traps and guarded by mercenaries. Recover encrypted data containing the bandits' future plans." },
	10: { "name": "Lunar Colony Relic", "desc": "Earth's bandits aren't confined to the planet. A derelict lunar colony now serves as a launching point for their interplanetary raids. Your mission: disable their launch systems and sever their off-world connections." }
}

func _ready():
	Global.health = Global.maxhealth
	Global.shields = Global.maxshields
	Global.meleeing = false
	Global.defense = Global.defaultdefense
	Global.ammo = Global.maxammo
	Global.secondammo = Global.secondmaxammo
	Global.damaged = false
	Global.mags = 3
	Global.secondmags = 2
	Global.missionobjectives = 0 
	Global.beattutorial = true
	
func _process(_delta):
	$MissionLabel.text = Global.missionname
	$MissionText.text = Global.missiondesc
	$Loadout.text = "Current loadout:\n\nLevel "+ str(Global.level)+" "+ str(Global.Class)+"\n"+str(Global.weapon)+"\n"+str(Global.secondweapon)+"\n"+str(Global.armor)
	

	if Global.mission in missions:
		Global.missionname = missions[Global.mission]["name"]
		Global.missiondesc = missions[Global.mission]["desc"]

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/hub.tscn")
	Global.mission = 0


func _on_button_2_pressed():
	Global.mission = 2
	Global.maxmissionobjectives = 1
	$Camera2D.position.x = 1328


func _on_start_button_pressed():
	if Global.mission == 2:
		get_tree().change_scene_to_file("res://Scenes/Levels/deserttown.tscn")
	if Global.mission == 3:
		get_tree().change_scene_to_file("res://Scenes/Levels/london.tscn")
	if Global.mission == 4:
		get_tree().change_scene_to_file("res://Scenes/Levels/antartica.tscn")


func _on_changeloadout_pressed():
	get_tree().change_scene_to_file("res://Scenes/primary_weapons.tscn")
	Global.mission = 0
	


func _on_backtolevels_pressed():
	$Camera2D.position.x = 0


func _on_button_3_pressed():
	Global.mission = 3
	Global.maxmissionobjectives = 1
	$Camera2D.position.x = 1328


func _on_button_4_pressed():
	Global.mission = 4
	Global.maxmissionobjectives = 3
	$Camera2D.position.x = 1328


func _on_button_5_pressed():
	Global.mission = 5
	Global.maxmissionobjectives = 1
	$Camera2D.position.x = 1328


func _on_button_6_pressed():
	Global.mission = 6
	Global.maxmissionobjectives = 1
	$Camera2D.position.x = 1328


func _on_button_7_pressed():
	Global.mission = 7
	Global.maxmissionobjectives = 1
	$Camera2D.position.x = 1328


func _on_button_8_pressed():
	Global.mission = 8
	Global.maxmissionobjectives = 1
	$Camera2D.position.x = 1328


func _on_button_9_pressed():
	Global.mission = 9
	Global.maxmissionobjectives = 1
	$Camera2D.position.x = 1328
