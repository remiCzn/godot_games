extends Area2D

signal active_switch

@export var state = 0

func _on_body_entered(body):
	state = 1

func _on_body_exited(body):
	state = 0
	
func action():
	if state == 1:
		active_switch.emit()
