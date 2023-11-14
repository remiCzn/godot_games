extends Node

signal conditions_triggered(value: bool)

func check_all_conditions():
	var switches = get_children()
	if switches.filter(func(x): return x.state == 1).size() == switches.size():
		conditions_triggered.emit(true)
	else:
		conditions_triggered.emit(false)
