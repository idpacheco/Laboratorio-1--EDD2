extends Node2D



func _on_exit_1_body_entered(body: Node2D) -> void:
	if Global.index == 6:
		Global.index = Global.index-2
		SceneTransitions.change_scene_to_file(Global.arbol.raiz.izq.dato["nombre"])
	

func _on_exit_2_body_entered(body: Node2D) -> void:
	if Global.index == 6:
		Global.index = Global.index+1
		SceneTransitions.change_scene_to_file(Global.arbol.raiz.der.dato["nombre"])
