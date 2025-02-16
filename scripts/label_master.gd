extends Node
var player1 = null
var player2 = null
var score = {"player 1": 0, "player 2": 0}

func tennisify(key, key2):
	while score.has(key) and score.has(key2) and str(score[key]) != "Game Point" and str(score[key2]) != "Game Point":
		if score[key] < 30:
			score[key] += 15
		elif score[key] == 40 and score[key2] == 40:
			score[key] = "Deuce"
			score[key2] = "Deuce"
			break # stops loop
		elif score[key] == 40 and score[key2] != "40":
			score[key] = "Game Point"
			break # game won

	#handling duece and advantage
	if score[key] == "Deuce" and score[key2] == "Deuce":
		score[key] = "Advantage"
		score[key2] = "40"
	elif score[key] == "Advantage":
		score[key] = "Game Point" 
		get_tree().reload_current_scene() # Player wins after Advantage

func _on_player_wall_2_body_entered(body: Node2D) -> void:
	tennisify("player 1", "player 2")
	player1.text = str(score ["player 1"])

func _on_player_wall_body_entered(body: Node2D) -> void:
	tennisify("player 2", "player 1")
	player1.text = str(score ["player 2"])

func _ready() -> void:
	player1 = get_node("player1_label")
	player2 = get_node("player2_label")
	player1.position = Vector2(get_viewport().size.x / 2 - 50, get_viewport().size.y * 0.10)
	player2.position = Vector2(get_viewport().size.x / 2 + 50, get_viewport().size.y * 0.10)
	player1.text = str(score["player 1"])
	player2.text = str(score["player 2"])
