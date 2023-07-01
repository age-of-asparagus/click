extends Sprite2D

@onready var mouse = get_parent().get_node("Mouse_area")
var clicked = false
var speed = 3
var stone_label_position


func _physics_process(delta):
	if $Area2D.overlaps_area(mouse) == true:
		if Global.Stick_Stones_hover_mode == true:
			stone_label_position = get_parent().get_node("Stone_panel/TextureRect").global_position
			clicked = true
			$Stone_button.disabled = true
			$Stone_button.visible = false
			$AnimationPlayer.play("size")

	
	if clicked == true:
		if speed <= 12:
			speed *= 1.05
		global_position += Vector2(stone_label_position - global_position).normalized() * speed
		if get_parent().get_node("Stone_panel/TextureRect").global_position.distance_to(global_position) <= 70:
			Global.stones += 1
			queue_free()

func _on_disappear_timer_timeout():
	if clicked == false:
		queue_free()







func _on_stone_button_button_down():
	if Global.Stick_Stones_hover_mode == false:
		stone_label_position = get_parent().get_node("Stone_panel/TextureRect").global_position
		clicked = true
		$Stone_button.disabled = true
		$Stone_button.visible = false
		$AnimationPlayer.play("size")



