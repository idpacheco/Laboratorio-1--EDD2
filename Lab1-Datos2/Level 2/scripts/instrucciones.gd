extends Control


func _on_next_to_game_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 2/scenes/level2_minigame.tscn")
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()

func _on_back_to_aviso_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Level 2/scenes/Aviso.tscn")
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
