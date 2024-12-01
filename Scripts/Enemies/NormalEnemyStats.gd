extends CharacterBody2D

@export var speed = 9000 #speed can change
@export var hp = 100
@export var meleedamage = 20
@export var meleespeed = 500
@export var xp = 10
@export var melee = false
@export var ranged = true
@export var twoweapons = false
var vision = false
var dead = false
var deathplayed = false

signal dead2



@onready var hit3 = $Hit3
@export var player =  Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var collision = $CollisionShape2D

func _ready():
	if ranged == false:
		$RayCast2D/EnemyBullet.queue_free()
	if melee == false:
		$EnemyMelee.queue_free()
func _physics_process(delta: float) -> void:
	if dead == false and vision == true and $NavigationAgent2D.is_target_reachable():
		var dir = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = dir * speed * delta
		move_and_slide()
		if melee == true:
			$EnemyMelee.rotation_degrees += meleespeed * delta

		
	if hp <= 0:
		death()
		


func makepath() -> void:
	if vision == true:
		nav_agent.target_position = player.global_position


func _on_timer_timeout():
	if vision == true and dead == false:
		makepath() 



func _on_sight_body_entered(body):
	if body.name == "Player" and deathplayed == false:	
		vision = true
		$RayCast2D/AnimatedSprite2D.play("run")



func _on_attack_body_entered(body):


		
	if body.name == "Bullet" and dead == false:
		hit3.play()


func death():
	dead = true
	collision.disabled = true
	emit_signal("dead2")
	if deathplayed == false:
		$RayCast2D/AnimatedSprite2D.play("death")
		scale = Vector2(1.1, 1.1)
		Global.xp += xp
		deathplayed = true
		if ranged:
			$RayCast2D/EnemyBullet.queue_free()
		if twoweapons:
			$RayCast2D/EnemyBullet2.queue_free()
	


func _on_sight_body_exited(body):
	if body.name == "Player" and deathplayed == false:	
		vision = false
		$RayCast2D/AnimatedSprite2D.play("idle")





func _on_attack_area_entered(area):
	if area.name == "MeleeHitbox" and dead == false and Global.meleeing == true:
		hit3.play()
		if Global.Class == "Noble" or Global.Class == "Assassin":
			$Cut.play()
		else:
			$Punch.play()

func _on_enemy_melee_body_entered(body):
	if body.name == "Player" and dead == false and melee == true and vision == true:	
		$RayCast2D/AnimatedSprite2D.play("meleeing")
		$EnemyMelee/AudioStreamPlayer2D.play()
		if Global.shields <= 0:
			Global.health -= int(meleedamage/(Global.defense))
			Global.damaged = true

		else:
			Global.shields -= int(meleedamage/(Global.defense))
			Global.damaged = true
