extends StaticBody2D

var state := 0

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

func _process(delta):
	if Input.is_action_just_pressed("action"):
		$Zone.action()
		
func _on_zone_active_switch():
	state = (state + 1) % Colors.size()
	change_to_color(state)
	get_parent().check_all_conditions()	

func change_to_color(color_id: int):
	$Sprite2D.modulate = Colors[color_id].color
	$PointLight2D.color = Colors[color_id].color
	
