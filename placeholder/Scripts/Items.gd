extends Node

class_name Items

enum TYPES {
	BONE,
	EMPTY
}

const ITEM_TEXTURES = {
	TYPES.EMPTY: preload("res://Assets/empty item.png"),
	TYPES.BONE: preload("res://icon.svg")
}



enum DICE {
	EGYPT = 0,
	BITEHACK = 1,
	MEDIVAL = 2,
	FUTURE = 3
}
