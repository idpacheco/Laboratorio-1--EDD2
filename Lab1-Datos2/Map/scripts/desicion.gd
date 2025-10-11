extends Node2D
@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var opcion_a: Label = $question/opcionA
@onready var opcion_b: Label = $question/opcionB
@onready var pregunta: Label = $question/pregunta

func _ready() -> void:
	Global.estado_des = true
	label.text = str(Global.arbol.buscar_subarbol(Global.index).izq.dato["valor"])
	label_2.text = str(Global.arbol.buscar_subarbol(Global.index).der.dato["valor"])
	pregunta.text = Global.arbol.buscar_subarbol(Global.index).dato["pregunta"]
	opcion_a.text = label.text+". "+Global.arbol.buscar_subarbol(Global.index).dato["opciones"][0]
	opcion_b.text = label_2.text+". "+Global.arbol.buscar_subarbol(Global.index).dato["opciones"][1]
	
func _on_exit_1_body_entered(body: Node2D) -> void:
	if Global.index == 7:
		Global.index = Global.index-4
	elif Global.index == 3:
		Global.index = Global.index-2
	elif Global.index == 1:
		GameState.reset()
		Global.index = Global.index-1
	elif Global.index == 11:
		Global.index = Global.index-2
	elif Global.index == 9:
		GameState.reset()
		Global.index = Global.index-1
	elif Global.index == 5:
		GameState.reset()
		Global.index = Global.index-1
	elif Global.index == 13:
		GameState.reset()
		Global.index = Global.index-1
	Global.estado_des = false
	SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])
	
func _on_exit_2_body_entered(body: Node2D) -> void:
	if Global.index == 7:
		Global.index = Global.index+4
	elif Global.index == 3:
		Global.index = Global.index+2
	elif Global.index == 1:
		GameState.reset()
		Global.index = Global.index+1
	elif Global.index == 11:
		Global.index = Global.index+2
	elif Global.index == 9:
		GameState.reset()
		Global.index = Global.index+1
	elif Global.index == 5:
		Global.index = Global.index+1
		GameState.reset()
	elif Global.index == 13:
		Global.index = Global.index+1
		GameState.reset()
	Global.estado_des = false
	SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])


func _on_return_body_entered(body: Node2D) -> void:
	Global.estado_des = false
	SceneTransitions.change_scene_to_file(Global.arbol.buscar_subarbol(Global.index).dato["nombre"])
