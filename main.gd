extends Node

func _on_switches_conditions_triggered(value: bool):
	if value != $Door.is_open:
		if value == true:
			$Door.open()
		else:
			$Door.close()
