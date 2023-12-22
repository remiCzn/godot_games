extends CharacterBody2D

@export var speed = 400
@export var camera : Camera2D

@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var directionMarker: Marker2D = $Direction
@onready var actionableFinder: Area2D = $Direction/ActionableFinder

var input_velocity: Vector2 = Vector2.ZERO
	
func _unhandled_input(_event: InputEvent) -> void: 
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionableFinder.get_overlapping_areas().filter(func(x): return x.name == "Actionable")
		if actionables.size() > 0:
			actionables[0].action()
			input_velocity = Vector2.ZERO
			return
	
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
			animatedSprite.play("right")
			directionMarker.rotation = -90
		elif velocity.x < 0:
			animatedSprite.play("left")
			directionMarker.rotation = 90
		elif velocity.y < 0:
			animatedSprite.play("up")
			directionMarker.rotation = 180
		elif velocity.y > 0:
			animatedSprite.play("down")
			directionMarker.rotation = 0
	else:
		animatedSprite.stop()
		animatedSprite.frame = 1
		
func _process(_delta):
	if camera != null:
		camera.global_position = position
