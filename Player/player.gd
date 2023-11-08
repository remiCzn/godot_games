extends RigidBody2D

@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		
	linear_velocity = velocity.normalized() * speed
	
	
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
