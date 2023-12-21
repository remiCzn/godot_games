extends CharacterBody2D

@export var speed = 400

var input_velocity: Vector2 = Vector2.ZERO
	
func _unhandled_input(_event: InputEvent) -> void: 
	var x_axis: float = Input.get_axis("ui_left", "ui_right")
	var y_axis: float = Input.get_axis("ui_up", "ui_down")
	
	if x_axis:
		input_velocity = x_axis * Vector2.RIGHT
	elif y_axis:
		input_velocity = y_axis * Vector2.DOWN
	else:
		input_velocity = Vector2.ZERO
		
func _physics_process(_delta: float):
	if input_velocity.length() > 0:
		velocity = input_velocity * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	
	move_and_slide()
	
	if velocity.length() > 0:
		if velocity.x > 0:
			$AnimatedSprite2D.play("right")
		elif velocity.x < 0:
			$AnimatedSprite2D.play("left")
		elif velocity.y < 0:
			$AnimatedSprite2D.play("up")
		elif velocity.y > 0:
			$AnimatedSprite2D.play("down")
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 1
