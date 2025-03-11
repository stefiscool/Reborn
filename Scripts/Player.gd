extends CharacterBody2D


@onready var gunfire = $Audio/Gunfire
@onready var secondgunfire = $Audio/SecondGunfire
@onready var reload = $Audio/ReloadSFX
@onready var click = $Audio/Click
@onready var switch = $Audio/WeaponSwitch
@onready var hit = $Audio/Hit
@onready var actionable_finder: Area2D = $ActionableFinder
@onready var pause_menu = $PauseMenu



var paused = false
var bullet = preload("res://Scenes/bullet.tscn")
var secondbullet = preload("res://Scenes/bullet.tscn")
var grenade = preload("res://Scenes/grenade.tscn")
var seedgrenade = preload("res://Scenes/seedgrenade.tscn")
var flashbang = preload("res://Scenes/flashbang.tscn")
var voidgrenade = preload("res://Scenes/voidgrenade.tscn")


var can_fire = true
var speed = Global.speed
var zoom = Global.zoom
var secondzoom = Global.secondzoom
var accel = 10500
var fric = 10000
var reloading = false
var overcharged = false
var meleeing_playing = false
var shields_full_played = false  
var shields_broken_played = false  
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
		secondbullet = preload("res://Scenes/rocket.tscn")
	
	if Global.secondelement == "Laser":
		secondgunfire = $Audio/Gunshots/Laser
		secondbullet = preload("res://Scenes/laser.tscn")
	elif Global.secondelement == "Kinetic(AT)":
		secondgunfire = $Audio/Gunshots/AT
		secondbullet = preload("res://Scenes/bullet.tscn")
	elif Global.secondelement == "Kinetic":
		secondgunfire = $Audio/SecondGunfire
		secondbullet = preload("res://Scenes/bullet.tscn")
	elif Global.secondelement == "Kinetic(Sh)":
		secondgunfire = $Audio/Gunshots/Shotgun
		if Global.secondweapon == "A-70 Shotgun":
			secondgunfire = $Audio/Gunshots/SemAutoShot
		secondbullet = preload("res://Scenes/shell.tscn")
	elif Global.secondelement == "Kinetic(Su)":
		secondgunfire = $Audio/Gunshots/Silenced
		secondbullet = preload("res://Scenes/bullet.tscn")
	elif Global.secondelement == "Kinetic(Sn)":
		secondgunfire = $Audio/Gunshots/Sniper
		secondbullet = preload("res://Scenes/bullet.tscn")
	elif Global.secondelement == "Shock":
		secondgunfire = $Audio/Gunshots/Shock
		secondbullet = preload("res://Scenes/shock.tscn")
	elif Global.secondelement == "Photon":
		secondgunfire = $Audio/Gunshots/Photon
		secondbullet = preload("res://Scenes/photon.tscn")
	elif Global.secondelement == "Void":
		secondgunfire = $Audio/Gunshots/Void
		secondbullet = preload("res://Scenes/void.tscn")
	elif Global.secondelement == "Explosive":
		secondgunfire = $Audio/Gunshots/RPG
		secondbullet = preload("res://Scenes/rocket.tscn")
		
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
	if paused == false:
		Engine.time_scale = 1
		
	if Global.frozen == true and hasfrozen == false:
		hasfrozen = true
		$FreezeTimer.start()
	
	if Global.frozen == true:
		$Ice.visible = true
	else:
		$Ice.visible = false
		
	
		
func _physics_process(delta):
	
	
	
	if Global.secondary == false and voidvision == false:
		$Camera2D.zoom.x = Global.zoom
		$Camera2D.zoom.y = Global.zoom
	elif Global.secondary == true and voidvision == false:
		$Camera2D.zoom.x = Global.secondzoom
		$Camera2D.zoom.y = Global.secondzoom
	else:
		$Camera2D.zoom.x = 0.8
		$Camera2D.zoom.y = 0.8
	if Global.meleeing:
		if not meleeing_playing:
			$Audio/Swinging.play()
			meleeing_playing = true
	else:
		if meleeing_playing:
			$Audio/Swinging.stop()
			meleeing_playing = false
			
	if Global.shields == 0:
		if not shields_broken_played:
			$Audio/ShieldBreak.play()
			shields_broken_played = true
	else:
		shields_broken_played = false
		
	if Global.shields == Global.maxshields:
		if not shields_full_played:
			$Audio/ShieldsFull.play()
			shields_full_played = true
	else:
		shields_full_played = false
			
	look_at(get_global_mouse_position())
	
	
	if Input.is_action_just_pressed("primary") and Global.secondary == true and reloading == false:
		Global.secondary = false
		switch.play()
	if Input.is_action_just_pressed("secondary") and Global.secondary == false and reloading == false:
		Global.secondary = true
		switch.play()
	if Input.is_action_pressed("melee") and paused == false:
		Global.meleeing = true
		$Gun.visible = false
		
	if Input.is_action_just_released("melee"):
		Global.meleeing = false
		$Gun.visible = true
		
	
	

	
	if Global.damaged == true:
		$ShieldCool.start()
		$ShieldCool/ShieldRegen.stop()
		Global.damaged = false
	
	if overcharged == true and speed != 1000:
		speed = 300
		$Skills/ElectricParticles.visible = true
		
	if Global.meleeing == true and Global.flamecharged == true:
		Global.deflecting = true
	else:
		Global.deflecting = false

	if Global.secondary == false:
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
			
		if Input.is_action_pressed("reload") and Global.mags > 0:
			
			$Reload.start()
			reload.play()
			reloading = true
			
	if Global.secondary == true and Global.secondelement != "Kinetic(Sh)":
		
		if Input.is_action_just_pressed("fire") and can_fire and Global.secondammo > 0 and reloading == false and Global.meleeing == false and Global.indialogue == false and Global.nearperson == false and paused == false:
			var bullet_instance = secondbullet.instantiate()
			secondgunfire.play()
			bullet_instance.position = $BulletPoint.get_global_position()
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.apply_impulse(Vector2(Global.secondbulletvelocity, 0).rotated(global_rotation))
			get_tree().get_root().add_child(bullet_instance)
			Global.secondammo -= 1
			can_fire = false
			$Firerate.start()
		elif Input.is_action_pressed("fire") and can_fire and Global.secondammo == 0:
			click.play()
			
		if Input.is_action_pressed("reload") and Global.secondmags > 0:
			
			$Reload.start()
			reload.play()
			reloading = true
			
	elif Global.secondary == true and Global.secondelement == "Kinetic(Sh)":

		if Input.is_action_just_pressed("fire") and can_fire and Global.secondammo >= 1 and reloading == false and Global.meleeing == false and Global.indialogue == false and Global.nearperson == false and paused == false:
			for i in range(-1, 4):  # Loop to create 3 bullets with different angles
				var bullet_instance = secondbullet.instantiate()
				secondgunfire.play()
				# Offset bullet positions slightly to avoid collision
				var offset = Vector2(0, i * 5).rotated(global_rotation)  # Adjust '10' for spacing
				bullet_instance.position = $BulletPoint.get_global_position() + offset 
				bullet_instance.rotation_degrees = rotation_degrees + (i * 5)  # Spread angle
				bullet_instance.apply_impulse(Vector2(Global.secondbulletvelocity, 0).rotated(global_rotation + deg_to_rad(i * 5)))
				get_tree().get_root().add_child(bullet_instance)
			Global.secondammo -= 1  # Deduct ammo for 3 bullets
			can_fire = false
			$Firerate.start()
		elif Input.is_action_pressed("fire") and can_fire and Global.secondammo < 1:
			click.play()
			
		if Input.is_action_pressed("reload") and Global.secondmags > 0:
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
		
	if Global.Class == "Noble" and paused == false:
		if Input.is_action_just_pressed("skill1") and can_skill1:
			var grenade_instance = grenade.instantiate()
			
			grenade_instance.position = $BulletPoint.get_global_position()
			grenade_instance.rotation_degrees = rotation_degrees
			grenade_instance.apply_impulse(Vector2(140, 0).rotated(global_rotation))
			get_tree().get_root().add_child(grenade_instance)
			can_skill1 = false
			$SkillCooldowns/SkillCooldown1.start()
			
		if Input.is_action_just_pressed("skill2") and can_skill2:
			Global.meleeing = true
			$"Skills/Super Slash".scale.x = 20
			$"Skills/Super Slash".scale.y = 20
			$Audio/SuperSlash.play()
			$Skills/SkillTimer.start()
			$"Skills/Super Slash/AnimatedSprite2D".play("default")
			can_skill2 = false
			$SkillCooldowns/SkillCooldown2.start()
			
		if Input.is_action_just_pressed("skill3") and can_skill3:
			$Skills/FlameChargeParticles.visible = true
			$Audio/FlameBuff.play()
			$Skills/BuffTimer.start()
			Global.flamecharged = true
			can_skill3 = false
			$SkillCooldowns/SkillCooldown3.start()
			
		if Input.is_action_just_pressed("skill4") and can_skill4:
			Global.meleeing = true
			$"Skills/Thousand Cuts".scale.x = 40
			$"Skills/Thousand Cuts".scale.y = 40
			$Audio/SuperSlash.play()
			$"Skills/Thousand Cuts/AnimatedSprite2D".play("default")
			$Skills/SkillTimer.start()
			can_skill4 = false
			$SkillCooldowns/SkillCooldown4.start()
	elif Global.Class == "Bastion" and paused == false:
		if Input.is_action_just_pressed("skill1") and can_skill1:
			var seedgrenade_instance = seedgrenade.instantiate()
			
			seedgrenade_instance.position = $BulletPoint.get_global_position()
			seedgrenade_instance.rotation_degrees = rotation_degrees
			seedgrenade_instance.apply_impulse(Vector2(140, 0).rotated(global_rotation))
			get_tree().get_root().add_child(seedgrenade_instance)
			can_skill1 = false
			$SkillCooldowns/SkillCooldown1.start()
		if Input.is_action_just_pressed("skill2") and can_skill2:
			Global.meleeing = true
			$"Skills/Root Rupture".visible = true
			$"Skills/Root Rupture".scale.x = 20
			$"Skills/Root Rupture".scale.y = 10
			$Audio/SuperSlash.play()
			$Skills/SkillTimer.start()
			can_skill2 = false
			$SkillCooldowns/SkillCooldown2.start()
		if Input.is_action_just_pressed("skill3") and can_skill3:
			$"SkillCooldowns/Ark Armor".visible = true
			$Audio/ShieldsFull.play()
			$Skills/BuffTimer.start()
			Global.arkarmor = true
			can_skill3 = false
			$SkillCooldowns/SkillCooldown3.start()
		if Input.is_action_just_pressed("skill4") and can_skill4:
			Global.shields = Global.maxshields
			Global.health += 10 + (Global.Medicine * 5)
			can_skill4 = false
			$SkillCooldowns/SkillCooldown4.start()
			$Audio/SuperSlash.play()
	elif Global.Class == "Assassin" and paused == false:
		if Input.is_action_just_pressed("skill1") and can_skill1:
			var flashbang_instance = flashbang.instantiate()
			
			flashbang_instance.position = $BulletPoint.get_global_position()
			flashbang_instance.rotation_degrees = rotation_degrees
			flashbang_instance.apply_impulse(Vector2(140, 0).rotated(global_rotation))
			get_tree().get_root().add_child(flashbang_instance)
			can_skill1 = false
			$SkillCooldowns/SkillCooldown1.start()
		if Input.is_action_just_pressed("skill2") and can_skill2:
			speed = 1000
			$Audio/SuperSlash.play()
			$Skills/SkillTimer.start()
			$Skills/ElectricParticles.visible = true
			$Skills/ElectroDash/AnimatedSprite2D.play("default")
			can_skill2 = false
			$SkillCooldowns/SkillCooldown2.start()
			$Skills/ElectroDash.scale.x = 7
			$Skills/ElectroDash.scale.y = 7
			Global.meleeing = true
		if Input.is_action_just_pressed("skill3") and can_skill3:
			overcharged = true
			$Skills/BuffTimer.start()
			$Audio/Thunder.play()
			can_skill3 = false
			$SkillCooldowns/SkillCooldown3.start()
		if Input.is_action_just_pressed("skill4") and can_skill4:
			$"Skills/Lightning Bolt".visible = true
			$"Skills/Lightning Bolt".scale.x = 60
			$"Skills/Lightning Bolt".scale.y = 2
			$Skills/SkillTimer.start()
			$Audio/Thunder.play()
			can_skill4 = false
			$SkillCooldowns/SkillCooldown4.start()
	elif Global.Class == "Scholar" and paused == false:
		if Input.is_action_just_pressed("skill1") and can_skill1:
			var voidgrenade_instance = voidgrenade.instantiate()
			voidgrenade_instance.position = $BulletPoint.get_global_position()
			voidgrenade_instance.rotation_degrees = rotation_degrees
			voidgrenade_instance.apply_impulse(Vector2(140, 0).rotated(global_rotation))
			get_tree().get_root().add_child(voidgrenade_instance)
			can_skill1 = false
			$SkillCooldowns/SkillCooldown1.start()
		if Input.is_action_just_pressed("skill2") and can_skill2:
			$Audio/Warp.play()
			$Skills/SkillTimer.start()
			$"Skills/Force Push/AnimatedSprite2D".play("default")
			$"Skills/Force Push".scale.x = 30
			$"Skills/Force Push".scale.y = 30
			$"Skills/Force Push/StaticBody2D/CollisionShape2D".scale.x = 2
			$"Skills/Force Push/StaticBody2D/CollisionShape2D".scale.y = 2
			Global.meleeing = true
			can_skill2 = false
			$SkillCooldowns/SkillCooldown2.start()
		if Input.is_action_just_pressed("skill3") and can_skill3:
			$Audio/Warp.play()
			voidvision = true
			
			$Skills/BuffTimer.start()
			can_skill3 = false
			$SkillCooldowns/SkillCooldown3.start()
		if Input.is_action_just_pressed("skill4") and can_skill4:
			$Audio/Warp.play()
			$Skills/SkillTimer.start()
			$"Skills/Force Push/AnimatedSprite2D".play("default")
			$"Skills/Force Push".scale.x = 150
			$"Skills/Force Push".scale.y = 150
			can_skill4 = false
			$SkillCooldowns/SkillCooldown4.start()
	

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
	if Global.secondary == false:
		Global.mags -= 1
		if Global.ammo == 0:
			Global.ammo = Global.maxammo
		else:
			Global.ammo = Global.maxammo + 1
		reloading = false
	if Global.secondary == true:
		Global.secondmags -= 1
		if Global.secondammo == 0:
			Global.secondammo = Global.secondmaxammo
		else:
			Global.secondammo = Global.secondmaxammo + 1
		reloading = false



func _on_hitbox_area_entered(area):
	if area.name == "EnemyBullet":
		hit.play()
		
		



func _on_skill_cooldown_1_timeout():
	can_skill1 = true
	


func _on_skill_cooldown_2_timeout():
	can_skill2 = true


func _on_skill_cooldown_3_timeout():
	can_skill3 = true


func _on_skill_cooldown_4_timeout():
	can_skill4 = true

func _on_skill_timer_timeout():
	$"Skills/Super Slash".scale.x = 1
	$"Skills/Super Slash".scale.y = 1
	$"Skills/Thousand Cuts".scale.x = 1
	$"Skills/Thousand Cuts".scale.y = 1
	$"Skills/Root Rupture".scale.x = 1
	$"Skills/Root Rupture".scale.y = 1
	$"Skills/Lightning Bolt".scale.x = 1
	$"Skills/Lightning Bolt".scale.y = 1
	$Skills/ElectroDash.scale.x = 1
	$Skills/ElectroDash.scale.y = 1
	$"Skills/Root Rupture".visible = false
	$Skills/ElectricParticles.visible = false
	$"Skills/Lightning Bolt".visible = false
	$"Skills/Force Push".scale.x = 1
	$"Skills/Force Push".scale.y = 1
	$"Skills/Force Push/StaticBody2D/CollisionShape2D".scale.x = 1
	$"Skills/Force Push/StaticBody2D/CollisionShape2D".scale.y = 1
	speed = Global.speed
	
	Global.meleeing = false
	$Gun.visible = true


func _on_buff_timer_timeout():
	Global.flamecharged = false
	Global.arkarmor = false
	$"SkillCooldowns/Ark Armor".visible = false
	$Skills/FlameChargeParticles.visible = false
	overcharged = false
	voidvision = false


func _on_shield_cool_timeout():
	$ShieldCool/ShieldRegen.start()
	if Global.shields < Global.maxshields:
		$Audio/ShieldCharge.play()


func _on_shield_regen_timeout():
	if Global.shields < Global.maxshields and Global.damaged == false:
		Global.shields += Global.shieldregen
		$ShieldCool/ShieldRegen.start()
	


func _on_freeze_timer_timeout():
	Global.frozen = false
	hasfrozen = true
	
