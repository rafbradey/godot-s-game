extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var attacking = false
# Get the gravity from the project settings to be synced with RigidBody nodes.

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#@onready var animated_sprite = $AnimatedSprite2D
@onready var attack_timer = $Timer
@onready var animated_sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#get input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		#Apply Animations
		

	if Input.is_action_pressed("attack"):
		animation_player.play("attack")
	else:
		if is_on_floor():
			if direction == 0:
				animation_player.play("idle")
			else:
				animation_player.play("running")

	##Apply Movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
