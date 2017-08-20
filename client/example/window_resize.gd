extends Node

onready var viewport = get_viewport()

var minimum_size = Vector2(1920, 1080)

func _ready():
	OS.set_window_maximized(true)
	#get_viewport().set_size_override(true, Vector2(3840, 2160))

	#viewport.connect("size_changed", self, "window_resize")
	#window_resize()
	pass

func window_resize():
	var current_size = OS.get_window_size()

	var scale_factor = minimum_size.y/current_size.y
	var new_size = Vector2(current_size.x*scale_factor, minimum_size.y)

	if new_size.y < minimum_size.y:
		scale_factor = minimum_size.y / new_size.y
		new_size = Vector2(new_size.x*scale_factor, minimum_size.y)

	if new_size.x < minimum_size.x:
		scale_factor = minimum_size.x/new_size.x
		new_size = Vector2(minimum_size.x, new_size.y*scale_factor)

	#viewport.set_size_override(true, new_size)
	OS.set_window_size(Vector2(720, 320))
