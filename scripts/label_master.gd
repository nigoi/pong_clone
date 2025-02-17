extends Node
var player1 = null
var player2 = null
var score = {"player 1": 40, "player 2": 0}

func tennisify(player1_score, player2_score):
	if typeof(score [player1_score]) == TYPE_INT:
		while score [player1_score] < 40:
			if score [player1_score] < 30:
				score [player1_score] += 15
			else:
				score [player1_score] += 10
			return
	# handle win
	if score [player1_score] == 40 and score [player2_score] < 40:
				score [player1_score] = "YOU WIN!"
				get_tree().reload_current_scene()
	# handle duece
	elif score [player1_score] and score [player2_score] == 40:
		score [player1_score] = "Deuce"
		score [player2_score] = "Deuce"
		
	


	
	
	# handle advantage
	#elif score [player1_score] and score [player2_score] == "Deuce":
		#score [player1_score] = "Advantage"
		#score [player2_score] = 40
	# handle game point 
	
	

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
	player1.position = Vector2(get_viewport().size.x / 2 - 50, get_viewport().size.y * 0.10)
	player2.position = Vector2(get_viewport().size.x / 2 + 50, get_viewport().size.y * 0.10)
	player1.text = str(score["player 1"])
	player2.text = str(score["player 2"])
