extends CharacterBody2D

@export var speed = 100

#@onready var sprite: Sprite2D = $Sprite
@export var max_speed: = 500.0

const SPRITE_ROTATION_OFFSET := -0.35  # radians
const ROTATION_INERTIA := 400.0
const DISTANCE_THRESHOLD: = 3.0
const SLOW_RADIUS = 300
const ROTATION_SPEED = 2.0
const MOVEMENT_SPEED = 300.0
var target_global_pos: Vector2 = Vector2.ZERO

var rotation_direction = 0
var movement_direction = 0
var target_rotation = 0
	
func get_input():
	target_rotation = get_global_mouse_position().angle_to_point(position)
	
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	
func _physics_process(delta):
	get_input()
#	rotation = lerp_angle(rotation, target_rotation, delta)
	rotation = target_rotation

#	if Input.is_action_pressed("click"):
#		target_global_pos = get_global_mouse_position()
#	if global_position.distance_to(target_global_pos) < DISTANCE_THRESHOLD:
#		set_physics_process(false)
#
#	velocity = Steering.arrive_to(
#		velocity,
#		global_position,
#		target_global_pos,
#		max_speed,
#		SLOW_RADIUS
#	)
#
	move_and_slide()
#	sprite.rotation = velocity.angle() + SPRITE_ROTATION_OFFSET


func _on_clicker_detector_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Clicker!")
	get_tree().change_scene_to_file("res://sticks_and_stones.tscn")
