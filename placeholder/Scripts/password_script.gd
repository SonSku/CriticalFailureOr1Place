extends Node2D

static var puzzel_name = "password_dyson"

var enteredPin = []
const properPin = [2, 2, 8, 0]
@onready var button: Button = $Button
@onready var button_2: Button = $Button2
@onready var button_3: Button = $Button3
@onready var button_4: Button = $Button4
@onready var button_5: Button = $Button5
@onready var button_6: Button = $Button6
@onready var button_7: Button = $Button7
@onready var button_8: Button = $Button8
@onready var button_9: Button = $Button9
@onready var pin: Label = $Pin
@onready var button_11: Button = $Button11
const Skeleton = preload("res://Scripts/skeleton.gd")

func compare_array(arr1: Array, arr2: Array) -> bool:
	for i in range(arr1.size()):
		if arr1[i] != arr2[i]: return false
	return true

func _process(delta) -> void:
	if enteredPin.size() == 4:
		if compare_array(enteredPin, properPin):
			var state = {
				"blocked": true
			}
			LoadingScene.save_state(puzzel_name, state)
			Inventory.addItem(Items.TYPES.ORANGE_KEY)
			get_tree().root.get_node("room").get_node("Skeleton").enabled = true
			queue_free()

func _on_button_pressed() -> void:
	eneteredCharacter(button)
	update_label()

func _on_button_2_pressed() -> void:
	eneteredCharacter(button_2)
	update_label()

func eneteredCharacter(przycisk: Button) -> void:
	if enteredPin.size()>3: return
	else:
		enteredPin.append(int(przycisk.text))


func _on_button_3_pressed() -> void:
	eneteredCharacter(button_3)
	update_label()


func _on_button_4_pressed() -> void:
	eneteredCharacter(button_4)
	update_label()


func _on_button_5_pressed() -> void:
	eneteredCharacter(button_5)
	update_label()


func _on_button_6_pressed() -> void:
	eneteredCharacter(button_6)
	update_label()


func _on_button_7_pressed() -> void:
	eneteredCharacter(button_7)
	update_label()


func _on_button_8_pressed() -> void:
	eneteredCharacter(button_8)
	update_label()


func _on_button_9_pressed() -> void:
	eneteredCharacter(button_9)
	update_label()


func _on_button_10_pressed() -> void:
	if enteredPin.size() > 0:
		enteredPin.pop_back()  # Poprawne usunięcie ostatniego elementu
		print(enteredPin)
		update_label()
		
func array_to_str(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += str(i)
	return s
	
func update_label() -> void:
	pin.text = array_to_str(enteredPin)


func _on_button_11_pressed() -> void:
	eneteredCharacter(button_11)
	update_label()
	
func _input(ev) -> void:
	if Input.is_key_pressed(KEY_Q):
		get_tree().root.get_node("room").get_node("Skeleton").enabled = true
		queue_free()
