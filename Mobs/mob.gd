extends CharacterBody2D

@export var speed := 50
@export var DeathEffect : PackedScene

func _ready():
	# set speed in Y direction then rotate in random direction
	velocity = Vector2(speed, 0).rotated(randf() * 2.0 * PI)
	
func _physics_process(delta):
	move_and_slide()


func _on_weapon_detector_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	area.queue_free() # delete thing that hit mob
	die()
		
func die():
	print("DEATH!")
	var death_effect = DeathEffect.instantiate()
	get_tree().get_root().add_child(death_effect)
	death_effect.position = global_position
	queue_free()
