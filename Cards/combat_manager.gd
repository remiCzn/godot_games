extends Node

func start_combat():
	get_tree().change_scene_to_file("res://Cards/CardBoard.tscn")

func finish_combat():
	LevelManager.go_to_level(LevelManager.LevelType.LVL1)
