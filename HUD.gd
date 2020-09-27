extends Control

func _process(delta):
	$Score.text = String(Global.score)
