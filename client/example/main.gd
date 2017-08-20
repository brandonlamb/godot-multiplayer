extends Node

onready var ip_address = $"ui/Control/ip_address"
onready var port = $"ui/Control/port"
onready var max_players = $"ui/Control/max_players"
onready var player_name = $"ui/Control/player_name"
onready var dedicated = $"ui/Control/dedicated"
onready var message = $"ui/Control/message"
onready var host = $"ui/Control/host"
onready var connect = $"ui/Control/connect"

func _ready():
	gamestate.mainmenu = self

	host.connect("pressed", self, "_host_pressed")
	connect.connect("pressed", self, "_connect_pressed")

	for i in OS.get_cmdline_args():
		if i == '-sv':
			host_dedicated_server()

func _host_pressed():
	var name = player_name.text
	var p = port.text.to_int()
	var maxcl = max_players.text.to_int()
	var is_dedicated = dedicated.is_pressed()

	gamestate.sv_dedicated = is_dedicated
	gamestate.cl_name = name

	if (!gamestate.host_game(p, maxcl)):
		return

	set_control_enabled(false)

func _connect_pressed():
	var name = player_name.text
	var ip = ip_address.text
	var p = port.text.to_int()

	if (!gamestate.join_game(ip, p)):
		return

	gamestate.cl_name = name
	set_control_enabled(false)

func set_message(msg):
	message.text = str(msg)

func host_dedicated_server():
	var name = name.text
	var port = port.text.to_int()
	var maxcl = max_players.text.to_int()

	gamestate.sv_dedicated = true
	gamestate.cl_name = name

	if (!gamestate.host_game(port, maxcl)):
		return

	set_control_enabled(false);

func set_control_enabled(value):
	host.set_disabled(!value)
	connect.set_disabled(!value)

	if value:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

#func disable_control():
#	host.set_disabled(true)
#	connect.set_disabled(true)
#
#func enable_control():
#	host.set_disabled(false)
#	connect.set_disabled(false)
#
#	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_resize_pressed():
	#OS.set_window_size(Vector2(720, 320))
	#get_viewport().set_size_override(true, Vector2(3840, 2160))
	pass

func _on_ui_scale_value_changed(value):

	#get_node("ui/Control").rect_position = Vector2(3840/2, 2160/2)
	get_node("ui/Control").set_global_position(Vector2(3840/2, 2160/2))
	get_node("ui/Control").rect_scale = Vector2(value, value)
