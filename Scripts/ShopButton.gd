extends Button

@export var itemName = ""
@export var base_cost = 0  # Original cost value
@export var healing = false
@export var hphealed = 0

var cost = 0  # Actual cost after luck adjustment

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Calculate adjusted cost when the button is created
	update_cost()

func _process(_delta: float) -> void:
	if (!Global.shopitems.has(itemName) or Global.inventory.has(itemName)) and healing == false:
		queue_free()
	if !Global.shopitems.has(itemName) and healing == true:
		queue_free()
	text = itemName + " " + str(cost) + " credits" 

func update_cost() -> void:
	# Apply luck discount - at luck 10, price will be 25% of original
	var luck = clamp(Global.Luck, 0, 10)
	var discount_factor = 1.0 - (luck * 0.075)  # 7.5% discount per luck point
	
	# Calculate new cost, ensure it's at least 1 credit
	cost = max(1, int(base_cost * discount_factor))

func _on_pressed() -> void:
	if !Global.inventory.has(itemName) and Global.credits >= cost and healing == false:
		Global.inventory.append(itemName)
		Global.credits = Global.credits - cost
		text = "Item Bought ( ͡° ͜ʖ ͡°)"
		$"../../../../AudioStreamPlayer2D".play()
	elif Global.credits >= cost and healing == true and (Global.health < Global.maxhealth):
		Global.health += hphealed
		Global.credits = Global.credits - cost
		$"../../../../AudioStreamPlayer2D".play()