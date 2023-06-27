extends Button

var acceleration = 0

func _on_disappear_timer_timeout():
	queue_free()


func _on_button_down():
	disabled = true
	$AnimationPlayer.play("size")
	
