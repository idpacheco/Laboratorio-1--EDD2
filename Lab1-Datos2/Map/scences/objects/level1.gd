extends Node2D
var i = false

func _process(delta: float) -> void:
	if i and Input.is_action_just_pressed("E"):
		get_tree().change_scene_to_file("res://Level 1/scenes/Aviso_level_1.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	i = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	i=false
