extends CharacterBody2D

@export var speed = 100

@onready var sprite: Sprite2D = $Sprite
@export var max_speed: = 500.0
var time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func _physics_process(_delta):
	var target_global_pos: Vector2 = get_global_mouse_position()
	
	velocity = Steering.follow(
		velocity,
		global_position,
		target_global_pos,
		max_speed
	)
	
	move_and_slide()
