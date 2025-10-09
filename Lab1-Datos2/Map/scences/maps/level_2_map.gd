extends Node2D
@onready var area_2d_2: Area2D = $Area2D2
@onready var door: CollisionShape2D = $StaticBody2D/CollisionShape2D
func _process(delta: float) -> void:
	if Global.arbol.raiz.izq.dato["activado"]:
		door.one_way_collision = true
