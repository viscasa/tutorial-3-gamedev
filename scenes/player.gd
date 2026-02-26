extends CharacterBody2D

@export var gravity = 700
@export var walk_speed = 200
@export var crouch_speed = 100
@export var jump_speed = -300

@onready var anim = $Animation
@onready var normal_collision = $NormalCollision
@onready var crouch_collision = $CrouchCollision

var jump_count = 0
var max_jumps = 2

func _ready():
	crouch_collision.disabled = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += delta * gravity
	else:
		jump_count = 0

	if Input.is_action_just_pressed('ui_up') and jump_count < max_jumps:
		velocity.y = jump_speed
		jump_count += 1

	var is_crouching = Input.is_action_pressed("ui_down") and is_on_floor()
	
	if is_crouching:
		normal_collision.disabled = true
		crouch_collision.disabled = false
	else:
		normal_collision.disabled = false
		crouch_collision.disabled = true

	var current_speed = crouch_speed if is_crouching else walk_speed

	if Input.is_action_pressed("ui_left"):
		velocity.x = -current_speed
		anim.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x = current_speed
		anim.flip_h = false
	else:
		velocity.x = 0

	if is_crouching:
		anim.play("crouch")
	elif not is_on_floor():
		if velocity.y < 0:
			anim.play("jump")
		else:
			anim.play("fall")
	elif velocity.x != 0:
		anim.play("walk")
	else:
		anim.play("idle")

	move_and_slide()
