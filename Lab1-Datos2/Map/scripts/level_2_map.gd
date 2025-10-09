extends Node2D
@onready var area_2d_2: Area2D = $Area2D2
@onready var door: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var area_2d: Area2D = $"Big door/AnimatedSprite2D/Area2D"
func _process(delta: float) -> void:
	if Global.arbol.buscar_subarbol(Global.index).dato["activado"]:
		door.one_way_collision = true
