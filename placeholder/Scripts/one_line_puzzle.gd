extends Node2D

var tablica_2d
var robot_x = 1
var robot_y = 0

func _ready():
	tablica_2d = []
	tablica_2d.append([-1, 0, 0, 0, -1])
	tablica_2d.append([0, 0, 0, 0, 0])
	tablica_2d.append([0, 0, 0, 0, 0])
	tablica_2d.append([-1, -1, 0, 0, -1])
	print(tablica_2d)
	
	for dziecko in get_children():
		if dziecko is Area2D:
			dziecko.connect("body_entered", _on_area2d_body_entered.bind(dziecko))

func _on_area2d_body_entered(cialo, pole):
	print("Kolizja! Area2D:", str(cialo), "skolidowało z:", pole)
	var ids = pole.name.split("")
	robot_x = int(ids[1])
	robot_y = int(ids[0])
	tablica_2d[int(ids[1])][int(ids[0])] = 1
	var new_texture = preload("res://Assets/green.png")
	pole.get_node("Sprite2D").texture = new_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
