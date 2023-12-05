extends Node

enum LevelType {LVL1, LVL2}

const LevelDB = {
	LevelType.LVL1 : "res://Levels/lvl1.tscn",
	LevelType.LVL2 : "res://Levels/lvl2.tscn"
}

func go_to_level(level: LevelType):
	get_tree().change_scene_to_file(LevelDB[level])

