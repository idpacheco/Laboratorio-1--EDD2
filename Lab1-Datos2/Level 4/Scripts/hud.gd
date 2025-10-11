extends CanvasLayer


@onready var puntaje_label = $PuntajeLabel
@onready var puntaje_rect = $PuntajeRect
@onready var panel_final = $Panel2
@onready var mensaje_label = $Panel2/PanelFinal/Panel/MensajeLabel
@onready var puntaje_final_label = $Panel2/PanelFinal/Panel/PuntajeFinal
#@onready var atrasMundo = $atrasMundo
@onready var door: CollisionShape2D = $"../door/StaticBody2D/CollisionShape2D"
@onready var next_to_game: TextureButton = $Panel2/Next_to_game
@onready var reintentar_button = $Panel2/ReintentarButton
@onready var stars = [
	$PalancasContainer/Energy1,
	$PalancasContainer/Energy2,
	$PalancasContainer/Energy3
]

var texture_full = preload("res://Level 4/Assets/textures/EnergyFull.tres")
var texture_empty = preload("res://Level 4/Assets/textures/EneergyEmpty.tres")

var panel_mostrado := false

func _ready():
	if Global.arbol.buscar_subarbol(Global.index).dato["activado"]:
		door.one_way_collision = true
	panel_final.visible = false
	actualizar_palancas_visual()

func _process(_delta):
	puntaje_label.text = "X %d" % GameState.puntaje_total
	actualizar_palancas_visual()

	if GameState.palancas_activadas.count(true) == 3 and not panel_mostrado:
		mostrar_resultado_finalPanel()
		panel_mostrado = true

func mostrar_resultado_finalPanel():
	puntaje_label.visible = false
	puntaje_rect.visible = true
	panel_final.visible = true
	#atrasMundo.visible=false
	puntaje_final_label.text = "Puntos Totales: %d / 1000" % GameState.puntaje_total

	if GameState.puntaje_total >= 1000:
		mensaje_label.text = "¡Has restaurado el sistema y eliminado la amenaza de los virus!"
		reintentar_button.visible = false
		next_to_game.visible = true
		
	else:
		mensaje_label.text = "¡El sistema fue restaurado, pero la protección no fue suficiente contra los virus!"
		reintentar_button.visible = true
		next_to_game.visible = false
	#atrasMundo.visible=true
	
func actualizar_palancas_visual():
	for i in range(stars.size()):
		if i < GameState.palancas_activadas.size() and GameState.palancas_activadas[i]:
			stars[i].texture = texture_full
		else:
			stars[i].texture = texture_empty





func _on_mecanica_3_button_pressed() -> void:
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
	GameState.player_position = get_tree().current_scene.get_node("CharacterBody2D").global_position
	SceneTransitions.change_scene_to_file("res://Level 4/scenes/InstructionsLevel4.tscn")


	


func _on_reintentar_button_pressed() -> void:
	puntaje_rect.visible = false
	panel_final.visible = false
	GameState.reset()
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_next_to_game_pressed() -> void:
	if Global.index != 12:
		Global.arbol.cambiar_estado(Global.index,true)
		door.one_way_collision = true
		panel_final.visible = false
		panel_final.visible = false
		SceneTransitions.change_scene_to_file("res://mainMenu/Scenes/win.tscn")
	else:
		SceneTransitions.change_scene_to_file("res://mainMenu/Scenes/loser.tscn")
		
		
	pass # Replace with function body.
