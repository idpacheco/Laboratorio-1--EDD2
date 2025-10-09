extends Control



func _on_continue_pressed() -> void:
	Global.arbol.raiz.izq.dato["activado"] = true
	SceneTransitions.change_scene_to_file(Global.arbol.raiz.izq.dato["nombre"])
