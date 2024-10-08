extends Node2D

const speed = 60
var direction = -1
@onready var ray_cast_right = $rayCastRight
@onready var ray_cast_left = $rayCastLeft
@onready var animated_sprite = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
#Whenever we have speed value, we multiply it by delta
func _process(delta):
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
		
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = false

		
	position.x += direction * speed * delta
