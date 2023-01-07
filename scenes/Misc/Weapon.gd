extends Node2D
class_name Weapon

export (PackedScene) var Bullet

onready var gun_end = $GunEnd
onready var gun_position = $GunDirection
onready var shoot_cooldown = $Cooldown

func shoot():
	if shoot_cooldown.is_stopped() and Bullet != null:
		var bullet_instance = Bullet.instance()
		var direction = (gun_position.global_position - gun_end.global_position).normalized()
		GlobalSignals.emit_signal("bullet_fired", bullet_instance, gun_end.global_position, direction)
		shoot_cooldown.start()