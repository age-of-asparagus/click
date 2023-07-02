extends Node2D

@export var Mob : PackedScene
var screen_dimensions : Vector2

func _ready():
	screen_dimensions = get_viewport().get_visible_rect().size
	print(screen_dimensions)



func _on_spawn_timer_timeout():
	var mob : CharacterBody2D = Mob.instantiate()
	
	get_tree().get_root().add_child(mob)
		
	mob.position = Vector2(
		randi_range(0, screen_dimensions.x),
		randi_range(0, screen_dimensions.y)
	)
	
