extends Node

var switches : Array[bool] = []
var switches_id: int = 0

enum LevelType {LVL1, LVL2, LVL3, LVL4}

const LevelDB = {
	LevelType.LVL1 : "res://Levels/lvl1.tscn",
	LevelType.LVL2 : "res://Levels/lvl2.tscn",
	LevelType.LVL3 : "res://Levels/lvl3.tscn",	
	LevelType.LVL4 : "res://Levels/lvl4.tscn"
}

signal conditions_triggered(value: bool)
	
func clear_switches():
	switches.clear()
	switches_id = 0
	
func add_switch(init_value: bool) -> int:
	switches.append(init_value)
	switches_id += 1
	return switches_id - 1
	
func change_value(switch_id: int, value: bool):
	switches[switch_id] = value
	check_all_conditions()
	
func check_all_conditions():
	if switches.filter(func(x): return x == true).size() == switches.size():
		conditions_triggered.emit(true)
	else:
		conditions_triggered.emit(false)

func go_to_level(level: LevelType):
	get_tree().change_scene_to_file(LevelDB[level])

