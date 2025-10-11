extends Node2D

func _ready():
	# Solo mueve al jugador si hay una posición previa guardada
		if GameState.player_position != Vector2.ZERO:
			var player = $CharacterBody2D # Cambia esto si tu nodo se llama diferente o está en otra ruta
			player.global_position = GameState.player_position
