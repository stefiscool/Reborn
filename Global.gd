extends Node

var autosave = true
var inventory = ["SCAR", "M1911", "Tactical Vest"]
var Class = "Noble"
var level = 1
var xp = 0
var xpneeded = 20
var weapon = "SCAR"
var secondweapon = "M1911"
var armor = "Tactical Vest"

var skill1 = "Grenade"
var skill2 = "Super Slash"
var skill3 = "Flame Charge"
var skill4 = "Estus Flask"

var meleeing = false

var defense = 1
var defaultdefense = 1
var maxhealth = 100
var health = maxhealth
var mags = 3
var secondary = false
var rateoffire = 0.05
var maxammo = 30
var ammo = maxammo
var damage = 70
var bulletvelocity = 2000
var element = "Kinetic"
var maxshields = 100
var shields = maxshields
var shieldcooldown = 10
var shieldregen = 1
var damaged = false
var speed = 220
var zoom = 1.8
var description = ""

var secondrateoffire = 0.2
var secondmaxammo = 9
var secondammo = secondmaxammo
var secondmags = 2
var seconddamage = 50
var secondbulletvelocity = 2000
var secondelement = "Kinetic"
var secondzoom = 2
var seconddescription = ""
var armordescription = ""

var skill1cool = 0
var skill2cool = 0
var skill3cool = 0
var skill4cool = 0

var flamecharged = false
var arkarmor = false
var indialogue = false
var nearperson = false
var beattutorial = false
var deflecting = false
var frozen = false

var slide = 0

var missionobjectives = 0
var maxmissionobjectives = 1
var mission = 1
var missiondesc = ""
var missionname = ""

func _process(_delta):
	if health > maxhealth:
		health = maxhealth
	if shields > maxshields:
		shields = maxshields
	if shields < 0:
		shields = 0
		
	if flamecharged == true:
		damage = (100 + (level * 10))
		seconddamage = (100 + (level * 10))
	

	if arkarmor:
		defense = 4
	else:
		defense = defaultdefense
		
	if Class == "Noble":
		skill1 = "Grenade"
		skill2 = "Super Slash"
		skill3 = "Flame Charge"
		skill4 = "Thousand Cuts"
	elif Class == "Bastion":
		skill1 = "Seed Grenade"
		skill2 = "Root Rupture"
		skill3 = "Ark Armor"
		skill4 = "Second Wind"
	elif Class == "Assassin":
		skill1 = "Flashbang"
		skill2 = "Electro Dash"
		skill3 = "Overcharge"
		skill4 = "Thunderbolt"
	elif Class == "Scholar":
		skill1 = "Void Grenade"
		skill2 = "Warp Push"
		skill3 = "Void Vision"
		skill4 = "Black Hole"
	
	
	if xp >= xpneeded:
		level += 1
		xp -= xpneeded
		xpneeded = 20 * pow(level, 2)
