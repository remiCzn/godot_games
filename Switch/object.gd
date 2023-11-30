extends StaticBody2D

var state := 0
var is_trigger := false

const Colors := [
	{
		"name": "red",
		"color": "#ff0000c8"
	},
	{
		"name": "green",
		"color": "#00ff00c8"
	}
]

func _ready():
	change_to_color(state)
	is_trigger = false

func _process(delta):
	if Input.is_action_just_pressed("action") and is_trigger == true:
		active_switch()
		
func active_switch():
	state = (state + 1) % Colors.size()
	change_to_color(state)
	get_parent().check_all_conditions()	

func change_to_color(color_id: int):
	$Sprite2D.modulate = Colors[color_id].color
	$PointLight2D.color = Colors[color_id].color
	
func _on_zone_body_entered(body):
	if body.name == "Player":
		is_trigger = true


func _on_zone_body_exited(body):
	if body.name == "Player":
		is_trigger = false
