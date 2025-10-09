extends Control


func _on_next_to_logro_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/objetivo.tscn")


func _on_back_to_indicaciones_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/indicaciones.tscn")
