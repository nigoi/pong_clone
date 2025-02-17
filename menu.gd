extends Node2D
var play_game = null

func click_start():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_button_pressed() -> void:
	click_start()
	
func _ready() -> void:
	$Button.position = get_viewport().size / 2
