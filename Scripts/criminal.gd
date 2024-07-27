extends CharacterBody2D

const speed = 120 #speed can change
var hp = 100
var vision = false
var dead = false
var deathplayed = false
signal dead2

@onready var blood = $Attack/Blood
@onready var hit = $Hit2
@onready var hit3 = $Hit3
@onready var anim = get_node("RayCast2D/AnimatedSprite2D")
@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var collision = $CollisionShape2D
@onready var bloodtimer = $Attack/Blood/BloodTimer

func _physics_process(_delta: float) -> void:
	if dead == false:
		var dir = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = dir * speed
		move_and_slide()
	if hp <= 0:
		death()
		

func makepath() -> void:
		nav_agent.target_position = player.global_position


func _on_timer_timeout():
	if vision == true and dead == false:
		makepath() 



func _on_sight_body_entered(body):
	if body.name == "Player" and deathplayed == false:	
		vision = true
		anim.play("run")
	else:
		vision = false


func _on_attack_body_entered(body):
	if body.name == "Player" and dead == false:	
		Global.health -= 10
		hit.play()
	if body.name == "Bullet" and dead == false:
		blood.emitting = true
		bloodtimer.start()
		hit3.play()


func death():
	dead = true
	collision.disabled = true
	emit_signal("dead2")
	if deathplayed == false:
		anim.play("death")
		scale = Vector2(1.1, 1.1)
		deathplayed = true
	


func _on_sight_2_body_exited(body):
	if body.name == "Player" and deathplayed == false:	
		vision = false
		anim.play("idle")


func _on_blood_timer_timeout():
	blood.emitting = false
