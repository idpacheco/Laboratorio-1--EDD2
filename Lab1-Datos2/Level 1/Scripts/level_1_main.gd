extends Control

const QTE_SCENE = preload("res://Level 1/scenes/QTE.tscn")
const IMAGE_KEYS = [
	{ "file": "res://Level 1/Assets+/Malware.png", "key": KEY_M},
	{ "file": "res://Level 1/Assets+/Phising.png", "key": KEY_P },
	{ "file": "res://Level 1/Assets+/SQL Injection.png", "key": KEY_S },
	{ "file": "res://Level 1/Assets+/Spyware.png", "key": KEY_Y }
]

@export var points_to_win := 1000
@export var points_per_success := 100
@export var points_per_fast_success := 150
@export var points_per_fail := -200
@export var fast_time := 0.5

@onready var score_label: Label = %ScoreLabel
var score: int = 0
var game_over: bool = false

func _ready():
	score = 0
	game_over = false
	_update_score()
	_next_qte()

func _next_qte():
	if game_over:
		return
	var choice = IMAGE_KEYS[randi() % IMAGE_KEYS.size()]
	var image = load(choice.file)
	var key = choice.key
	var qte = QTE_SCENE.instantiate()
	add_child(qte)
	qte.setup(image, key)
	qte.finished.connect(_on_qte_finished)

func _on_qte_finished(success: bool, elapsed: float):
	if success:
		if elapsed < fast_time:
			score += points_per_fast_success
		else:
			score += points_per_success
	else:
		score += points_per_fail
	_update_score()
	if score >= points_to_win:
		_game_win()
	else:
		_next_qte()

func _update_score():
	score_label.text = "Puntos: %d" % score

func _game_win():
	game_over = true
	SceneTransitions.change_scene_to_file("res://Level 1/scenes/listo.tscn")
