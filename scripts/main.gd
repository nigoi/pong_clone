extends Node2D
var ball = null

func _ready() -> void:
	respawn()

func respawn():
	var ball_preload = preload("res://scenes/ball.tscn")
	ball = ball_preload.instantiate()
	add_child(ball)
	#ball.connect("hit", self.respawn)
