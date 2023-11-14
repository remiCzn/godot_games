extends StaticBody2D

var is_open: bool = false

func open():
	is_open = true
	$AnimatedSprite2D.play("Open")
	$CollisionShape2D.disabled = true
	
func close():
	is_open = false
	$AnimatedSprite2D.play("Close")
	$CollisionShape2D.disabled = false
	
