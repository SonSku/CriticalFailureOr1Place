extends Area2D
var isIn = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	isIn = true
	if isIn and Input.is_action_pressed("place_on_chair"):
		body.position.x = 1308
		body.position.y = 300
