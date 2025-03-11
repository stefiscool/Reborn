extends VBoxContainer

func _ready() -> void:
	if Global.Class == "Noble":
		$Skill1/ColorRect2.color = "orange"
		$Skill2/ColorRect3.color = "orange"
		$Skill3/ColorRect4.color = "orange"
		$Skill4/ColorRect5.color = "orange"
	elif Global.Class == "Bastion":
		$Skill1/ColorRect2.color = "cyan"
		$Skill2/ColorRect3.color = "cyan"
		$Skill3/ColorRect4.color = "cyan"
		$Skill4/ColorRect5.color = "cyan"
	elif Global.Class == "Assassin":
		$Skill1/ColorRect2.color = "yellow"
		$Skill2/ColorRect3.color = "yellow"
		$Skill3/ColorRect4.color = "yellow"
		$Skill4/ColorRect5.color = "yellow"
	elif Global.Class == "Scholar":
		$Skill1/ColorRect2.color = "purple"
		$Skill2/ColorRect3.color = "purple"
		$Skill3/ColorRect4.color = "purple"
		$Skill4/ColorRect5.color = "purple"
		
func _process(_delta):
	
	$Skill1.text = str(Global.skill1) + " (Space) "
	$Skill1/ColorRect2.scale.x = (10.0 - float(Global.skill1cool))/10.0
	$Skill2.text = str(Global.skill2) + " (Shift) "
	$Skill2/ColorRect3.scale.x = (15.0 - float(Global.skill2cool))/15.0
	$Skill3.text = str(Global.skill3) + " (Alt) "
	$Skill3/ColorRect4.scale.x = (30.0 - float(Global.skill3cool))/30.0
	$Skill4.text = str(Global.skill4) + " (Ctrl) "
	$Skill4/ColorRect5.scale.x = (60.0 - float(Global.skill4cool))/60.0
