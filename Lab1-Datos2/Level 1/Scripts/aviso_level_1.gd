extends Control


func _on_next_to_guia_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/indicaciones.tscn")


func _on_back_to_inicio_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/inicio_level_1.tscn")
