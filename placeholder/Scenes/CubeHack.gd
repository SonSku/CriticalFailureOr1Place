extends Sprite2D

var area


func _ready() -> void:
	area = get_node("Area2D")
	remove_child(area)

func _process(delta: float) -> void:
	pass
	
func enable():
	add_child(area)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Inventory.enableDice(Items.DICE.BITEHACK)
