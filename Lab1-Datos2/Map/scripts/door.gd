extends AnimatedSprite2D
@onready var door: AnimatedSprite2D = $"."

var changed = false


func _on_area_2d_body_entered(body: Node2D) -> void:
		if changed:
			door.play("open")
		if changed == false:
			changed = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	door.play_backwards("open")
