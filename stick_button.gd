extends TextureButton

@onready var mouse = get_parent().get_node("Mouse_area")
var clicked = false
var speed = 3
var stick_label_position

func _physics_process(delta):
	if $Area2D.overlaps_area(mouse) == true:
		if Global.Stick_Stones_hover_mode == true:
			stick_label_position = get_parent().get_node("Stick_panel/Marker2D").global_position
			clicked = true
			disabled = true
			$AnimationPlayer.play("size")
	
	if clicked == true:
		if speed <= 12:
			speed *= 1.05
		global_position += Vector2(stick_label_position - global_position).normalized() * speed
		if stick_label_position.distance_to(global_position) <= 50:
			Global.sticks += 1
			queue_free()

func _on_disappear_timer_timeout():
	if clicked == false:
		queue_free()


func _on_button_down():
	if Global.Stick_Stones_hover_mode == false:
		stick_label_position = get_parent().get_node("Stick_panel/Marker2D").global_position
		clicked = true
		disabled = true
		$AnimationPlayer.play("size")
