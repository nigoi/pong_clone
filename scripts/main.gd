extends Node2D
var ball = null

func _ready() -> void:
	respawn()

func respawn():
	var ball_preload = preload("res://scenes/ball.tscn")
	ball = ball_preload.instantiate()
	add_child(ball)
	ball.connect("respawn", self.respawn)
	
	var enemy_paddle = get_node("paddle2")
	if enemy_paddle:
		ball.connect("ball_position", enemy_paddle.follow)
		print("connected")
	else:
		print("failed to connect")
