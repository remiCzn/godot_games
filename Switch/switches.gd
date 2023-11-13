extends Node

func _ready():
	var a = get_children().map(func(x): return x.state)
	print(a)

func check_all_conditions():
	var switches = get_children()
	if switches.filter(func(x): return x.state == 1).size() == switches.size():
		print("DOOR OPEN")
	else:
		print("DOOR CLOSED")
