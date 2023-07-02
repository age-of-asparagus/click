extends CharacterBody2D

@export var speed := 50

func _ready():
	# set speed in Y direction then rotate in random direction
	velocity = Vector2(speed, 0).rotated(randf() * 2.0 * PI)
	
func _physics_process(delta):
	move_and_slide()


func _on_weapon_detector_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("DEATH!")
	area.get_parent().queue_free()
	queue_free()
		
