extends Area2D

var isSkeletIn = false
var globBody

const OPEN_DOOR_DYSON_PUZZLE = preload("res://Scenes/open_door_dyson_puzzle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	isSkeletIn = true
	globBody = body

func _input(ev) -> void:
	if isSkeletIn:
		if Input.is_key_pressed(KEY_E):
			globBody.enabled = false
			LoadingScene.display_minigame(OPEN_DOOR_DYSON_PUZZLE)


func _on_body_exited(body: Node2D) -> void:
	isSkeletIn = false
