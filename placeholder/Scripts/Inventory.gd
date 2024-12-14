extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func showItems(page: int) -> void:
	for item in Equipment.items:
		var item_row = HBoxContainer.new()

		var item_image = TexureRect.new()
		item_image.texture = load(item.texture)
		item_row.add_child(item_image)

		var item_name = Label.new()
		item_name.text = str(item.text)
		item_row.add_child(item_name)

		add_child(item_row)
