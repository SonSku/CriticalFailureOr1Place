extends Node

class_name Items

enum TYPES {
	BONE,
	EMPTY,
	ORANGE_KEY,
	RED_KEY,
	CHAIR,
	ROMPER,
	KOMPOT,
	REDBUL
}

const ITEM_TEXTURES = {
	TYPES.EMPTY: preload("res://Assets/empty item.png"),
	TYPES.BONE: preload("res://Assets/placeholder_100x100.png"),
	TYPES.ORANGE_KEY: preload("res://Assets/orange key.png"),
	TYPES.RED_KEY: preload("res://Assets/red key.png"),
	TYPES.CHAIR: preload("res://Assets/stolek_icon.png"),
	TYPES.ROMPER: preload("res://Assets/ikona_romperek.png"),
	TYPES.KOMPOT: preload("res://Assets/ikona_kompot.png"),
	TYPES.REDBUL: preload("res://Assets/ikona_redbull.png")
}

enum DICE {
	EGYPT = 0,
	BITEHACK = 1,
	MEDIVAL = 2,
	FUTURE = 3
}
