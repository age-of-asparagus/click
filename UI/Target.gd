extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _ready():
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("click"):
		anim_player.play("fade_in")

func _physics_process(delta):
	if Input.is_action_pressed("click"):
		global_position = get_global_mouse_position()


func _on_body_entered(body):
	anim_player.play("fade_out")
