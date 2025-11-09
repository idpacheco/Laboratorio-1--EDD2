extends Node2D
var i = false
@export var lever_id : int = 0
var is_on := false

func _ready():
	if GameState.palancas_activadas[lever_id]:
		is_on = true
		
	else:
		is_on = false
	
func _process(delta: float) -> void:
	if i and Input.is_action_just_pressed("E"):
		toggle_lever()
		

func toggle_lever():
	if is_on or GameState.palancas_activadas[lever_id]:
		return
	is_on = true
	activar_minijuego()
	print("Palanca activada:", is_on, lever_id)


func activar_minijuego():
	GameState.current_lever_id = self.lever_id
	GameState.player_position = get_tree().current_scene.get_node("CharacterBody2D").global_position
	SceneTransitions.change_scene_to_file("res://Level 4/scenes/miniJuego.tscn")

func _on_minijuego_completado(puntos,exito):
	if exito:
		GameState.palancas_activadas[lever_id] = true
		GameState.puntaje_palancas[lever_id] = puntos
		GameState.puntaje_total = GameState.puntaje_palancas.sum()
		print("Minijuego de palanca ", lever_id, " completado con ", puntos, " puntos.")
	else:
		print("Minijuego de palanca ", lever_id, " fallido o incompleto.")

func _on_area_2d_body_entered(body: Node2D) -> void:
	i = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	i=false
