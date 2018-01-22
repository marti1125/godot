extends Node2D

onready var window_size = OS.get_window_size()
onready var player = get_node("Player")
onready var player_world_pos = get_player_world_pos()


func _ready():
	var canvas_transform = get_viewport().get_canvas_transform()
	canvas_transform[2] = player_world_pos * window_size
	get_viewport().set_canvas_transform(canvas_transform)


func get_player_world_pos():
	# Converts the player position to the map he's on. Returns the map id/coordinates as Vector2
	var pos = player.get_pos() - player.size / 2
	var x = floor(pos.x / window_size.x)
	var y = floor(pos.y / window_size.y)
	return Vector2(x, y)

func update_camera():
	var new_player_grid_pos = get_player_world_pos()
	var transform = Matrix32()
	
	if new_player_grid_pos != player_world_pos:
		player_world_pos = new_player_grid_pos
		transform = get_viewport().get_canvas_transform()
		transform[2] = - player_world_pos  * window_size
		get_viewport().set_canvas_transform(transform)
	
	return transform
