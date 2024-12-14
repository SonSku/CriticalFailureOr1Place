extends Control

# Poprawna sekwencja składników (przykład)
var correct_sequence = [
	{"name": "Składnik 1", "amount": 2},
	{"name": "Składnik 3", "amount": 5},
	{"name": "Składnik 2", "amount": 1}
]

# Sekwencja wprowadzona przez gracza
var player_sequence = []

# Odnośniki do UI
@onready var ingredient_buttons = $IngredientButtons
@onready var amount_input = $AmountInput
@onready var add_button = $AddButton
@onready var sequence_list = $SequenceList
@onready var check_button = $CheckButton
@onready var result_label = $ResultLabel

func _ready():
	# Podpinanie akcji do przycisków
	for button in ingredient_buttons.get_children():
		button.connect("pressed", Callable(self, "_on_ingredient_selected").bind(button.text))
	add_button.connect("pressed", Callable(self, "_on_add_button_pressed"))
	check_button.connect("pressed", Callable(self, "_on_check_button_pressed"))

func _on_ingredient_selected(ingredient_name: String) -> void:
	# Zapisz wybrany składnik
	$SelectedIngredient.text = ingredient_name

func _on_add_button_pressed() -> void:
	var ingredient_name = $SelectedIngredient.text
	var amount = amount_input.text.to_int()  # Bezpośrednia konwersja do int
	if ingredient_name != "" and amount > 0 and amount <= 9:
		# Dodaj składnik do sekwencji gracza
		player_sequence.append({"name": ingredient_name, "amount": amount})
		# Aktualizuj listę na ekranie
		var label = Label.new()
		label.text = ingredient_name + " x" + str(amount)  # Poprawiona linia
		sequence_list.add_child(label)
		# Wyczyść pole
		$SelectedIngredient.text = ""
		amount_input.text = ""
	else:
		result_label.text = "Błędne dane!"

func _on_check_button_pressed() -> void:
	# Porównaj sekwencję gracza z poprawną
	print(player_sequence)
	print(correct_sequence)
	if player_sequence == correct_sequence:
		result_label.text = "Gratulacje! Poprawna sekwencja!"
	else:
		result_label.text = "Błąd! Spróbuj ponownie."
		# Wyczyść sekwencję gracza
	player_sequence.clear()
	for child in sequence_list.get_children():
		child.queue_free()  # Usuwa dziecko z węzła
