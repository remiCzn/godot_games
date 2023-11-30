extends StaticBody2D

@export var target_level: Levels.LevelType

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
		get_tree().change_scene_to_file(Levels.LevelDB[target_level])
