extends CharacterBody2D

@export var speed := 200
@export var Ammo : PackedScene

var rotation_direction = 0
var movement_direction = 0
var target_rotation = 0
	
func _physics_process(delta):
	rotation = get_global_mouse_position().angle_to_point(position) - PI
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	move_and_slide()	
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	if Global.stones >= 1:
		var projectile = Ammo.instantiate()
		get_tree().get_root().add_child(projectile)
		
		projectile.global_transform = $Hand.global_transform
		Global.stones -= 1

func _on_clicker_detector_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Clicker!")
	get_tree().change_scene_to_file("res://sticks_and_stones.tscn")
