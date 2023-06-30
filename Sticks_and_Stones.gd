extends Node2D

var Stick = preload("res://stick_button.tscn")
var Stone = preload("res://stone_button.tscn")

var magnet_size = 1
var spawn_rate = 1
var hover_mode = false
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _physics_process(delta):
	get_node("Stone_panel/Label").set_text("x" + str(Global.stones))
	get_node("Stick_panel/Label").set_text("x" + str(Global.sticks))

func _on_stone_spawn_timer_timeout():
	if rng.randi_range(0,100) <= 30:
		var stone = Stone.instantiate()
		add_child(stone)
		stone.global_position = Vector2(rng.randi_range(0,480), rng.randi_range(0,360))
		stone.rotation = rng.randi_range(0,360)
	$Stone_spawn_timer.wait_time = rng.randf_range(0.25,1.5) * spawn_rate
	$Stone_spawn_timer.start()

func _on_stick_spawn_timer_timeout():
	if rng.randi_range(0,100) <= 60:
		var stick = Stick.instantiate()
		add_child(stick)
		stick.global_position = Vector2(rng.randi_range(0,480), rng.randi_range(0,360))
		stick.rotation = rng.randi_range(0,360)
	$Stick_spawn_timer.wait_time = rng.randf_range(0.2,1.25) * spawn_rate
	$Stick_spawn_timer.start()


func _on_upgrades_button_down():
	$Camera2D.global_position.x = 960


func _on_back_button_down():
	$Camera2D.global_position.x = 320


func _on_hover_mode_button_down():
	hover_mode = true


func _on_spawn_rate_button_down():
	spawn_rate -= 0.01


func _on_spawn_rate_2_button_down():
	magnet_size += .05
