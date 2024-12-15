extends Node2D

@onready var animationPlayer = $AnimationPlayer
var open := false
var animFinished := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = -605


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func toggleDisplay():
	if animFinished:
		if not open:
			animationPlayer.play("SideMenuShow")
			open = true
		else:
			animationPlayer.play("SideMenuHide")
			open = false
		animFinished = false
			


func _input(event: InputEvent) -> void:
		if event is InputEventKey and event.pressed and event.keycode == KEY_TAB:
			toggleDisplay()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		toggleDisplay()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	animFinished = true