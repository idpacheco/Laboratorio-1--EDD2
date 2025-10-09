extends Node2D



func _on_exit_1_body_entered(body: Node2D) -> void:
	if Global.index == 7:
		Global.index = Global.index-1
		SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])
	

func _on_exit_2_body_entered(body: Node2D) -> void:
	if Global.index == 7:
		Global.index = Global.index+1
		SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])


func _on_return_body_entered(body: Node2D) -> void:
	SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])
