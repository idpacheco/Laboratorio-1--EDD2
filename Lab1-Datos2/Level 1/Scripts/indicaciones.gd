extends Control


func _on_next_to_imag_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/img.tscn")


func _on_back_to_aviso_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/aviso_level_1.tscn")
