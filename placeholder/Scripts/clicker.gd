extends Node2D

@export var progress_decrease_rate: float = 10.0  # Jak szybko pasek spada
@export var progress_increase_amount: float = 5.0  # Jak dużo rośnie przy kliknięciu
@export var max_progress: float = 100.0  # Maksymalna wartość paska
@export var min_progress: float = 0.0  # Minimalna wartość paska

var progress: float = 0.0  # Aktualna wartość paska
var game_won: bool = false  # Czy gra została wygrana

@onready var progress_bar: TextureProgressBar = $TextureProgressBar
@onready var win_label: Label = $WinLabel  # Etykieta wygranej

func _ready():
	# Ustawienie początkowych wartości
	progress_bar.max_value = max_progress
	progress_bar.min_value = min_progress
	progress_bar.value = progress
	set_process(true)

func _process(delta):
	if not game_won:
		# Spadek paska w czasie
		progress -= progress_decrease_rate * delta
		progress = clamp(progress, min_progress, max_progress)
		progress_bar.value = progress

		# Sprawdzenie warunku wygranej
		print(progress, max_progress)
		if progress >= 99 and not game_won:
			win_game()  # Wywołaj funkcję zmieniającą scenę

func _on_button_pressed():
	# Zwiększenie paska po kliknięciu
	progress += progress_increase_amount
	progress = clamp(progress, min_progress, max_progress)
	progress_bar.value = progress

func win_game():
	game_won = true
	set_process(false)  # Zatrzymaj spadek paska
	# Zmień scenę na scenę wygranej
	get_tree().change_scene_to_file("res://Scenes/Minigames/win.tscn")
