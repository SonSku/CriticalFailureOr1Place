extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if LoadingScene.get_state("room2"):
		body.position.x = 1308
		body.position.y = 400



func _on_body_exited(body: Node2D) -> void:
	body.position.y = 1008
