extends Button

@export var itemName = ""
@export var cost = 0
@export var healing = false
@export var hphealed = 0
# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	if (!Global.shopitems.has(itemName) or Global.inventory.has(itemName)) and healing == false:
		queue_free()
	if !Global.shopitems.has(itemName) and healing == true:
		queue_free()
	text = itemName + " " + str(cost) + " credits" 
	



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
		
