extends AnimatedSprite2D
@onready var door: AnimatedSprite2D = $"."



func _on_area_2d_body_entered(body: Node2D) -> void:
			door.play("open")



func _on_area_2d_body_exited(body: Node2D) -> void:
	door.play_backwards("open")
