extends Node2D

var Stick = preload("res://stick_button.tscn")
var Stone = preload("res://stone_button.tscn")
var Fossil = preload("res://fossil_button.tscn")

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _physics_process(delta):
	$Mouse_area/CollisionShape2D.scale = Vector2(Global.Stick_Stones_magnet_size, Global.Stick_Stones_magnet_size)
	$Mouse_area/CollisionShape2D.global_position = get_global_mouse_position()
	get_node("Stone_panel/Label").set_text("x" + str(Global.stones))
	get_node("Stick_panel/Label").set_text("x" + str(Global.sticks))
	get_node("Fossil_panel/Label").set_text("x" + str(Global.Fossils))
	

func _on_fossil_spawn_timer_timeout():
	if rng.randi_range(0,100) <= 1:
		var fossil = Fossil.instantiate()
		add_child(fossil)
		fossil.global_position = Vector2(rng.randi_range(100,560), rng.randi_range(50,350))
		fossil.rotation = rng.randi_range(0,360)
	$Fossil_spawn_timer.wait_time = 1 * Global.Stick_Stones_spawn_rate
	$Fossil_spawn_timer.start()


	
func _on_stone_spawn_timer_timeout():
	if rng.randi_range(0,100) <= 30:
		var stone = Stone.instantiate()
		add_child(stone)
		stone.global_position = Vector2(rng.randi_range(100,560), rng.randi_range(50,350))
		stone.rotation = rng.randi_range(0,360)
	$Stone_spawn_timer.wait_time = rng.randf_range(0.25,1.5) * Global.Stick_Stones_spawn_rate
	$Stone_spawn_timer.start()

func _on_stick_spawn_timer_timeout():
	if rng.randi_range(0,100) <= 60:
		var stick = Stick.instantiate()
		add_child(stick)
		stick.global_position = Vector2(rng.randi_range(100,560), rng.randi_range(50,350))
		stick.rotation = rng.randi_range(0,360)
	$Stick_spawn_timer.wait_time = rng.randf_range(0.2,1.25) * Global.Stick_Stones_spawn_rate
	$Stick_spawn_timer.start()


func _on_upgrades_button_down():
	$Camera2D.global_position.x = 960


func _on_back_button_down():
	$Camera2D.global_position.x = 320


func _on_hover_mode_button_down():
	Global.Stick_Stones_hover_mode = true

func _on_spawn_rate_button_down():
	if Global.Stick_Stones_spawn_rate >= 0.02:
		Global.Stick_Stones_spawn_rate -= 0.01


func _on_magnet_size_button_down():
	Global.Stick_Stones_magnet_size += .05


func _on_overworld_button_down():
	get_tree().change_scene_to_file("res://Overworld.tscn")





