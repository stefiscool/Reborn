extends Area2D

@export var shopname = ""
@export var shoplist = []

#func _ready() -> void:
	#Global.shopitems = shoplist
	#Global.shopname = shopname



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Global.shopitems = shoplist
		Global.shopname = shopname
		print("Shop items: ", str(Global.shopitems))
		Global.inshop = true
		Global.indialogue = true
