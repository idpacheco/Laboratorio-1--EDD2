extends Control

@export var id := ""
@export var es_descubierta := false
var bloqueada = false  # 🔐 Nueva variable
signal carta_volteada(carta: Node)

func _ready():
	mostrar_reverso()

func _gui_input(event):
	if bloqueada:
		return  # no permitir clics si la carta ya fue emparejada
	if event is InputEventMouseButton and event.pressed and not es_descubierta:
		mostrar_frente()
		emit_signal("carta_volteada", self)

func mostrar_frente():
	var tex = load("res://nivel3/art/" + id + "_front.png")
	$Sprite2D.texture = tex
	$Sprite2D.scale = Vector2(0.5, 0.5)
	$Sprite2D.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	$Sprite2D.visible = true
	$Sprite2D2.visible = false
	es_descubierta = true

func mostrar_reverso():
	var tex = load("res://nivel3/art/back.png")
	$Sprite2D2.texture = tex
	$Sprite2D2.scale = Vector2(0.5, 0.5)
	$Sprite2D2.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	$Sprite2D2.visible = true
	$Sprite2D.visible = false
	es_descubierta = false
