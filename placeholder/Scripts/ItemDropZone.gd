extends StaticBody2D
@export var item: Items.TYPES
@export var zoneName := "default name"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func itemDropped(type: Items.TYPES) -> bool:
	if type == item:
		DraggingController.emitItemDropped(zoneName)
		Inventory.removeItem(type)
		return true
	return false
