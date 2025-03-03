extends VBoxContainer


func _process(_delta):
	
	$Skill1.text = str(Global.skill1) + " (Space) " + str(Global.skill1cool)
	$Skill2.text = str(Global.skill2) + " (Shift) " + str(Global.skill2cool)
	$Skill3.text = str(Global.skill3) + " (Alt) " + str(Global.skill3cool)
	$Skill4.text = str(Global.skill4) + " (Ctrl) " + str(Global.skill4cool)
