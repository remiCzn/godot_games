extends Node

func _ready():
	LevelManager.clear_switches()
	LevelManager.switches_id = 0
	LevelManager.conditions_triggered.connect(condition_triggered)
	
	for x in get_tree().get_nodes_in_group("switches"):
		x.id = LevelManager.add_switch(x.state)

func condition_triggered(value: bool):
	if value != $Door.is_open:
		if value == true:
			$Door.open()
		else:
			$Door.close()
