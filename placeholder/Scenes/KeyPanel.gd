extends Sprite2D

var keys = 0

var switch = preload("res://Scenes/other/SwitchPanel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DraggingController.connect("itemDropped", itemDrop)

func itemDrop(zone):
	if zone == "orange_key":
		keys += 1
	if zone == "red_key":
		keys += 1

	if keys == 2:
		var s = switch.instantiate()
		get_parent().add_child(s)
		for child in get_children():
			remove_child(child)
			child.queue_free()  # Free memory of the child
		# Queue self for deletion
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
