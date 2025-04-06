extends CanvasLayer



# Called when the node enters the scene tree for the first time.

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = Global.shopname
	if Global.inshop == false:
		visible = false
	else:
		visible = true


func _on_button_pressed() -> void:
	Global.inshop = false
	Global.indialogue = false


func _on_button_2_pressed() -> void:
	Global.inshop = false
	Global.indialogue = false
	get_tree().change_scene_to_file("res://Scenes/primary_weapons.tscn")
