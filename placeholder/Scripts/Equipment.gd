extends Node


class_name Equipment

var items = {}

var dice = [0,0,0,0]

func addItem(type: Items.TYPES, amt := 1) -> void:
	if items.has(type):
		items[type] += amt
	else:
		items[type] = amt

# Jak chcemy usunąć pare to w ife to robić
func removeItem(type: Items.TYPES, amt := 1) -> bool:
	if items.has(type) and items[type] >= amt:
		items[type] -= amt
		return true
	return false
	
func hasItem(type: Items.TYPES) -> bool:
	return items.has(type)
	
func enableDice(d: Items.DICE):
	dice[d] = 1
	
func disableDice(d: Items.DICE):
	dice[d] = 0
