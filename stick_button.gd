extends Button



func _on_disappear_timer_timeout():
	queue_free()


func _on_button_down():
	Global.sticks += 1
	queue_free()
