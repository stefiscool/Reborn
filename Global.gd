extends Node

var autosave = true
var inventory = ["SCAR", "M1911", "Tactical Vest"]

var level = 1
var xp = 0
var xpneeded = 20
var weapon = "SCAR"
var secondweapon = "M1911"
var armor = "Tactical Vest"
var semiauto = true

var skill1 = "Grenade"
var skill2 = "Super Slash"
var skill3 = "Flame Charge"
var skill4 = "Estus Flask"

var meleeing = false

var defense = 1
var defaultdefense = 1
var maxhealth = 100
var health = maxhealth

var secondary = false
var rateoffire = 0.05
var maxammo = 30
var ammo = maxammo
var damage = 70
var bulletvelocity = 2000
var element = "Kinetic"
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
	
