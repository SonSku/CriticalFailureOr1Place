extends Node2D

static var puzzel_name = "one_line"

var tablica_2d
var robot_x = 1
var robot_y = 0
var field_counter = 0

func _ready():
	tablica_2d = []
	tablica_2d.append([-1, 0, 0, 0, -1])
	tablica_2d.append([0, 0, -1, 0, 0])
	tablica_2d.append([0, 0, 2, 0, 0])
	tablica_2d.append([-1, -1, 0, 0, -1])
	print(tablica_2d)

	for dziecko in get_children():
		if dziecko is Area2D:
			dziecko.connect("body_entered", _on_area2d_body_entered.bind(dziecko))

func _on_area2d_body_entered(cialo, pole):
	field_counter+=1
	var ids = pole.name.split("")
	robot_x = int(ids[1])
	robot_y = int(ids[0])
	if tablica_2d[int(ids[1])][int(ids[0])] == 0:
		tablica_2d[int(ids[1])][int(ids[0])] = 1
	if robot_x == 0:
		var new_texture = preload("res://Assets/clean_tile_L.png")
		pole.get_node("Sprite2D").texture = new_texture
	elif robot_x == 3:
		var new_texture = preload("res://Assets/clean_tile_R.png")
		pole.get_node("Sprite2D").texture = new_texture
	if robot_y == 0:
		var new_texture = preload("res://Assets/clean_tile_T.png")
		pole.get_node("Sprite2D").texture = new_texture
	elif robot_y == 4:
		var new_texture = preload("res://Assets/clean_tile_B.png")
		pole.get_node("Sprite2D").texture = new_texture
	if robot_x > 0 and robot_x < 3 and robot_y > 0 and robot_y < 4:
		var new_texture = preload("res://Assets/clean_tile_C.png")
		pole.get_node("Sprite2D").texture = new_texture
	if tablica_2d[int(ids[1])][int(ids[0])] == 2 and field_counter == 14:
		print("YOU WON")
		var state = {
			"blocked": true
		}
		LoadingScene.save_state(puzzel_name, state)
		get_tree().root.get_node("room").get_node("Skeleton").enabled = true
		Inventory.addItem(Items.TYPES.RED_KEY)
		queue_free()
	elif tablica_2d[int(ids[1])][int(ids[0])] != 2 and field_counter == 14:
		print("HAHA YOU LOST!")

func _process(delta: float) -> void:
	pass
	
func _input(ev) -> void:
	if Input.is_key_pressed(KEY_Q):
		get_tree().root.get_node("room").get_node("Skeleton").enabled = true
		queue_free()
