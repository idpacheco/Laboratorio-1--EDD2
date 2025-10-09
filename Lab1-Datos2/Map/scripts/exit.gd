extends Area2D




func _on_body_entered(body: Node2D) -> void:
		SceneTransitions.change_scene_to_file("res://Map/scences/maps/question_map.tscn")



func _on_body_return_entered(body: Node2D) -> void:
	if Global.index ==6:
		Global.index = Global.index+1
	elif Global.index == 8:
		Global.index = Global.index-1
	SceneTransitions.change_scene_to_file("res://Map/scences/maps/question_map.tscn")
