extends Area2D

signal target_entered()
signal target_exited()

const SPEED := 200
var on_virus := false

@onready var Box: Control = get_node("../Game/PanelContainer/MarginContainer/VBoxContainer/Box") # 👈 igual que en virus
var borderDistance := 20  # 

func _physics_process(delta: float) -> void:
	_check_on_virus()

	var direction := Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")

	global_position += direction * SPEED * delta

	_limit_to_box()

func _check_on_virus() -> void:
	var bodies := get_overlapping_bodies()
	if bodies.is_empty() and on_virus:
		on_virus = false
		target_exited.emit()
	elif not bodies.is_empty() and not on_virus:
		on_virus = true
		target_entered.emit()

func _limit_to_box() -> void:
	if not is_instance_valid(Box):
		return

	var box_rect := Box.get_global_rect()


	global_position.x = clamp(global_position.x,
		box_rect.position.x + borderDistance,
		box_rect.position.x + box_rect.size.x - borderDistance)

	global_position.y = clamp(global_position.y,
		box_rect.position.y + borderDistance,
		box_rect.position.y + box_rect.size.y - borderDistance)
