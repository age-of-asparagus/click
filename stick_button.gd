extends Sprite2D

var clicked = false
var speed = 3
var stick_label_position

func _ready():
	$Stick_button.size *= get_parent(). magnet_size
	$Stick_button.position *= get_parent(). magnet_size

func _physics_process(delta):
	if clicked == true:
		if speed <= 12:
			speed *= 1.05
		global_position += Vector2(stick_label_position - global_position).normalized() * speed
		if get_parent().get_node("Stick_panel/TextureRect").global_position.distance_to(global_position) <= 70:
			Global.sticks += 1
			queue_free()

func _on_disappear_timer_timeout():
	if clicked == false:
		queue_free()


func _on_stick_button_button_down():
	if get_parent().hover_mode == false:
		stick_label_position = get_parent().get_node("Stick_panel/TextureRect").global_position
		clicked = true
		$Stick_button.visible = false
		$Stick_button.disabled = true
		$AnimationPlayer.play("size")


func _on_stick_button_mouse_entered():
	if get_parent().hover_mode == true:
		stick_label_position = get_parent().get_node("Stick_panel/TextureRect").global_position
		clicked = true
		$Stick_button.visible = false
		$Stick_button.disabled = true
		$AnimationPlayer.play("size")
	
	
