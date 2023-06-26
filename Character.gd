extends CharacterBody2D

@export var speed = 100
var time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		
	if velocity != Vector2.ZERO:
		$Sprite.rotation += delta * 10 * sign(velocity.x)
		
		$Sprite.rotation += sin(time * 10 )* 0.1 * velocity.y
		
	velocity = velocity.normalized() * speed

	move_and_slide()
