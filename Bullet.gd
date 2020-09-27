extends RigidBody2D

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Collider_entered(enemy):
	if (enemy.has_method("destroy")):
		enemy.destroy()
		Global.score += 100
		queue_free()
