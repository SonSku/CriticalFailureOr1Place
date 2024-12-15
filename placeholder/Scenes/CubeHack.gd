extends Sprite2D

var area


func _ready() -> void:
	area = get_node("Area2D")
	remove_child(area)
	LoadingScene.connect("unlocked_bitehack", enable)

func _process(delta: float) -> void:
	pass
	
func enable():
	get_node("ClosedCubeCase").queue_free()
	add_child(area)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Inventory.enableDice(Items.DICE.BITEHACK)
		print("wooooow")
		queue_free()
