extends Node2D
@onready var door: CollisionShape2D = $StaticBody2D/CollisionShape2D

func _process(_delta: float) -> void:
	if Global.arbol.raiz.dato["activado"]:
		door.one_way_collision = true
