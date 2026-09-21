extends CharacterBody2D


const SPEED = 500.0
# Negative number = up/higher
const JUMP_VELOCITY = -800.0

@onready var sprite: Sprite2D = $Sprite2D
@onready var base_scale := sprite.scale

func squash():
	var tween = create_tween()
	tween.tween_property(sprite, "scale", base_scale * Vector2(1.2, 0.8), 0.08) # wider, flatter
	tween.tween_property(sprite, "scale", base_scale, 0.12)  


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		squash()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
