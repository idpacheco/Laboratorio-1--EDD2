extends Area2D




func _on_body_entered(body: Node2D) -> void:
		SceneTransitions.change_scene_to_file("res://Map/scences/maps/question_map.tscn")
