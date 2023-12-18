extends Node

var idx = 0
var cast_time: float = 0

var max_size = 1080
var life = 100
var max_life = 100

func _ready():
	$Cursor.transform = Transform2D(
		$Cursor.transform.get_rotation(),
		$PlayerCards.get_child(idx).get_marker_position()
	)

func _process(delta):
	if Input.is_action_just_pressed("move_right"):
		place_marker((idx + 1) % 4)
	elif Input.is_action_just_pressed("move_left"):
		place_marker((idx - 1) % 4)
		
	if Input.is_action_pressed("action"):
		cast_time += delta
		var casted = $PlayerCards.get_child(idx).cast(cast_time)
		if casted:
			reset_cast()
			life -= $PlayerCards.get_child(idx).attack
			$ColorRect.size.x = max_size * life / max_life
	else:
		reset_cast()
		
	if Input.is_action_just_pressed("select_1"):
		place_marker(0)
	if Input.is_action_just_pressed("select_2"):
		place_marker(1)
	if Input.is_action_just_pressed("select_3"):
		place_marker(2)
	if Input.is_action_just_pressed("select_4"):
		place_marker(3)
	
func reset_cast():
	cast_time = 0
	$PlayerCards.get_child(idx).reset_cast()
	
func place_marker(new_idx: int):
	reset_cast()
	idx = new_idx
	$Cursor.transform = Transform2D(
		$Cursor.transform.get_rotation(),
		$PlayerCards.get_child(idx).get_marker_position()
	)
