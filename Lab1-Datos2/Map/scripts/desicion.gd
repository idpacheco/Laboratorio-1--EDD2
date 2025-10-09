extends Node2D
@onready var label: Label = $Label
@onready var label_2: Label = $Label2

func _ready() -> void:
	label.text = str(Global.arbol.buscar_subarbol(Global.index).izq.dato["valor"])
	label_2.text = str(Global.arbol.buscar_subarbol(Global.index).der.dato["valor"])

func _on_exit_1_body_entered(body: Node2D) -> void:
	if Global.index == 7:
		Global.index = Global.index-4
	elif Global.index == 3:
		Global.index = Global.index-2
	elif Global.index == 1:
		Global.index = Global.index-1
	elif Global.index == 11:
		Global.index = Global.index-2
	elif Global.index == 9:
		Global.index = Global.index-1
	elif Global.index == 5:
		Global.index = Global.index-1
	elif Global.index == 13:
		Global.index = Global.index-1
	SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])
	
func _on_exit_2_body_entered(body: Node2D) -> void:
	if Global.index == 7:
		Global.index = Global.index+4
	elif Global.index == 3:
		Global.index = Global.index+2
	elif Global.index == 1:
		Global.index = Global.index+1
	elif Global.index == 11:
		Global.index = Global.index+2
	elif Global.index == 9:
		Global.index = Global.index+1
	elif Global.index == 5:
		Global.index = Global.index+1
	elif Global.index == 13:
		Global.index = Global.index+1
	SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])


func _on_return_body_entered(body: Node2D) -> void:
	SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])
