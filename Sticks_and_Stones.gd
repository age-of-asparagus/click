extends Node2D

var Stick = preload("res://stick_button.tscn")
var Stone = preload("res://stone_button.tscn")

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()



func _on_stone_spawn_timer_timeout():
	if rng.randi_range(0,100) <= 30:
		var stone = Stone.instantiate()
		add_child(stone)
		stone.global_position = Vector2(rng.randi_range(0,480), rng.randi_range(0,360))
		stone.rotation = rng.randi_range(0,360)
	$Stone_spawn_timer.wait_time = rng.randf_range(0.25,1.5)
	$Stone_spawn_timer.start()

func _on_stick_spawn_timer_timeout():
	if rng.randi_range(0,100) <= 60:
		var stick = Stick.instantiate()
		add_child(stick)
		stick.global_position = Vector2(rng.randi_range(0,480), rng.randi_range(0,360))
		stick.rotation = rng.randi_range(0,360)
	$Stick_spawn_timer.wait_time = rng.randf_range(0.2,1.25)
	$Stick_spawn_timer.start()
