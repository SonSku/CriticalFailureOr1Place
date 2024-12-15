extends Sprite2D


var keys = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DraggingController.connect("itemDropped", keyDropped)


func keyDropped(zone):
	if zone == "orange_key":
		keys += 1
	if zone == "red_key":
		keys += 1
	
	if keys == 2:
		for child in get_children():
			remove_child(child)
			child.queue_free()  # Free memory of the child
		# Queue self for deletion
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
