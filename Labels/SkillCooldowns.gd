extends Node2D

@onready var player = get_node("..")


func _process(_delta):
	if player.can_skill1 == false:
		Global.skill1cool = int($SkillCooldown1.time_left)
	else:
		Global.skill1cool = 0
	
	if player.can_skill2 == false:
		Global.skill2cool = int($SkillCooldown2.time_left)
	else:
		Global.skill2cool = 0
	
	if player.can_skill3 == false:
		Global.skill3cool = int($SkillCooldown3.time_left)
	else:
		Global.skill3cool = 0
		
		
