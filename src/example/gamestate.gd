extends Node

const NETWORK_MODE_MASTER = 1
const NETWORK_MODE_SLAVE = 2

var sv_dedicated
var cl_name
var cl_chatting

var players
var mainmenu
var world
var chatmgr

var spawn_points
var spawn_delay
var players_path

func _init():
	sv_dedicated = false
	cl_name = ""
	cl_chatting = false
	spawn_points = []
	spawn_delay = 3.0
	players_path = "env/players/"

	reset_variables()

func reset_variables():
	players = {}
	spawn_points = []
	cl_chatting = false

func _ready():
	var t = get_tree()
	t.connect("network_peer_connected", self, "_peer_connected")
	t.connect("network_peer_disconnected", self, "_peer_disconnected")

	t.connect("connected_to_server", self, "_client_success")
	t.connect("connection_failed", self, "_client_failed")
	t.connect("server_disconnected", self, "_client_disconnected")

#func _input(ie):
#	if (ie.type == InputEvent.KEY && !cl_chatting):
#		if (ie.pressed && ie.scancode == KEY_ESCAPE):
#			end_game()#get_tree().quit()

func host_game(port, max_clients):
	var net = NetworkedMultiplayerENet.new()
	if (net.create_server(port, max_clients) != OK):
		print("Cannot create a server on port ", port, "!")
		return false

	#net.set_compression_mode(net.COMPRESS_ZLIB)
	get_tree().set_network_peer(net)

	if (sv_dedicated):
		print("Server hosted on port ", port, ".")
		print("Max clients: ", max_clients)

	create_world()
	return true

func join_game(ip, port):
	var net = NetworkedMultiplayerENet.new()
	if (net.create_client(ip, port) != OK):
		print("Cannot create a client on ip ", ip, " & port ", port, "!")
		return false

	#net.set_compression_mode(net.COMPRESS_ZLIB)
	get_tree().set_network_peer(net)

	print("Connecting to ", ip, ":", port, "..")
	return true

func end_game():
	mainmenu.set_control_enabled(true)

	if (world != null):
		mainmenu.show()

		world.get_parent().remove_child(world)
		world.call_deferred("free")
		world = null

	reset_variables()
	get_tree().call_deferred("set_network_peer", null)

func _peer_connected(id):
	if (!get_tree().is_network_server()):
		return

	players[id] = null

func _peer_disconnected(id):
	if (!get_tree().is_network_server()):
		return

	if (players.has(id)):
		player_disconnected(id)
		players.erase(id)

func _client_success():
	rpc("player_joined", get_tree().get_network_unique_id(), cl_name)
	mainmenu.hide()

func _client_failed():
	mainmenu.set_message("Failed connecting to the server.")
	end_game()

func _client_disconnected():
	mainmenu.set_message("Disconnected from server.")
	end_game()

master func player_joined(id, name):
	if (!players.has(id) || players[id] != null || !get_tree().is_network_server()):
		return

	players[id] = name
	player_connected(id)

master func player_ready(id):
	if (!players.has(id) || players[id] == null || !get_tree().is_network_server()):
		return

	if (id != 1):
		rpc_id(id, "clean_players")

		for i in world.get_node(players_path).get_children():
			var pid = i.get_name().to_int()
			if (pid == id):
				continue

			var pos = i.get_global_transform().origin
			rpc_id(id, "spawn_player", pid, players[pid], pos)

	var spawn_pos = get_random_spawnpoint()
	rpc("spawn_player", id, players[id], spawn_pos)

	chatmgr.broadcast_msg(str(players[id], " connected."))

func player_connected(id):
	if (id != 1):
		rpc_id(id, "create_world")

func player_disconnected(id):
	rpc("despawn_player", id)

	chatmgr.broadcast_msg(str(players[id], " disconnected."))

remote func create_world():
	#world = load("res://scenes/world.tscn").instance()
	#world.set_name("world")
	#get_tree().get_root().call_deferred("add_child", world)
	print("creating world")

func create_host_player():
	if (!get_tree().is_network_server()):
		return

	_peer_connected(1)
	player_joined(1, cl_name)
	player_ready(1)

func world_ready():
	mainmenu.hide()

	if (!get_tree().is_network_server()):
		rpc("player_ready", get_tree().get_network_unique_id())
	else:
		setup_spawnpoints()

		if (!sv_dedicated):
			create_host_player()

remote func clean_players():
	if (!world):
		return
	for i in get_players():
		i.queue_free()

sync func spawn_player(id, name, pos = null):
	if (player_by_id(id) != null):
		return

	var inst = Node2D()
	inst.set_name(str(id))
	inst.player_name = str(name)

#	if (pos != null):
#		inst.set_global_transform(Transform(Matrix3(), pos))

	if (id == get_tree().get_network_unique_id()):
		inst.set_network_mode(NETWORK_MODE_MASTER)
	else:
		inst.set_network_mode(NETWORK_MODE_SLAVE)

	world.get_node(players_path).add_child(inst)

sync func despawn_player(id):
	var node = player_by_id(id)
	if (node == null):
		return
	node.queue_free()

func player_by_id(id):
	var path = players_path+str(id)
	if (!world.has_node(path)):
		return null
	return world.get_node(path)

func teleport_player(from, to):
	var p1 = player_by_id(from)
	var p2 = player_by_id(to)

	if (!p1 || !p2):
		return

	p1.set_global_transform(p2.get_global_transform())

func setup_spawnpoints():
	spawn_points.clear()
	spawn_points.append(Vector2(0, 2))
	spawn_points.append(Vector2(2, 2))
	spawn_points.append(Vector2(1, 2))
	spawn_points.append(Vector2(2, 2))
	spawn_points.append(Vector2(3, 2))

func get_random_spawnpoint():
	return spawn_points[int(rand_range(0, spawn_points.size()))]

func get_players():
	var ret = []
	for i in world.get_node(players_path).get_children():
		if (!players.has(i.get_name().to_int())):
			continue
		ret.append(i)
	return ret
