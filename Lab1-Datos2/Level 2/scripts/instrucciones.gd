extends Control


func _on_next_to_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Level 2/scenes/level2_minigame.tscn")


func _on_back_to_aviso_pressed() -> void:
	get_tree().change_scene_to_file("res://Level 2/scenes/Aviso.tscn")
