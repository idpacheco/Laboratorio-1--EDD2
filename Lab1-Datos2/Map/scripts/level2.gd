extends Node2D
var i = false

func _process(_delta: float) -> void:
	if i and Input.is_action_just_pressed("E"):
		get_tree().change_scene_to_file("res://Level 2/scenes/Aviso.tscn")

func _on_area_2d_body_entered(_body: Node2D) -> void:
	i = true


func _on_area_2d_body_exited(_body: Node2D) -> void:
	i=false
