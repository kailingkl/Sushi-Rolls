extends CharacterBody2D

const SPEED = 1000.0
const ACCEL = 6000.0
const FRICTION = 4000.0

const GRAVITY = 3000.0
const JUMP_FORCE = -1500.0
const FALL_MULTIPLIER = 2.5
const JUMP_CUT_MULTIPLIER = 3.0

func _physics_process(delta: float) -> void:
	# Get input direction (-1, 0, or 1)
	var direction := Input.get_axis("ui_left", "ui_right")

	# Horizontal movement with acceleration/deceleration
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCEL * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

	# Jumping
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE

	# Gravity + fall multiplier + jump cut
	if velocity.y > 0: # falling
		velocity.y += GRAVITY * FALL_MULTIPLIER * delta
	elif velocity.y < 0 and not Input.is_action_pressed("ui_accept"): # rising but jump released
		velocity.y += GRAVITY * JUMP_CUT_MULTIPLIER * delta
	else:
		velocity.y += GRAVITY * delta

	move_and_slide()
