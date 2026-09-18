extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var airborne = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		if airborne:
			airborne = false
			# squash (think vectors)
			sprite.scale = Vector2(1.3, 0.7)
	else:
		velocity += get_gravity() * delta
		airborne = true

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite.scale = Vector2(0.7, 1.3)
		sprite.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		if direction > 0:
			sprite.flip_h = false
		if direction < 0:
			sprite.flip_h = true
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	# move_toward only returns a number where sprite x to move to, does not assign it
	sprite.scale.x = move_toward(sprite.scale.x, 1, 1.75 * delta)
	sprite.scale.y = move_toward(sprite.scale.y, 1, 1.75 * delta)
	
	if is_on_floor():
		if direction != 0:
			sprite.play("run")
		else:
			sprite.play("idle")
