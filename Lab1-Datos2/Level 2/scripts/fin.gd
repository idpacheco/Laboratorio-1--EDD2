extends Control



func _on_continue_pressed() -> void:
	Global.arbol.cambiar_estado(Global.index,true)
	SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])
