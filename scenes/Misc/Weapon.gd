extends Node2D
class_name Weapon

export (PackedScene) var Bullet
export (PackedScene) var BulletCapture

onready var gun_end = $GunEnd
onready var gun_position = $GunDirection
onready var shoot_cooldown = $Cooldown

func shoot(caller):
	if shoot_cooldown.is_stopped() and Bullet != null:
		var bullet_instance = Bullet.instance()
		var direction = (gun_position.global_position - gun_end.global_position).normalized()
		GlobalSignals.emit_signal("bullet_fired", bullet_instance, gun_end.global_position, direction)
		shoot_cooldown.start()
		if "Player" in str(caller):
			$ShootSounds.play()


func capture():
	if shoot_cooldown.is_stopped() and Bullet != null:
		var bulletCapture_instance = BulletCapture.instance()
		var direction = (gun_position.global_position - gun_end.global_position).normalized()
		GlobalSignals.emit_signal("bulletCapture_fired", bulletCapture_instance, gun_end.global_position, direction)
		$CaptureSounds.play()
		shoot_cooldown.start()
