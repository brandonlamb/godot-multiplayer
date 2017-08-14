extends Node2D

onready var ip_address = $"ui/ip_address"
onready var port = $"ui/port"
onready var max_players = $"ui/max_players"
onready var player_name = $"ui/player_name"
onready var dedicated = $"ui/dedicated"
onready var message = $"ui/message"
onready var host = $"ui/host"
onready var connect = $"ui/connect"

func _ready():
	gamestate.mainmenu = self

	host.connect("pressed", self, "_host_pressed")
	connect.connect("pressed", self, "_connect_pressed")

	for i in OS.get_cmdline_args():
		if i == '-sv':
			host_dedicated_server()

func _host_pressed():
	var name = player_name.get_text()
	var port = port.get_text().to_int()
	var maxcl = max_players.get_text().to_int()
	var is_dedicated = dedicated.is_pressed()

	gamestate.sv_dedicated = is_dedicated
	gamestate.cl_name = name

	if (!gamestate.host_game(port, maxcl)):
		return

	set_control_enabled(false)

func _connect_pressed():
	var name = player_name.get_text()
	var ip = ip_address.get_text()
	var port = port.get_text().to_int()

	if (!gamestate.join_game(ip, port)):
		return

	gamestate.cl_name = name
	set_control_enabled(false)

func set_message(msg):
	message.set_text(str(msg))

func host_dedicated_server():
	var name = name.get_text()
	var port = port.get_text().to_int()
	var maxcl = max_players.get_text().to_int()

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
