extends Node
var audio_player = null
var player1 = null
var player2 = null
var score = {"player 1": 40, "player 2": 30}

func tennisify(player1_score, player2_score):
	if typeof(score [player1_score]) == TYPE_INT:
		while score [player1_score] < 50:
			if score [player1_score] < 30:
				score [player1_score] += 15
				return
			else:
				score [player1_score] < 50
				score [player1_score] += 10
				# handle deuce		
				if score [player1_score] == 40 and score [player2_score] == 40:
					score [player1_score] = "Duece"
					score [player2_score] = "Duece"
				# handle score win
				elif score [player1_score] == 50 and score [player2_score] < 40:
					score [player1_score] = "YOU WIN!"
					score [player2_score] = ""
					play_sound("res://sound/gamestart-272829.mp3")
					get_tree().reload_current_scene()
			return
	#handle advantage + advantage type win
	if typeof(score [player1_score]) == TYPE_STRING:
		if score [player1_score] == "Duece":
			score [player1_score] = "Advantage"
			score [player2_score] = ""
			return
		if score [player1_score] == "Advantage":
			score [player1_score] = "YOU WIN!"
			score [player2_score] = ""
			play_sound("res://sound/gamestart-272829.mp3")
			get_tree().reload_current_scene()
		if score [player2_score] == "Advantage":
			score [player1_score] = "Duece"
			score [player2_score] = "Duece"


func _on_player_wall_2_body_entered(body: Node2D) -> void:
	tennisify("player 1", "player 2")
	player1.text = "[wave amp=150 freq=2]" + str(score ["player 1"]) + "[/wave]"
	player2.text = str(score ["player 2"])
	play_sound("res://sound/retro-coin-3-236679.mp3")

func _on_player_wall_body_entered(body: Node2D) -> void:
	tennisify("player 2", "player 1")
	player1.text = str(score ["player 1"])
	player2.text = "[wave amp=150 freq=2]" + str(score ["player 2"]) + "[/wave]"
	play_sound("res://sound/retro-coin-3-236679.mp3")

func play_sound(sound_path):
	var sound = load(sound_path)
	audio_player.stream = sound
	audio_player.play()

func _ready() -> void:
	audio_player = $AudioStreamPlayer
	player1 = get_node("player1_label")
	player2 = get_node("player2_label")
	player1.position = Vector2(200, get_viewport().size.y * 0.10)
	player2.position = Vector2(get_viewport().size.x -200, get_viewport().size.y * 0.10)
	player1.text = str(score["player 1"])
	player2.text = str(score["player 2"])
