extends CharacterBody2D

@onready var robot: CharacterBody2D = $"."

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(ev):
	if Input.is_action_just_pressed("move_up"):  # Użyj akcji zamiast klawiszy
		if get_parent().robot_y != 0:
			var temp_y_pos = get_parent().robot_y-1
			robot.position.y -= 64
	elif Input.is_action_just_pressed("move_down"):
		if get_parent().robot_y != 4:
			robot.position.y += 64
	elif Input.is_action_just_pressed("move_left"):
		if get_parent().robot_x != 0:
			robot.position.x -= 64
	elif Input.is_action_just_pressed("move_right"):
		if get_parent().robot_x != 3:
			robot.position.x += 64



func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	print("SIEMA")
