extends CanvasLayer



func _process(delta: float) -> void:
	$VBoxContainer/Label.text = "HP: " + str(Global.shipcurrenthealth) + "/" + str(Global.shiphealth)
	$VBoxContainer/Label2.text = Global.shipweapon
	$VBoxContainer2/Label.text = Global.shipspecial
	$ColorRect4/Label2.text = Global.shipname

	
