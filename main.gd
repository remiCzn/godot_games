extends Node

func _ready():
	LevelManager.switches.clear()
	LevelManager.switches_id = 0
	LevelManager.conditions_triggered.connect(_on_switches_conditions_triggered)

func _on_switches_conditions_triggered(value: bool):
	if value != $Door.is_open:
		if value == true:
			$Door.open()
		else:
			$Door.close()
