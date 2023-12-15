extends StaticBody2D

@export var target_level: Levels.LevelType = Levels.LevelType.LVL4

var is_open: bool = false

func open():
	is_open = true
	$AnimatedSprite2D.play("Open")
	$CollisionShape2D.disabled = true
	
func close():
	is_open = false
	$AnimatedSprite2D.play("Close")
	$CollisionShape2D.disabled = false
	


func _on_area_2d_body_entered(body):
	if body.name == 'Player' and target_level != null:
		Levels.call_deferred("go_to_level", target_level)
