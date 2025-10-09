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
	update_character_sprite()

func _on_back_pressed() -> void:
	current_frame = (current_frame - 1) % 2
	if current_frame < 0:
		current_frame = 1
	update_character_sprite()

func _on_option_button_item_selected(index: int) -> void:
	current_color_id = index
	update_character_sprite()

func update_character_sprite():
	# Cambia la textura según el color seleccionado
	sprite.texture = character_textures[current_color_id]

	# Cambia el frame si usas AnimatedSprite2D
	if sprite.has_method("set_frame"):
		sprite.set_frame(current_frame)
	# Cambia el color de ColorRect
	color_rect.color = color_rect_colors[current_color_id]
