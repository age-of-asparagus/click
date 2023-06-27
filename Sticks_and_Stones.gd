extends Node2D

var Stick = preload("res://stick_button.tscn")
var Stone = preload("res://stone_button.tscn")

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()







func _on_spawn_timer_timeout():
	if rng.randi_range(0,100) <= 60:
		var stick = Stick.instantiate()
		add_child(stick)
		stick.global_position = Vector2(rng.randi_range(25,1127), rng.randi_range(50,598))
		stick.rotation = rng.randi_range(0,360)
	if rng.randi_range(0,100) <= 30:
		var stone = Stone.instantiate()
		add_child(stone)
		stone.global_position = Vector2(rng.randi_range(25,1127), rng.randi_range(50,598))
		stone.rotation = rng.randi_range(0,360)
	
