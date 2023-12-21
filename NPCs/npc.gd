extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_active_trigger():
	DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "start")
