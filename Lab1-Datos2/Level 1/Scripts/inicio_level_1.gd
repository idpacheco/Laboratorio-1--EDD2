extends Control


func _on_play_button_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/level_1_main.tscn")


func _on_instrucciones_button_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/aviso_level_1.tscn")
