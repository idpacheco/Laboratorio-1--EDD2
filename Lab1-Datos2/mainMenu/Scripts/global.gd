# Global.gd
extends Node

var arbol: ArbolBinario = ArbolBinario.new()
var index: int
func _ready() -> void:
	
	arbol.agregar_nodo({"valor": 7, "nombre": "res://Map/scences/maps/level1_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 3, "nombre": "res://Map/scences/maps/level2_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 11, "nombre": "res://Map/scences/maps/level2_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 1, "nombre": "res://Map/scences/maps/level3_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 5, "nombre": "res://Map/scences/maps/level3_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 9, "nombre": "res://Map/scences/maps/level3_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 13, "nombre": "res://Map/scences/maps/level3_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 0, "nombre": "res://Map/scences/maps/level4_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 2, "nombre": "res://Map/scences/maps/level4_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 4, "nombre": "res://Map/scences/maps/level4_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 6, "nombre": "res://Map/scences/maps/level4_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 8, "nombre": "res://Map/scences/maps/level4_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 10, "nombre": "res://Map/scences/maps/level4_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 12, "nombre": "res://Map/scences/maps/level4_map.tscn", "activado":false})
	arbol.agregar_nodo({"valor": 14, "nombre": "res://Map/scences/maps/level4_map.tscn", "activado":false})
