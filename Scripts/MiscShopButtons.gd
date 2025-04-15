extends Button

@export var itemName = ""
@export var base_cost = 0  # Original cost value
@export var isScrap = false
@export var scrap = 0


var cost = 0  # Actual cost after luck adjustment

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Calculate adjusted cost when the button is created
	update_cost()
	if itemName == "+1 Max Primary Mag":
		cost = int(cost + Global.maxprimarymags*400)
	if itemName == "+1 Max Secondary Mag":
		cost = int(cost + Global.maxsecondarymags*400)
	if itemName == "+5 Max Scrap Capacity":
		cost = int(cost + Global.maxscrap*2)

func _process(_delta: float) -> void:

	if !Global.shopitems.has(itemName):
		visible = false
	else:
		visible = true
	text = itemName + " (" + str(cost) + " $R)" 
	
	
	
		
func update_cost() -> void:
	# Apply luck discount - at luck 10, price will be 25% of original
	var luck = clamp(Global.Speech, 0, 10)
	var discount_factor = 1.0 - (luck * 0.075)  # 7.5% discount per luck point
	
	# Calculate new cost, ensure it's at least 1 credit
	cost = max(1, int(base_cost * discount_factor))

func _on_pressed() -> void:

	if Global.credits >= cost and itemName == "+1 Max Primary Mag":
		Global.maxprimarymags += 1
		cost = int(cost + Global.maxprimarymags*400)
		Global.credits = Global.credits - cost
		$"../../../../AudioStreamPlayer2D".play()
	if Global.credits >= cost and itemName == "+1 Max Secondary Mag":
		Global.maxprimarymags += 1
		cost = int(cost + Global.maxsecondarymags*400)
		Global.credits = Global.credits - cost
		$"../../../../AudioStreamPlayer2D".play()
	if Global.credits >= cost and itemName == "+5 Max Scrap Capacity":
		Global.maxprimarymags += 1
		cost = int(cost + Global.maxscrap*2)
		Global.credits = Global.credits - cost
		$"../../../../AudioStreamPlayer2D".play()
	if isScrap == true and Global.scrap < Global.maxscrap and Global.credits >= cost:
		Global.scrap += scrap
		Global.credits = Global.credits - cost
		$"../../../../AudioStreamPlayer2D".play()
