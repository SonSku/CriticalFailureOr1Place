extends Node2D

@onready var menu = get_node("BottomMenu")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	showItems()
	Inventory.inventory_update.connect(showItems)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func showItems():
	var i = 0
	for child in menu.get_children():
		var sprite = child.get_node("Sprite2D")
		if i < Inventory.items.size():
			sprite.texture = Items.ITEM_TEXTURES[Inventory.items[i].type]
			child.item = Inventory.items[i].type
		else:
			sprite.texture = Items.ITEM_TEXTURES[Items.TYPES.EMPTY]
			child.item = Items.TYPES.EMPTY
		i += 1
