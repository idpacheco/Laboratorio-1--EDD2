extends Control

func _on_next_to_indicaciones_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 2/scenes/instrucciones.tscn")
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()


func _on_back_to_inicio_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 2/scenes/inicio.tscn")
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
