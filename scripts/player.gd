extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $Animated2DSprite


const SPEED = 150.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	# handling players orientation when turning left or right
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction<0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
		if direction==0:
			animated_sprite.play("idle_animation")
		else:
			animated_sprite.play("run_animation")
	else:
		animated_sprite.play("jump_animation")
	
	# adding distance travelled
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
