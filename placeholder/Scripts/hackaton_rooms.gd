extends Node2D

@onready var skeleton: CharacterBody2D = $Skeleton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_left_door_body_entered(body: Node2D) -> void:
	if body.name == "Skeleton":
		var state = {
			"position": skeleton.position
		}
		state["position"].x += 1328
		LoadingScene.save_state("skelet", state)
		get_tree().change_scene_to_file("res://Scenes/room4.tscn")


func _on_right_door_body_entered(body: Node2D) -> void:
	if body.name == "Skeleton":
		var state = {
			"position": skeleton.position
		}
		state["position"].x -= 1328
		LoadingScene.save_state("skelet", state)
		get_tree().change_scene_to_file("res://Scenes/room3.tscn")


func _on_mikstura_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Inventory.addItem(Items.TYPES.ROMPER)
		self.get_node("mikstura1").queue_free()


func _on_mikstura_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Inventory.addItem(Items.TYPES.KOMPOT)
		self.get_node("mikstura2").queue_free()


func _on_mikstura_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Inventory.addItem(Items.TYPES.REDBUL)
		self.get_node("mikstura3").queue_free()
