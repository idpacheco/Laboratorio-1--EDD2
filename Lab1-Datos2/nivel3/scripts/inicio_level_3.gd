extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://nivel3/scenes/MemoryGame.tscn")
