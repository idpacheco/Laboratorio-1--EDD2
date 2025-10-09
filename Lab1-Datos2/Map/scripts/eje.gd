extends CharacterBody2D

# Movement speed in pixels per second
@export var speed: float = 50.0

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO

	direction.y -= 1

	# Normalize to avoid faster diagonal movement
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()
