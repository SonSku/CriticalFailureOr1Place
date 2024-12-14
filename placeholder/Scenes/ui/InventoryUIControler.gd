extends Node2D

@onready var menu = get_node("BottomMenu")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Inventory.addItem(Items.TYPES.BONE)
	showItems()
	Inventory.inventory_update.connect(showItems)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func showItems():
	var i = 0
	for child in menu.get_children():
		var sprite = child.get_node("Sprite2D")
		if i < Inventory.items.size():
			sprite.texture = Items.ITEM_TEXTURES[Inventory.items[i].type]
		else:
			sprite.texture = Items.ITEM_TEXTURES[Items.TYPES.EMPTY]
		i += 1
