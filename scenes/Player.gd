extends Area2D

class_name PlayerCharacter

export var speed_multiplier: int = 1
export var projectile: PackedScene
#@onready var spawn_point: Marker2D = $SpawnPoint
const MOVE_SPEED: float = 500.0

func _physics_process(_delta: float) -> void:
	move()
	look_at(get_global_mouse_position())
#	if Input.is_action_just_pressed("shoot"): shoot()

func move() -> void:
	var velocity = Vector2.ZERO 
	var movement: Vector2 = Vector2.ZERO #(0,0)
	if Input.is_action_pressed("ui_left"): movement.x -= 1.0
	if Input.is_action_pressed("ui_right"): movement.x += 1.0
	if Input.is_action_pressed("ui_up"): movement.y -= 1.0
	if Input.is_action_pressed("ui_down"): movement.y += 1.0
	velocity = movement * (MOVE_SPEED * speed_multiplier)
#	move_and_slide()

#func shoot() -> void:
#	var inst: Projectile = projectile.instantiate()
#	inst.spawned_from = self
#	owner.add_child(inst)
#	inst.transform = spawn_point.global_transform
