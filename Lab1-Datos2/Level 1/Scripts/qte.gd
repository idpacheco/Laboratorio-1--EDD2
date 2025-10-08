extends Control

signal finished(success: bool)

@export var keyString: String = "Q"
@export var keyCode: Key = KEY_Q
@export var eventDuration := 5.0
@export var displayDuration := 0.5

@onready var color_rect: ColorRect = %ColorRect
@onready var key_label: Label = %KeyLabel
@onready var success_label: Label = %SuccsessLabel

var success: bool = false
var tween: Tween

func _ready() -> void:
	add_to_group("QTE")
	key_label.text = keyString
	success_label.hide()
	success = false
	
	# --- ¡IMPORTANTE! Resetea el círculo cada vez que inicia ---
	color_rect.material.set_shader_parameter("value", 1.0)

	# Iniciar animación del tiempo
	await _animation()

	# Si no fue presionada la tecla, termina como fallo
	if not success:
		_hide_and_emit(false)

func _animation() -> void:
	# Tween para reducir el parámetro value del shader de 1 a 0 en eventDuration segundos
	tween = create_tween()
	tween.tween_property(
		color_rect.material, "shader_parameter/value", 0.0, eventDuration
	)
	await tween.finished

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(keyCode) and not success_label.visible:
		success_label.show()
		if tween:
			tween.kill()  # Detener la animación del círculo
		success = true
		await get_tree().create_timer(displayDuration).timeout
		_hide_and_emit(true)

func _hide_and_emit(success_result: bool):
	hide()
	emit_signal("finished", success_result)
