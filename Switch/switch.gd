extends StaticBody2D

@export var state := false
var id : int

func _ready():
	add_to_group("switches")
	update_color()

func update_color():
	var type = ColorData.type.GREEN if state else ColorData.type.RED
	$Sprite2D.modulate = ColorData.data[type].color
	$PointLight2D.color = ColorData.data[type].color
	
func _on_zone_active_trigger():
	state = !state
	update_color()
	LevelManager.change_value(id, state)
