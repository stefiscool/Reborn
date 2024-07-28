extends VBoxContainer


func _process(_delta):
	
	$Skill1.text = str(Global.skill1) + " (Z)" + str(Global.skill1cool)
	$Skill2.text = str(Global.skill2) + " (X)" + str(Global.skill2cool)
	$Skill3.text = str(Global.skill3) + " (C)" + str(Global.skill3cool)
	$Skill4.text = str(Global.skill4) + " (V)" + str(Global.skill4cool)
