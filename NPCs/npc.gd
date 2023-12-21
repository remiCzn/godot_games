extends StaticBody2D

const box = preload("res://Mechanics/dialogue/balloon.tscn")

@export var dialog_resource: DialogueResource
@export var dialog_start: String = "start"

func _on_active_trigger():
	var dialog: Node = box.instantiate()
	get_tree().current_scene.add_child(dialog)
	dialog.start(dialog_resource, dialog_start)
