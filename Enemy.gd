extends Area2D

var follow_pos:Vector2
var speed:int = 10
var dying:bool = false

func _physics_process(delta):
	if(!dying):
		translate(Vector2(-1 * speed, 0))

func destroy() -> void:
	dying = true
	$Die.play()


func _on_EnemyStraight_body_entered(body):
	if (body.is_in_group("player") and !dying):
		body.destroy()


func _on_Die_finished():
	queue_free()
