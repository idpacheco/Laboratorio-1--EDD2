extends Control


func _on_play_game_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/level_1_main.tscn")


func _on_back_to_img_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/img.tscn")
