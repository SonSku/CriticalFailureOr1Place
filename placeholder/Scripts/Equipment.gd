extends Node


class_name Equipment

signal inventory_update

var items = []
var dice = [0, 0, 0, 0]

# Define a structure for the items to store type and amount
class Item:
	var type: Items.TYPES
	var amount: int = 0

func addItem(type: Items.TYPES, amt := 1) -> void:
	for item in items:
		if item.type == type:
			item.amount += amt
			return
	var new_item = Item.new()
	new_item.type = type
	new_item.amount = amt
	items.append(new_item)
	emit_signal("inventory_update")

func removeItem(type: Items.TYPES, amt := 1) -> bool:
	for item in items:
		if item.type == type:
			if item.amount >= amt:
				item.amount -= amt
				if item.amount == 0:
					items.erase(item)
				emit_signal("inventory_update")
				return true
			return false
	return false

func hasItem(type: Items.TYPES) -> bool:
	for item in items:
		if item.type == type:
			return true
	return false

func enableDice(d: Items.DICE):
	dice[d] = 1
	emit_signal("inventory_update")

func disableDice(d: Items.DICE):
	dice[d] = 0
	emit_signal("inventory_update")
