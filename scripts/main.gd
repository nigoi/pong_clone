extends Node2D
var ball = null

func _ready() -> void:
	respawn()

func respawn():
	var ball_preload = preload("res://scenes/ball.tscn")
	ball = ball_preload.instantiate()
	add_child(ball)
	ball.center_ball()
	ball.connect("respawn", self.respawn)
	
	var enemy_paddle = get_node("paddle2")
	if enemy_paddle:
		ball.connect("ball_position", enemy_paddle.follow)
		print("connected")
	else:
		print("failed to connect")
		
func _process(delta: float) -> void:
	if Input.is_action_pressed("ESC"):
		print("ESC")
		get_tree().change_scene_to_file("res://scenes/main-menu.tscn")
