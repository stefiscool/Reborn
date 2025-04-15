extends Button

@export var itemName = ""
@export var base_cost = 0  # Original cost value
@export var healing = false
@export var hphealed = 0
@export var crafted = false
@export var skill = ""
@export var skilllevel = 0

var cost = 0  # Actual cost after luck adjustment

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Calculate adjusted cost when the button is created
	update_cost()

func _process(_delta: float) -> void:
	if (!Global.shopitems.has(itemName) or Global.inventory.has(itemName)) and healing == false:
		visible = false
	elif !Global.shopitems.has(itemName) and healing == true:
		visible = false
	else:
		visible = true
	if crafted == false and healing == false:
		text = itemName + " (" + str(cost) + " $R)" 
	elif healing == true:
		text =itemName + " (" + str(cost) + " $R) (+" + str(hphealed + 10*Global.Medicine)+ " HP)"
	elif crafted == true:
		text =  itemName + " (" + str(cost) + " lbs scrap) (" + str(skilllevel) +" "+ skill + ")"

func update_cost() -> void:
	if crafted == false:
		var luck = clamp(Global.Speech, 0, 10)
		var discount_factor = 1.0 - (luck * 0.075) 
		cost = max(1, int(base_cost * discount_factor))
	if crafted == true:
		var luck = clamp(Global.Engineering, 0, 10)
		var discount_factor = 1.0 - (luck * 0.075) 
		cost = max(1, int(base_cost * discount_factor))
	
func _on_pressed() -> void:
	if !Global.inventory.has(itemName) and Global.credits >= cost and healing == false and crafted == false:
		Global.inventory.append(itemName)
		Global.credits = Global.credits - cost
		$"../../../../AudioStreamPlayer2D".play()
	elif Global.credits >= cost and healing == true and (Global.health < Global.maxhealth):
		Global.health += hphealed + 10*Global.Medicine
		Global.credits = Global.credits - cost
		$"../../../../AudioStreamPlayer2D".play()
	elif !Global.inventory.has(itemName) and Global.scrap >= cost and crafted == true and Global.get(skill) >= skilllevel:
		Global.inventory.append(itemName)
		Global.scrap = Global.scrap - cost
		$"../../../../AudioStreamPlayer2D".play()
