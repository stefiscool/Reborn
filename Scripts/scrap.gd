extends Area2D
@onready var zip = $Zip
var picked = false
var weight = 40
var itemname = "3423"


	
class ScrapItem:
	var name: String
	var weight: float
	
	func _init(_name: String, _weight: float):
		name = _name
		weight = _weight

# List of scrap items
var scrap_items = [
	ScrapItem.new("Neurogel Fiber", 0.5),
	ScrapItem.new("Plascore Panel", 12.0),
	ScrapItem.new("Ionshard", 0.2),
	ScrapItem.new("Rusted Servo Limb", 18.3),
	ScrapItem.new("Cryosteel Fragment", 9.6),
	ScrapItem.new("Obsidium Core", 25.0),
	ScrapItem.new("Hexplate Scraps", 5.2),
	ScrapItem.new("Arcchip Matrix", 0.1),
	ScrapItem.new("Thermoptic Mesh", 3.7),
	ScrapItem.new("Gravcoil Fragment", 7.4),
	ScrapItem.new("Fluxed Wiring", 2.0),
	ScrapItem.new("Radiant Slag", 14.8)
]

# Adjust this to control spawn chance (between 0.0 and 1.0)
var spawn_chance := 0.8 # 80% chance to spawn an item

func _ready():
	if randf() > spawn_chance:
		queue_free() # No item spawns
		return
	
	var selected_item = get_random_scrap_item()
	weight = selected_item.weight
	weight = round((weight + randf_range(0.1, 2.9)) * 10) / 10.0
	itemname = selected_item.name
	$AnimatedSprite2D.play(itemname)

# Function to get luck-weighted random scrap item
func get_random_scrap_item() -> ScrapItem:
	var luck = clamp(Global.Luck / 10.0, 0.0, 1.0)
	var total_weight = 0.0
	var adjusted_weights = []

	for item in scrap_items:
		var weight_bias = lerp(1.0, item.weight, luck)
		adjusted_weights.append(weight_bias)
		total_weight += weight_bias

	var pick = randf() * total_weight
	var cumulative = 0.0
	
	for i in range(scrap_items.size()):
		cumulative += adjusted_weights[i]
		if pick < cumulative:
			return scrap_items[i]

	return scrap_items[0] # fallback
	


func _on_body_entered(body):
	if body.is_in_group("Player") and picked == false and Global.scrap < Global.maxscrap:
		zip.play()
		picked = true
		$Timer.start()
		Global.scrap += weight
		$Label.text = itemname + " +" + str(weight) + " lbs Scrap"
		$AnimatedSprite2D.visible = false
		$Label.visible = true
	elif body.is_in_group("Player") and picked == false and Global.scrap >= Global.maxscrap:
		$Label.visible = true
		$Label.text = "You cannot carry any more scrap"
		await get_tree().create_timer(1).timeout 
		$Label.visible = false

func _on_timer_timeout():
	queue_free()
