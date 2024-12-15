extends Area2D

var isSkeletIn = false
var globBody

@export var puzzle_name: String
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
		if Input.is_key_pressed(KEY_E) and (LoadingScene.get_state(puzzle_name) == null or !LoadingScene.get_state(puzzle_name)["blocked"]):
			globBody.enabled = false
			LoadingScene.display_minigame(puzzle_name)


func _on_body_exited(body: Node2D) -> void:
	isSkeletIn = false
