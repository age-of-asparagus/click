extends CharacterBody2D

@export var speed = 100

@onready var sprite: Sprite2D = $Sprite
@export var max_speed: = 500.0

const DISTANCE_THRESHOLD: = 3.0
const SLOW_RADIUS = 300
var target_global_pos: Vector2 = Vector2.ZERO

func _ready():
	set_physics_process(false)

func _unhandled_input(event):
	if event.is_action_pressed("click"):
		target_global_pos = get_global_mouse_position()
		set_physics_process(true)
	
	
func _physics_process(_delta):
	if Input.is_action_pressed("click"):
		target_global_pos = get_global_mouse_position()
	if global_position.distance_to(target_global_pos) < DISTANCE_THRESHOLD:
		set_physics_process(false)
	
	velocity = Steering.arrive_to(
		velocity,
		global_position,
		target_global_pos,
		max_speed,
		SLOW_RADIUS
	)
	
	move_and_slide()
	sprite.rotation = velocity.angle()
