extends KinematicBody2D

var velocity = Vector2.ZERO
export var speed:int = 500
signal shoot(pos)
var can_shoot:bool = false
var upper_turret = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input() -> Vector2:
	var input_result:Vector2 = Vector2.ZERO
	if (Input.is_action_pressed("ui_up")):
		input_result.y -= 1
	if (Input.is_action_pressed("ui_down")):
		input_result.y += 1
	if (Input.is_action_pressed("ui_left")):
		input_result.x -= 1
	if (Input.is_action_pressed("ui_right")):
		input_result.x += 1
	if (Input.is_action_pressed("ui_select") and can_shoot):
		can_shoot = false
		upper_turret = !upper_turret
		var turret_pos:Vector2
		$Shoot.play()
		if (upper_turret):
			turret_pos = $UpperTurret.global_position
			$AnimationPlayer.play("up")
		else:
			turret_pos = $LowerTurret.global_position
			$AnimationPlayer.play("down")

		emit_signal("shoot", turret_pos)
	return input_result;

func _physics_process(delta):
	velocity = get_input().normalized() * speed
	move_and_slide(velocity)

func _on_ReloadTimer_timeout():
	can_shoot = true

func destroy():
	can_shoot = false
	$ReloadTimer.stop()
	$Dead.play()
	

func _on_Dead_finished():
	queue_free()
	get_tree().change_scene("res://MainMenu.tscn")
