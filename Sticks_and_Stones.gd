extends Node2D


var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()



func _on_button_button_down():
	if rng.randi_range(0,100) <= 80:
		Global.dirt += 1
		print(Global.dirt)
	if rng.randi_range(0,100) <= 60:
		Global.sticks += 1
		print(Global.sticks)
	if rng.randi_range(0,100) <= 30:
		Global.stones += 1
		print(Global.stones)
