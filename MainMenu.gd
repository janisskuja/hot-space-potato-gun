extends Control

func _process(delta):
	$VBoxContainer/HighScore.text = "High Score: " + String(Global.high_score)
	$VBoxContainer/Score.text = "Your Score: " + String(Global.score)


func _on_StartGame_pressed():
	Global.reset_level()
	#https://godotengine.org/qa/24773/how-to-load-and-change-scenes
	get_tree().change_scene("res://Main.tscn")
