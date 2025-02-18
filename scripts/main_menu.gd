extends Control
var audio_player = null
var audio_player2 = null

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_start_mouse_entered() -> void:
	play_sound("res://sound/18782.mp3", audio_player)
	
func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/sub_menu.tscn")

func _on_options_mouse_entered() -> void:
	play_sound("res://sound/18782.mp3", audio_player)
	
func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_quit_mouse_entered() -> void:
	play_sound("res://sound/18782.mp3", audio_player)

func play_sound(sound_path, audio_player):
	var sound = load(sound_path)
	audio_player.stream = sound
	audio_player.play()
	
func music_off():
	audio_player2.playing = false
	audio_player2.autoplay = false
	print("music off")
	
func _ready() -> void:
	audio_player = $AudioStreamPlayer2D
	audio_player2 = $AudioStreamPlayer2D2
