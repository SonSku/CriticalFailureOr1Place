extends Node

class_name DraggingItemControler

signal itemDropped(dropZoneName)

var dragging := false
var item_dragged: Items.TYPES  = Items.TYPES.EMPTY
var draggedItemScene = preload("res://Scenes/other/DraggedItem.tscn")
var itemRef

func startDragging(type: Items.TYPES):
	itemRef = draggedItemScene.instantiate()
	itemRef.type = type
	itemRef.position = get_viewport().get_mouse_position()
	get_tree().get_root().get_node("room").add_child(itemRef)
	
func emitItemDropped(zoneName):
	emit_signal("itemDropped", zoneName)
	
