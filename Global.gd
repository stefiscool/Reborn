extends Node

var Class = "Noble"

var skill1 = "Grenade"
var skill2 = "Super Slash"
var skill3 = "Flame Charge"
var skill4 = "Estus Flask"

var meleeing = false

var level = 1
var health = 100
var mags = 3
var secondary = false
var rateoffire = 0.05
var maxammo = 30
var ammo = maxammo
var damage = 70
var weapon = "SCAR"
var shields = 100

var shieldcooldown = 10
var shieldregen = 1
var damaged = false


var secondrateoffire = 0.2
var secondmaxammo = 9
var secondammo = secondmaxammo
var secondmags = 2
var seconddamage = 50
var secondweapon = "M1911"

var skill1cool = 0
var skill2cool = 0
var skill3cool = 0
var skill4cool = 0

var flamecharged = false



func _process(_delta):
	if health > 100:
		health = 100
	if shields > 100:
		shields = 100
	if shields < 0:
		shields = 0
		
	if flamecharged:
		damage = 140
