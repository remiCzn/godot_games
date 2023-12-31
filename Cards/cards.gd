extends Node

@export var skill : Skill

var max_y_size = 282
var max_y_pos = -141
var min_y_pos = 141
var min_y_size = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AttackLabel.text = var_to_str(skill.attack)
	$DefenseLabel.text = var_to_str(skill.defense)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func get_marker_position() -> Vector2:
	return $MarkerPosition.global_position

func cast(time_casted: float) -> bool:
	# Return true is the cast is finished
	if time_casted > skill.cast_time:
		reset_cast()
		return true
	$CastFilter.size.y = min_y_size * (skill.cast_time - time_casted) / skill.cast_time + max_y_size * time_casted / skill.cast_time
	$CastFilter.position.y = min_y_pos * (skill.cast_time - time_casted) / skill.cast_time + max_y_pos * time_casted / skill.cast_time
	return false
	
func reset_cast():
	$CastFilter.size.y = min_y_size
	$CastFilter.position.y = min_y_pos
