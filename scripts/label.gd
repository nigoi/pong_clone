extends Label
var score = {"player 1": 0, "player 2": 0}

func _on_player_wall_body_entered(body: Node2D) -> void:
	score ["player 1"] += 1
	text = str(score)

func _on_player_wall_2_body_exited(body: Node2D) -> void:
	score ["player 1"] += 1
	text = str(score)

func _ready() -> void:
	text = str(score)
