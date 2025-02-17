extends Node
var player1 = null
var player2 = null
var score = {"player 1": 0, "player 2": 30}

func tennisify(player1_score, player2_score):
	if typeof(score [player1_score]) == TYPE_INT:
		while score [player1_score] < 40:
			if score [player1_score] < 30:
				score [player1_score] += 15
				return
			else:
				score [player1_score] < 40
				score [player1_score] += 10
				# handle deuce		
				if score [player1_score] == 40 and score [player2_score] == 40:
					score [player1_score] = "Duece"
					score [player2_score] = "Duece"
				# handle score win
				elif score [player1_score] == 40 and score [player2_score] < 40:
					score [player1_score] = "YOU WIN!"
					score [player2_score] = ""
					get_tree().reload_current_scene()
			return
	#handle advantage + advantage type win
	if typeof(score [player1_score]) == TYPE_STRING:
		if score [player1_score] == "Duece":
			score [player1_score] = "Advantage"
			score [player1_score] = ""
		if score [player1_score] == "Advantage":
			score [player1_score] = "YOU WIN!"
			score [player2_score] = ""
			get_tree().reload_current_scene()


func _on_player_wall_2_body_entered(body: Node2D) -> void:
	tennisify("player 1", "player 2")
	player1.text = str(score ["player 1"])
	player2.text = str(score ["player 2"])
	print(score)

func _on_player_wall_body_entered(body: Node2D) -> void:
	tennisify("player 2", "player 1")
	player1.text = str(score ["player 1"])
	player2.text = str(score ["player 2"])
	print(score)

func _ready() -> void:
	player1 = get_node("player1_label")
	player2 = get_node("player2_label")
	player1.position = Vector2(get_viewport().size.x / 2 - 300, get_viewport().size.y * 0.10)
	player2.position = Vector2(get_viewport().size.x / 2 + 300, get_viewport().size.y * 0.10)
	player1.text = str(score["player 1"])
	player2.text = str(score["player 2"])
