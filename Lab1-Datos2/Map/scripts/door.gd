extends AnimatedSprite2D
@onready var door: AnimatedSprite2D = $"."



func _on_area_2d_body_entered(_body: Node2D) -> void:
	if Global.arbol.buscar_subarbol(Global.index).dato["activado"]:
		door.play("open")



func _on_area_2d_body_exited(_body: Node2D) -> void:
	if Global.arbol.buscar_subarbol(Global.index).dato["activado"]:
		door.play_backwards("open")
