extends Control
signal sound_off



func _on_check_button_button_up() -> void:
	emit_signal("sound_off")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main-menu.tscn")
