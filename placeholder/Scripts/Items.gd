extends Node

class_name Items

enum TYPES {
	BONE,
	DEFAULT
}

const ITEM_TEXTURES = {
	TYPES.DEFAULT: preload("res://icon.svg"),
	TYPES.BONE: preload("res://icon.svg")
}



enum DICE {
	EGYPT = 0,
	BITEHACK = 1,
	MEDIVAL = 2,
	FUTURE = 3
}
