extends Button

func _ready():
	print("DEBUG: Botón listo")
	self.connect("pressed", Callable(self, "_start_mini_game"))

func _start_mini_game():
	print("DEBUG: Botón presionado, intentando cambiar de escena")
