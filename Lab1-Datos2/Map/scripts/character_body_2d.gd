extends CharacterBody2D

# Movement speed in pixels per second
@export var speed: float = 200.0
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
var last_direction := "right"

func _ready():
	var character_id =SelectedGlobal.selected_character_id
	var color_id = SelectedGlobal.selected_color_id
	sprite.texture = character_textures[character_id][color_id]
	animation_player.play("idle_right")
	
func _physics_process(delta):
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normaliza para evitar velocidad diagonal extra
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * 200.0
		move_and_slide()

		# Animación WALK según dirección
		if direction.x > 0:
			animation_player.play("walk_right")
			last_direction = "right"
		elif direction.x < 0:
			animation_player.play("walk_left")
			last_direction = "left"
		elif direction.y != 0:
			# Si camina arriba/abajo, conserva la última dirección horizontal
			animation_player.play("walk_" + last_direction)
	else:
		velocity = Vector2.ZERO
		# Animación IDLE según última dirección
		animation_player.play("idle_" + last_direction)
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
