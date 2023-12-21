extends Area2D

var is_trigger: bool = false

signal active_trigger

func _process(_delta):
	if Input.is_action_just_pressed("action") and is_trigger == true:
		active_trigger.emit()

func _on_body_entered(body):
	if body.name == "Player":
		is_trigger = true
	
func _on_body_exited(body):
	if body.name == "Player":
		is_trigger = false
