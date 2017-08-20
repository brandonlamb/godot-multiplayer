extends Node

func _ready():
	print("world is ready")
	get_parent().get_node("lobby").world_ready()
