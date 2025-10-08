extends Control

func _on_next_to_indicaciones_pressed() -> void:
	get_tree().change_scene_to_file("res://Level 2/scenes/instrucciones.tscn")


func _on_back_to_inicio_pressed() -> void:
	get_tree().change_scene_to_file("res://Level 2/scenes/inicio.tscn")
