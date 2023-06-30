extends Sprite2D

var clicked = false
var speed = 3
var stone_label_position

func _ready():
	$Stone_button.size *= get_parent(). magnet_size
	$Stone_button.position *= get_parent(). magnet_size

func _physics_process(delta):
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
	if get_parent().hover_mode == false:
		stone_label_position = get_parent().get_node("Stone_panel/TextureRect").global_position
		clicked = true
		$Stone_button.disabled = true
		$Stone_button.visible = false
		$AnimationPlayer.play("size")


func _on_stone_button_mouse_entered():
	if get_parent().hover_mode == true:
		stone_label_position = get_parent().get_node("Stone_panel/TextureRect").global_position
		clicked = true
		$Stone_button.disabled = true
		$Stone_button.visible = false
		$AnimationPlayer.play("size")

