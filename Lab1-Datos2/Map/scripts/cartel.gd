extends Node2D
var i = false

func _process(delta: float) -> void:
	if i and Input.is_action_just_pressed("E"):
		print("hola")

func _on_area_2d_body_entered(body: Node2D) -> void:
	i = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	i=false
