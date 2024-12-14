extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const skelet_id = 'skelet_id'
const SKELETON = preload("res://Scenes/skeleton.tscn")
const GAME = preload("res://Scenes/game.tscn")

func _ready() -> void:
	var gotPos = LoadingScene.get_state("skelet")
	if gotPos:
		self.position = gotPos["position"]
	

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		var state = {
			"position": self.position
		}
		LoadingScene.save_state("skelet", state)
		get_tree().change_scene_to_file("res://Scenes/intro.tscn")
