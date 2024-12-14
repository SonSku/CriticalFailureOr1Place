extends Node2D

var enteredPin = []
@onready var button: Button = $Button
@onready var button_2: Button = $Button2
@onready var button_3: Button = $Button3
@onready var button_4: Button = $Button4
@onready var button_5: Button = $Button5
@onready var button_6: Button = $Button6
@onready var button_7: Button = $Button7
@onready var button_8: Button = $Button8
@onready var button_9: Button = $Button9

func _on_button_pressed() -> void:
	eneteredCharacter(button)

func _on_button_2_pressed() -> void:
	eneteredCharacter(button_2)

func eneteredCharacter(przycisk: Button) -> void:
	if enteredPin.size()>3: return
	else:
		enteredPin.append(int(przycisk.text))
	print(enteredPin)


func _on_button_3_pressed() -> void:
	eneteredCharacter(button_3)


func _on_button_4_pressed() -> void:
	eneteredCharacter(button_4)


func _on_button_5_pressed() -> void:
	eneteredCharacter(button_5)


func _on_button_6_pressed() -> void:
	eneteredCharacter(button_6)


func _on_button_7_pressed() -> void:
	eneteredCharacter(button_7)


func _on_button_8_pressed() -> void:
	eneteredCharacter(button_8)


func _on_button_9_pressed() -> void:
	eneteredCharacter(button_9)
