extends CharacterBody2D

# Movement speed in pixels per second
@export var speed: float = 100.0
@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer

# Matriz de texturas: personajes x colores
var character_textures = [
		[ # Personaje 2
		preload("res://Select_Character/Assests/animaciones/walk_blue_2.png"),
		preload("res://Select_Character/Assests/animaciones/walk_green_2.png"),
		preload("res://Select_Character/Assests/animaciones/walk_red_2.png"),
		preload("res://Select_Character/Assests/animaciones/walk_grey_2.png"),
	],
	[ # Personaje 1
		preload("res://Select_Character/Assests/animaciones/walk_blue_1.png"),   # Azul
		preload("res://Select_Character/Assests/animaciones/walk_green_1.png"),  # Verde
		preload("res://Select_Character/Assests/animaciones/walk_red_1.png"),    # Rojo
		preload("res://Select_Character/Assests/animaciones/walk_grey_1.png"),   # Gris
	]
]

var last_direction = Vector2.ZERO


func _ready():
	var character_id =SelectedGlobal.selected_character_id
	var color_id = SelectedGlobal.selected_color_id
	sprite.texture = character_textures[character_id][color_id]
	animation_player.play("idle_right")
	
func _physics_process(_delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	if direction.x != 0:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed )

	if direction.y != 0:
		velocity.y = direction.y * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed )

	if direction != Vector2.ZERO:
		last_direction = direction.normalized()

	var anim_to_play = ""

	if direction == Vector2.ZERO:
	# Si está quieto, usa la última dirección horizontal
		anim_to_play = "idle_left" if last_direction.x < 0 else "idle_right"
	else:
	# Si se mueve, prioriza la dirección horizontal.
		if abs(direction.x) >= abs(direction.y):
			anim_to_play = "walk_left" if direction.x < 0 else "walk_right"
		else:
		# Si el movimiento es principalmente vertical, usa la última dirección horizontal
			anim_to_play = "walk_left" if last_direction.x < 0 else "walk_right"

	if animation_player.current_animation != anim_to_play:
		animation_player.play(anim_to_play)

	move_and_slide()
	
	
func _on_area_2d_body_entered(_body: Node2D) -> void:
	pass # Replace with function body.
