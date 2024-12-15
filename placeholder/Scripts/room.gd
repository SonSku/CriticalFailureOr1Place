extends Node2D

@onready var skeleton: CharacterBody2D = $Skeleton
@export var room_name: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DraggingController.itemDropped.connect(handleItemDropped)
	if room_name == "room" and LoadingScene.get_state(room_name) == null:
		var s = preload("res://Scenes/stolek.tscn")
		var scene = s.instantiate()
		scene.input_event.connect(_on_stolek_input_event)
		self.add_child(scene)
	if room_name == "room2" and LoadingScene.get_state(room_name) != null:
		if LoadingScene.get_state(room_name)["stolek"] == "placed":
			var s = preload("res://Scenes/stolek.tscn")
			var scene = s.instantiate()
			self.add_child(scene)
			scene.position.x = 1308

func handleItemDropped(zoneName):
	if zoneName == "chair":
		var stolek_state = {
			"stolek": "placed"
		}
		LoadingScene.save_state(room_name, stolek_state)
		var s = preload("res://Scenes/stolek.tscn")
		var scene = s.instantiate()
		self.add_child(scene)
		scene.position.x = 1308
	else:
		print("IT IS THE WRONG ONEEEEEEEEE")

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
		get_tree().change_scene_to_file("res://Scenes/room2.tscn")

func _on_right_door_body_entered(body: Node2D) -> void:
	if body.name == "Skeleton":
		var state = {
			"position": skeleton.position
		}
		state["position"].x -= 1328
		LoadingScene.save_state("skelet", state)
		get_tree().change_scene_to_file("res://Scenes/room.tscn")


func _on_stolek_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var stolek_state = {
			"stolek": "picked"
		}
		LoadingScene.save_state(room_name, stolek_state)
		print(LoadingScene.get_state(room_name))
		Inventory.addItem(Items.TYPES.CHAIR)
		self.get_node("Stolek").queue_free()
