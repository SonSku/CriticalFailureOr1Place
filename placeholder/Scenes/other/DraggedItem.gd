extends Node2D

var type = Items.TYPES.EMPTY
var isInDropZone = false
var dropZoneRef = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Sprite2D").texture = Items.ITEM_TEXTURES[type]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		self.position = get_global_mouse_position()
	elif Input.is_action_just_released("left_mouse_button_click"):
		if isInDropZone:
			var res = dropZoneRef.itemDropped(type)
			if res:
				Inventory.removeItem(type)
		self.queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("item_drop_zone"):
		dropZoneRef = body
		isInDropZone = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("item_drop_zone"):
		dropZoneRef = null
		isInDropZone = false
