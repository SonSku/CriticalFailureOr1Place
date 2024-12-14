extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DraggingController.itemDropped.connect(handleItemDropped)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func handleItemDropped(zoneName):
	if zoneName == "zone":
		print("IT WOOOOOOORKS")
	else:
		print("IT IS THE WRONG ONEEEEEEEEE")
