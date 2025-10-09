extends Area2D




func _on_body_entered(body: Node2D) -> void:
		SceneTransitions.change_scene_to_file("res://Map/scences/maps/question_map.tscn")



func _on_body_return_entered(body: Node2D) -> void:
	if Global.index ==3:
		Global.index = Global.index+4
	elif Global.index == 11:
		Global.index = Global.index-4
	elif Global.index == 1:
		Global.index = Global.index+2
	elif Global.index == 5:
		Global.index = Global.index-2
	elif Global.index == 9:
		Global.index = Global.index+2
	elif Global.index == 13:
		Global.index = Global.index-2
	SceneTransitions.change_scene_to_file("res://Map/scences/maps/question_map.tscn")
