extends Node

var switches : Array[bool] = []
var switches_id: int = 0

signal conditions_triggered(value: bool)
	
func clear_switches():
	switches.clear()
	switches_id = 0
	
func add_switches(init_value: bool) -> int:
	switches.append(init_value)
	switches_id += 1
	return switches_id - 1
	
func change_value(switch_id: int, value: bool):
	switches[switch_id] = value
	check_all_conditions()
	
func check_all_conditions():
	if switches.filter(func(x): return x.state == true).size() == switches.size():
		conditions_triggered.emit(true)
	else:
		conditions_triggered.emit(false)
	
