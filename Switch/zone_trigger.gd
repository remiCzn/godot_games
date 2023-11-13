extends Area2D

signal active_switch

@export var state = 0

func _ready():
	state = 0

func _on_body_entered(body):
	if body.name == "Player":
		state = 1

func _on_body_exited(body):
	if body.name == "Player":	
		state = 0
	
func action():
	if state == 1:
		active_switch.emit()
