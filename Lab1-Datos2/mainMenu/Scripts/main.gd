extends Control

	
func _on_play_button_pressed() -> void:

	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
	Global.index = 7
	SceneTransitions.change_scene_to_file(Global.arbol.raiz.dato["nombre"])
	pass # Replace with function body.


func _on_settings_button_pressed() -> void:
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
	SceneTransitions.change_scene_to_file("res://mainMenu/Scenes/Config.tscn")
	pass # Replace with function body.
