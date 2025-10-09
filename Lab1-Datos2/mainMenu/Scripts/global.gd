# Global.gd
extends Node

var arbol: ArbolBinario = ArbolBinario.new()
var index: int
func _ready() -> void:
	
	arbol.agregar_nodo({"valor": 7, "nombre": "res://Map/scences/maps/level1_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 6, "nombre": "res://Map/scences/maps/level2_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 8, "nombre": "res://Map/scences/maps/level2_map.tscn", "activado":false})
