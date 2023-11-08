extends StaticBody2D

var state := 0

const Colors := [
	{
		"region": Rect2(48,288,16,16),
		"color": "#ff0000c8"
	},
	{
		"region": Rect2(48,304,16,16),
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
	
		
func change_to_color(color_id: int):
	$Sprite2D.texture.region = Colors[color_id].region
	$PointLight2D.color = Colors[color_id].color
	
