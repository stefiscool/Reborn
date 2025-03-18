extends Button

@export var shipname = "Starfighter"

func _ready() -> void:
	text = shipname
	#if shipname in Global.inventory:
		#visible = true



func _on_pressed() -> void:
	Global.shipname = shipname
