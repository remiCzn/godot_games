extends StaticBody2D

@export var state := false
var is_trigger := false
var id : int

func _ready():
	add_to_group("switches")
	update_color()
	
func _process(_delta):
	if Input.is_action_just_pressed("action") and is_trigger == true:
		active_switch()
		
func active_switch():
	state = !state
	update_color()
	LevelManager.change_value(id, state)

func update_color():
	var type = ColorData.type.GREEN if state else ColorData.type.RED
	$Sprite2D.modulate = ColorData.data[type].color
	$PointLight2D.color = ColorData.data[type].color
	
func _on_zone_body_entered(body):
	if body.name == "Player":
		is_trigger = true


func _on_zone_body_exited(body):
	if body.name == "Player":
		is_trigger = false
