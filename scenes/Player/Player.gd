extends KinematicBody2D
class_name Player

export (PackedScene) var Bullet

const MAX_SPEED = 120
const ACCELEARTION = 400
const FRICTION = 2000

var health: int = 100
var velocity = Vector2.ZERO

onready var player = $PlayerCollision
onready var health_set = $Health
onready var weapon = $Weapon

func _physics_process(delta):
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_axis("ui_left", "ui_right")
	input_vector.y = Input.get_axis("ui_up", "ui_down")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELEARTION * delta)
		$AnimationPlayer.play("crawl")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		$AnimationPlayer.stop()
		$Legs.frame = 0
	
	var mouse_position = get_global_mouse_position()
	if mouse_position != player.global_position:
		look_at(mouse_position)
	
	velocity = move_and_slide(velocity)

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		weapon.shoot()

func handle_hit():
	health_set.health -= 1
	if health_set.health == 0:
		pass
		#queue_free()
