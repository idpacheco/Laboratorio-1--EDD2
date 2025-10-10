extends Control

@onready var sprite = $sprite_controler/ColorRect/Sprite2D
@onready var color_rect = $sprite_controler/ColorRect

# Texturas por color (debes tenerlas en las rutas correctas)
var character_textures = [
	preload("res://Select_Character/Assests/players/players_blue.png"),   # ID 0: Azul
	preload("res://Select_Character/Assests/players/players_green.png"),  # ID 1: Verde
	preload("res://Select_Character/Assests/players/players_red.png"),    # ID 2: Rojo
	preload("res://Select_Character/Assests/players/players_grey.png"),   # ID 3: Gris
]


# Colores para el ColorRect con transparencia A=123
var color_rect_colors = [
	Color(0.0, 0.34, 1.0, 123/255.0), # Azul
	Color(0.0, 1.0, 0.34, 123/255.0), # Verde
	Color(1.0, 0.0, 0.0, 123/255.0),  # Rojo
	Color(0.63, 0.63, 0.63, 123/255.0) # Gris
]

var current_frame := 0 # 0 o 1
var current_color_id := 0 # 0-3

func _ready():
	update_character_sprite()


func _on_next_pressed() -> void:
	current_frame = (current_frame + 1) % 2
	SelectedGlobal.selected_character_id = current_frame
	update_character_sprite()

func _on_back_pressed() -> void:
	current_frame = (current_frame - 1) % 2
	if current_frame < 0:
		current_frame = 1
	SelectedGlobal.selected_character_id = current_frame
	update_character_sprite()

func _on_option_button_item_selected(index: int) -> void:
	current_color_id = index
	SelectedGlobal.selected_color_id = current_color_id
	update_character_sprite()


func update_character_sprite():
	sprite.texture = character_textures[current_color_id]
	if sprite.has_method("set_frame"):
		sprite.set_frame(current_frame)
	color_rect.color = color_rect_colors[current_color_id]


func _on_save_button_pressed() -> void:
	SceneTransitions.change_scene_to_file("res://Map/scences/maps/level1_map.tscn")
	#SceneTransitions.change_scene_to_file("res://Level 4/scenes/level_4.tscn")
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
