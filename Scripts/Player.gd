extends CharacterBody2D


@onready var gunfire = $Audio/Gunfire
@onready var reload = $Audio/ReloadSFX
@onready var click = $Audio/Click
@onready var switch = $Audio/WeaponSwitch
@onready var hit = $Audio/Hit
@onready var actionable_finder: Area2D = $ActionableFinder
@onready var pause_menu = $PauseMenu



var paused = false
var bullet = preload("res://Scenes/bullet.tscn")
var grenade = preload("res://Scenes/grenade.tscn")
var seedgrenade = preload("res://Scenes/seedgrenade.tscn")
var flashbang = preload("res://Scenes/flashbang.tscn")
var voidgrenade = preload("res://Scenes/voidgrenade.tscn")


var can_fire = true
var speed = Global.speed
var zoom = Global.zoom
var accel = 10500
var fric = 10000
var reloading = false
var overcharged = false
var meleeing_playing = false

var voidvision = false
var hasfrozen = false

var can_skill1 = true
var can_skill2 = true
var can_skill3 = true
var can_skill4 = true

func player_movement(input, delta):
	if Global.indialogue == false and Global.frozen == false:
		if input: velocity = velocity.move_toward(input * speed , delta * accel)
		else: velocity = velocity.move_toward(Vector2(0,0), delta * fric)

func _ready():
	Global.ammo = Global.maxammo
	
	if Global.element == "Laser":
		gunfire = $Audio/Gunshots/Laser
		bullet = preload("res://Scenes/laser.tscn")
	elif Global.element == "Kinetic(AT)":
		gunfire = $Audio/Gunshots/AT
		bullet = preload("res://Scenes/bullet.tscn")
	elif Global.element == "Kinetic(MG)":
		gunfire = $Audio/Gunshots/MG
		bullet = preload("res://Scenes/bullet.tscn")
	elif Global.element == "Kinetic":
		gunfire = $Audio/Gunfire
		bullet = preload("res://Scenes/bullet.tscn")
	elif Global.element == "Kinetic(Sh)":
		gunfire = $Audio/Gunshots/SemAutoShot
		bullet = preload("res://Scenes/shell.tscn")
	elif Global.element == "Kinetic(Su)":
		gunfire = $Audio/Gunshots/Silenced
		bullet = preload("res://Scenes/bullet.tscn")
	elif Global.element == "Kinetic(Sn)":
		gunfire = $Audio/Gunshots/Sniper
		bullet = preload("res://Scenes/bullet.tscn")
	elif Global.element == "Shock":
		gunfire = $Audio/Gunshots/Shock
		bullet = preload("res://Scenes/shock.tscn")
	elif Global.element == "Photon":
		gunfire = $Audio/Gunshots/Photon
		bullet = preload("res://Scenes/photon.tscn")
	elif Global.element == "Void":
		gunfire = $Audio/Gunshots/Void
		bullet = preload("res://Scenes/void.tscn")
	elif Global.element == "Explosive":
		gunfire = $Audio/Gunshots/RPG
		bullet = preload("res://Scenes/rocket.tscn")

		
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
	if paused == false:
		Engine.time_scale = 1
		
func _physics_process(delta):
	
	
	
	
	if Global.meleeing:
		if not meleeing_playing:
			$Audio/Swinging.play()
			meleeing_playing = true
	else:
		if meleeing_playing:
			$Audio/Swinging.stop()
			meleeing_playing = false
			
	
	look_at(get_global_mouse_position())
	


	if Global.semiauto == false:
		if Input.is_action_pressed("fire") and can_fire and Global.ammo > 0 and reloading == false and Global.meleeing == false and Global.indialogue == false and Global.nearperson == false and paused == false:
			var bullet_instance = bullet.instantiate()
			gunfire.play()
			bullet_instance.position = $BulletPoint.get_global_position()
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.apply_impulse(Vector2(Global.bulletvelocity, 0).rotated(global_rotation))
			get_tree().get_root().add_child(bullet_instance)
			Global.ammo -= 1
			can_fire = false
			$Firerate.start()
		elif Input.is_action_pressed("fire") and can_fire and Global.ammo == 0:
			click.play()
			
		if Input.is_action_pressed("reload"):
			$Reload.start()
			reload.play()
			reloading = true
			
	if Global.semiauto == true and Global.element != "Kinetic(Sh)":
		
		if Input.is_action_just_pressed("fire") and can_fire and Global.ammo > 0 and reloading == false and Global.meleeing == false and Global.indialogue == false and Global.nearperson == false and paused == false:
			var bullet_instance = bullet.instantiate()
			gunfire.play()
			bullet_instance.position = $BulletPoint.get_global_position()
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.apply_impulse(Vector2(Global.bulletvelocity, 0).rotated(global_rotation))
			get_tree().get_root().add_child(bullet_instance)
			Global.ammo -= 1
			can_fire = false
			$Firerate.start()
		elif Input.is_action_pressed("fire") and can_fire and Global.ammo == 0:
			click.play()
			

	elif Global.semiauto == true and Global.element == "Kinetic(Sh)":

		if Input.is_action_just_pressed("fire") and can_fire and Global.ammo >= 1 and reloading == false and Global.meleeing == false and Global.indialogue == false and Global.nearperson == false and paused == false:
			for i in range(-1, 4):  # Loop to create 3 bullets with different angles
				var bullet_instance = bullet.instantiate()
				gunfire.play()
				# Offset bullet positions slightly to avoid collision
				var offset = Vector2(0, i * 5).rotated(global_rotation)  # Adjust '10' for spacing
				bullet_instance.position = $BulletPoint.get_global_position() + offset 
				bullet_instance.rotation_degrees = rotation_degrees + (i * 5)  # Spread angle
				bullet_instance.apply_impulse(Vector2(Global.bulletvelocity, 0).rotated(global_rotation + deg_to_rad(i * 5)))
				get_tree().get_root().add_child(bullet_instance)
			Global.ammo -= 1  # Deduct ammo for 3 bullets
			can_fire = false
			$Firerate.start()
		elif Input.is_action_pressed("fire") and can_fire and Global.ammo < 1:
			click.play()
			
		if Input.is_action_pressed("reload") and Global.mags > 0:
			$Reload.start()
			reload.play()
			reloading = true
			
	
			
	
		
	
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://Scenes/gameover.tscn")
		

	if Input.is_action_just_pressed("talk"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			Global.indialogue = true
			return
	

	var input = Input.get_vector("move_left","move_right","move_up","move_down")
	player_movement(input, delta)
	
	move_and_slide()
		
	
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused= !paused
	
func _on_firerate_timeout():
	can_fire = true

func _on_reload_timeout():
	if Global.ammo == 0:
		Global.ammo = Global.maxammo
	else:
		Global.ammo = Global.maxammo + 1
	reloading = false
	



func _on_hitbox_area_entered(area):
	if area.name == "EnemyBullet":
		hit.play()
		
		
