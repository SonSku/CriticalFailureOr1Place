extends Node
class_name SceneLoader

var states = {}

func get_state(id: String):
	return states.get(id)

func save_state(id: String, state: Dictionary) -> void:
	states[id] = state
	
func display_minigame(scene: PackedScene) -> void:
	var s = scene.instantiate()
	get_tree().root.add_child(s)

func purge_state(ids_that_start_with: String):
	var to_erase = []
	for key in states:
		if key.left(len(ids_that_start_with)) == ids_that_start_with:
			to_erase.append(key)

	for key in to_erase:
		states.erase(key)
