extends Control

@onready var ayuda1 = $help1
@onready var ayuda2 = $help2

func _ready():
	# Asegura que las imágenes no estén visibles al inicio
	ayuda1.visible = true
	ayuda2.visible = false



func _on_next_pressed() -> void:
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
	ayuda1.visible = false
	ayuda2.visible = true


func _on_next_2_pressed() -> void:
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
	SceneTransitions.change_scene_to_file("res://nivel3/scenes/MemoryGame.tscn")
