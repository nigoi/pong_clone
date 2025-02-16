extends Label
var score = {"player 1": 0, "player 2": 0}

func _on_player_wall_body_entered(body: Node2D) -> void:
	score ["player 1"] += 1
	text = "Player 1: " + str(score ["player 1"]) + "\nPlayer 2: " + str(score ["player 2"])

func _on_player_wall_2_body_exited(body: Node2D) -> void:
	score ["player 1"] += 1
	text = "Player 1: " + str(score ["player 1"]) + "\nPlayer 2: " + str(score ["player 2"])

func _ready() -> void:
	position = get_viewport().size / 2
	text = "Player 1: " + str(score ["player 1"]) + "\nPlayer 2: " + str(score ["player 2"])
