extends Node2D
@onready var ray_cast_right: RayCast2D = $RayCast_right
@onready var ray_cast_left: RayCast2D = $RayCast_left
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 60
var direction = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		animated_sprite.flip_h = true
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction*SPEED*delta
