extends StaticBody2D

var switch_state := false

func _process(delta):
	if Input.is_action_just_pressed("action"):
		$Zone.action()
		
func _on_zone_active_switch():
	switch_state = !switch_state
	if switch_state == false:
		$Sprite2D.texture.region = Rect2(48,288,16,16)
	else:
		$Sprite2D.texture.region = Rect2(48,304,16,16)
