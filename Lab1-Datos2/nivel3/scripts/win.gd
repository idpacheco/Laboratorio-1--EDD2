extends Control


func _on_next_pressed() -> void:
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
	Global.arbol.cambiar_estado(Global.index,true)
	SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])
