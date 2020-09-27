extends Node

var level:int = 1
var high_score:int = 0
var score:int = 0

func reset_level() -> void:
	level = 1
	score = 0

func _process(delta):
	if (score > high_score):
		high_score = score
