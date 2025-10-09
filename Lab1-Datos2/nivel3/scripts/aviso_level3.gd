extends Control




func _on_texture_button_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://nivel3/scenes/help.tscn")
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
