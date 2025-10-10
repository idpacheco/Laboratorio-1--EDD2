extends Area2D




func _on_body_entered(_body: Node2D) -> void:
		SceneTransitions.change_scene_to_file("res://Map/scences/maps/question_map.tscn")
	 	


func _on_body_return_entered(_body: Node2D) -> void:
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
	elif Global.index == 0:
		Global.index = Global.index+1
	elif Global.index == 2:
		Global.index = Global.index-1
	elif Global.index == 4:
		Global.index = Global.index+1
	elif Global.index == 6:
		Global.index = Global.index-1
	elif Global.index == 8:
		Global.index = Global.index+1
	elif Global.index == 10:
		Global.index = Global.index-1
	elif Global.index == 12:
		Global.index = Global.index+1
	elif Global.index == 14:
		Global.index = Global.index-1
	SceneTransitions.change_scene_to_file("res://Map/scences/maps/question_map.tscn")
