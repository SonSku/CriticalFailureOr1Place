extends Node
class_name SceneLoader

signal unlocked_bitehack

var states = {}
var puzzles = {
	"password_dyson": preload("res://Scenes/open_door_dyson_puzzle.tscn"),
	"one_line": preload("res://Scenes/one_line_puzzle.tscn"),
	"clicker": preload("res://Scenes/Minigames/clicker.tscn"),
	"switch": preload("res://Scenes/switch.tscn")
}

func emit_unlock():
	emit_signal("unlocked_bitehack")

func get_state(id: String):
	return states.get(id)

func save_state(id: String, state: Dictionary) -> void:
	states[id] = state
	
func display_minigame(scene: String) -> void:
	print("dziala!")
	var s = puzzles[scene].instantiate()
	get_tree().root.add_child(s)

func purge_state(ids_that_start_with: String):
	var to_erase = []
	for key in states:
		if key.left(len(ids_that_start_with)) == ids_that_start_with:
			to_erase.append(key)

	for key in to_erase:
		states.erase(key)
