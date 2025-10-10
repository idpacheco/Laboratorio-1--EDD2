extends Control

@onready var catch_bar: ProgressBar = %CatchBar

var onCatch := false
var catchSpeed := 0.3
var catchingValue := 0.0

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_end"):
		var image = get_viewport().get_texture().get_image()
		image.save_png("res://screenshot.png")
	if onCatch: catchingValue += catchSpeed
	else: catchingValue -= catchSpeed
	
	if catchingValue < 0.0: catchingValue = 0
	elif catchingValue >= 100: _game_end()
	
	catch_bar.value = catchingValue

func _game_end() -> void:
	var tween = get_tree().create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_property(self, "global_position", global_position + Vector2(0, 700), 0.5)
	await tween.finished

	get_tree().paused = false

	var virus = get_node_or_null("../virus")
	var virus2 = get_node_or_null("../virus2")
	var target = get_node_or_null("../Target")
	var to_remove = [virus, virus2, target]

	for node in to_remove:
		if node and is_instance_valid(node):
			var fade = get_tree().create_tween()
			fade.tween_property(node, "modulate:a", 0.0, 0.3)
			await fade.finished
			if is_instance_valid(node): 
				node.queue_free()
	await get_tree().create_timer(0.2).timeout
	SceneTransitions.change_scene_to_file("res://Level 2/scenes/fin.tscn")
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()

func _on_target_target_entered() -> void:
	onCatch = true

func _on_target_target_exited() -> void:
	onCatch = false

func _on_pause_button_pressed() -> void:
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
	get_tree().paused = !get_tree().paused # Cambia entre pausa y no pausa
