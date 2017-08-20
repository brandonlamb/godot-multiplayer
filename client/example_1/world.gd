extends Node

func _ready():
	get_tree().get_root().get_node("game/lobby").world_ready()
