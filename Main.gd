extends Node2D

var Bullet:PackedScene
var EnemyStraight:PackedScene
var EnemyFollow:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	Bullet = preload("res://Bullet.tscn")
	EnemyStraight = preload("res://EnemyStraight.tscn")
	EnemyFollow = preload("res://EnemyFollow.tscn")

func _on_Player_shoot(pos):
	var bullet = Bullet.instance()
	bullet.set_position(pos)
	$BulletSponge.add_child(bullet)

func _on_EnemyOutOfBounds_area_entered(area):
	area.queue_free()

func _on_EnemySpawnTimer_timeout():
	# https://godotengine.org/qa/2539/how-would-i-go-about-picking-a-random-number
	for n in range(Global.level):
		var enemyStraight = EnemyStraight.instance()
		enemyStraight.set_position(Vector2(800, rand_range(1, 600)))
		$EnemySponge.add_child(enemyStraight)
		
		var enemyFollow = EnemyFollow.instance()
		enemyFollow.target = $Player
		enemyFollow.set_position(Vector2(800, rand_range(1, 600)))
		$EnemySponge.add_child(enemyFollow)

func _on_LevelIncrease_timeout():
	Global.level += 1
