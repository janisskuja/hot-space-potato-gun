extends KinematicBody2D

export var speed:int = 300
var target
var dying:bool = false

# https://godotengine.org/qa/62370/move-a-enemy-to-the-player
func _physics_process(delta):
	var velocity = Vector2.LEFT
	if(target and target.global_position.x < position.x):
		velocity = global_position.direction_to(target.global_position)
	if(!dying):
		move_and_collide(velocity * speed * delta)

func destroy() -> void:
	dying = true
	$Die.play()


func _on_Area2D_body_entered(body):
	if (body.is_in_group("player") and !dying):
		body.destroy()

func _on_Die_finished():
	queue_free()
