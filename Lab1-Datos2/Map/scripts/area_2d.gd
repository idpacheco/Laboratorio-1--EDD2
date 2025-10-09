extends Area2D

@onready var enter: Sprite2D = $E


func _ready() -> void:
	enter.visible=false
func _on_body_entered(body: Node2D) -> void:
	enter.visible = true


func _on_body_exited(body: Node2D) -> void:
	enter.visible=false
