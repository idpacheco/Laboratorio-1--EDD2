extends Node2D

@onready var grid = $GridContainer
@onready var timer = $Timer
@onready var label = $Label


var primera_carta = null
var segunda_carta = null
var pares_encontrados = 0
var bloqueo = false

# Pares de amenazas ↔ defensas
var pares = [
	{"amenaza": "phishing", "defensa": "verificacion"},
	{"amenaza": "ransomware", "defensa": "copias"},
	{"amenaza": "contraseña", "defensa": "2fa"},
	{"amenaza": "virus", "defensa": "antivirus"},
	{"amenaza": "ddos", "defensa": "balanceo"},
	{"amenaza": "databreach", "defensa": "cifrado"}
]

func _ready():
	inicializar_cartas()
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))

func inicializar_cartas():
	var todas_cartas = []
	for par in pares:
		todas_cartas.append(par.amenaza)
		todas_cartas.append(par.defensa)
	todas_cartas.shuffle()

	for id in todas_cartas:
		var carta = preload("res://nivel3/scenes/Card.tscn").instantiate()
		carta.id = id
		carta.connect("carta_volteada", Callable(self, "_cuando_voltea"))
		grid.add_child(carta)

func _cuando_voltea(carta):
	if bloqueo:
		return
	if carta == primera_carta:
		return # Evita doble clic sobre la misma carta

	if primera_carta == null:
		primera_carta = carta
	elif segunda_carta == null:
		segunda_carta = carta
		bloqueo = true
		verificar_pareja()

func verificar_pareja():
	timer.stop() # detener timer previo por seguridad

	if son_pareja(primera_carta.id, segunda_carta.id):
		label.text = "✅ ¡Pareja correcta!"
		pares_encontrados += 1

		# 🔐 Bloquear las cartas acertadas
		primera_carta.bloqueada = true
		segunda_carta.bloqueada = true

		await get_tree().create_timer(0.6).timeout
		primera_carta = null
		segunda_carta = null
		bloqueo = false

		if pares_encontrados == pares.size():
			SceneTransitions.change_scene_to_file("res://nivel3/scenes/win.tscn")
		
	else:
		label.text = "❌ No coinciden..."
		timer.start(1.0)

func son_pareja(a, b):
	for par in pares:
		if (par.amenaza == a and par.defensa == b) or (par.amenaza == b and par.defensa == a):
			return true
	return false

func _on_Timer_timeout():
	if primera_carta and primera_carta.es_descubierta:
		primera_carta.mostrar_reverso()
	if segunda_carta and segunda_carta.es_descubierta:
		segunda_carta.mostrar_reverso()

	# Reset del turno
	primera_carta = null
	segunda_carta = null
	bloqueo = false
	timer.stop()


func _on_button_pressed() -> void:
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
	SceneTransitions.change_scene_to_file("res://mainMenu/Scenes/main.tscn")

func _on_button_2_pressed() -> void:
	AudioManager.SFXPlayer.stream = preload("res://mainMenu/Assets/Audio/tf2-button-click-hover.mp3")
	AudioManager.SFXPlayer.play()
	SceneTransitions.change_scene_to_file("res://nivel3/scenes/help.tscn")
