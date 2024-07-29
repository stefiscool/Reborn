extends CharacterBody2D


@onready var gun = get_node("Gun")

@onready var gunfire = $Audio/Gunfire
@onready var secondgunfire = $Audio/SecondGunfire
@onready var reload = $Audio/ReloadSFX
@onready var click = $Audio/Click
@onready var switch = $Audio/WeaponSwitch
@onready var hit = $Audio/Hit
@onready var blood = $Hitbox/Blood
@onready var bloodtimer = $Hitbox/Blood/BloodTimer


@onready var music4 = $Audio/Music4

var bullet = preload("res://Scenes/bullet.tscn")
var grenade = preload("res://Scenes/grenade.tscn")
var seedgrenade = preload("res://Scenes/seedgrenade.tscn")

var bullet_speed = 2000
var can_fire = true
var speed = 220
var accel = 10500
var fric = 10000
var reloading = false

var can_skill1 = true
var can_skill2 = true
var can_skill3 = true
var can_skill4 = true

func player_movement(input, delta):
	if input: velocity = velocity.move_toward(input * speed , delta * accel)
	else: velocity = velocity.move_toward(Vector2(0,0), delta * fric)

func _ready():
	Global.ammo = Global.maxammo
	if Global.level == 1:
		music4.play()
	
		
func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	
	if Input.is_action_just_pressed("primary") and Global.secondary == true and reloading == false:
		Global.secondary = false
		switch.play()
	if Input.is_action_just_pressed("secondary") and Global.secondary == false and reloading == false:
		Global.secondary = true
		switch.play()
	if Input.is_action_pressed("melee"):
		Global.meleeing = true
		
	if Input.is_action_just_released("melee"):
		Global.meleeing = false
		$Gun.visible = true
		
	if Global.meleeing == false:
		$Audio/Swinging.play()
		
	if Global.shields != 0:
		$Audio/ShieldBreak.play()
		
	if Global.shields != 100:
		$Audio/ShieldsFull.play()
	
	if Global.damaged == true:
		$ShieldCool.start()
		$ShieldCool/ShieldRegen.stop()
		Global.damaged = false
	
		
		
		
		
	if Global.secondary == false:
		if Input.is_action_pressed("fire") and can_fire and Global.ammo > 0 and reloading == false and Global.meleeing == false:
			var bullet_instance = bullet.instantiate()
			gunfire.play()
			bullet_instance.position = $BulletPoint.get_global_position()
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated(global_rotation))
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
			
	if Global.secondary == true:	
		if Input.is_action_just_pressed("fire") and can_fire and Global.secondammo > 0 and reloading == false and Global.meleeing == false:
			var bullet_instance = bullet.instantiate()
			secondgunfire.play()
			bullet_instance.position = $BulletPoint.get_global_position()
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated(global_rotation))
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
		
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://Scenes/gameover.tscn")
		
	if Global.secondary == false:
		if Global.weapon == "M4A1":
			gun.play("M4A1")
		if Global.weapon == "AK-47":
			gun.play("AK-47")
		if Global.weapon == "G36":
			gun.play("G36")
		if Global.weapon == "FN FAL":
			gun.play("FN FAL")
		if Global.weapon == "P90":
			gun.play("P90")
		if Global.weapon == "SCAR":
			gun.play("SCAR")
			
	if Global.secondary == true:
		if Global.secondweapon == "M1911":
			gun.play("M1911")
		if Global.secondweapon == "Glock 18":
			gun.play("Glock 18")
		if Global.secondweapon == "Deagle":
			gun.play("Deagle")
			


	var input = Input.get_vector("move_left","move_right","move_up","move_down")
	player_movement(input, delta)
	
	move_and_slide()
		
	if Global.Class == "Noble":
		if Input.is_action_just_pressed("skill1") and can_skill1 and Global.skill1 == "Grenade":
			var grenade_instance = grenade.instantiate()
			
			grenade_instance.position = $BulletPoint.get_global_position()
			grenade_instance.rotation_degrees = rotation_degrees
			grenade_instance.apply_impulse(Vector2(140, 0).rotated(global_rotation))
			get_tree().get_root().add_child(grenade_instance)
			can_skill1 = false
			$SkillCooldowns/SkillCooldown1.start()
			
		if Input.is_action_just_pressed("skill2") and can_skill2 and Global.skill2 == "Super Slash":
			Global.meleeing = true
			$"Skills/Super Slash".scale.x = 20
			$"Skills/Super Slash".scale.y = 20
			$Audio/SuperSlash.play()
			$Skills/SkillTimer.start
			can_skill2 = false
			$SkillCooldowns/SkillCooldown2.start()
			
		if Input.is_action_just_pressed("skill3") and can_skill3 and Global.skill3 == "Flame Charge":
			$Skills/FlameChargeParticles.visible = true
			$Audio/FlameBuff.play()
			$Skills/BuffTimer.start()
			Global.flamecharged = true
			can_skill3 = false
			$SkillCooldowns/SkillCooldown3.start()
			
		if Input.is_action_pressed("skill4") and can_skill4 and Global.skill4 == "Estus Flask":
			if Global.health < 100:
				Global.health += 30
				can_skill4 = false
				$SkillCooldowns/SkillCooldown4.start()
				$Audio/Drink.play()
	elif Global.Class == "Bastion":
		if Input.is_action_just_pressed("skill1") and can_skill1 and Global.skill1 == "Seed Grenade":
			var seedgrenade_instance = seedgrenade.instantiate()
			
			seedgrenade_instance.position = $BulletPoint.get_global_position()
			seedgrenade_instance.rotation_degrees = rotation_degrees
			seedgrenade_instance.apply_impulse(Vector2(140, 0).rotated(global_rotation))
			get_tree().get_root().add_child(seedgrenade_instance)
			can_skill1 = false
			$SkillCooldowns/SkillCooldown1.start()

	
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
		blood.emitting = true
		bloodtimer.start()
		
func _on_blood_timer_timeout():
	blood.emitting = false



func _on_skill_cooldown_1_timeout():
	can_skill1 = true
	


func _on_skill_cooldown_2_timeout():
	can_skill2 = true


func _on_skill_cooldown_3_timeout():
	can_skill3 = true


func _on_skill_timer_timeout():
	$"Skills/Super Slash".scale.x = 1
	$"Skills/Super Slash".scale.y = 1
	Global.meleeing = false
	$Gun.visible = true


func _on_buff_timer_timeout():
	Global.flamecharged = false
	$Skills/FlameChargeParticles.visible = false
	




func _on_shield_cool_timeout():
	$ShieldCool/ShieldRegen.start()
	if Global.shields < 100:
		$Audio/ShieldCharge.play()


func _on_shield_regen_timeout():
	if Global.shields < 100 and Global.damaged == false:
		Global.shields += Global.shieldregen
		$ShieldCool/ShieldRegen.start()
	
