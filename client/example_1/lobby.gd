extends Node

const NETWORK_MODE_MASTER = 1
const NETWORK_MODE_SLAVE = 2
const PLAYERS_PATH = "env/players/"

onready var ui = get_node("ui")

var spawn_points = []
var players = {}
var name = "Server"
var server_options = {
	"dedicated": false
}
var world

func _ready():
	var t = get_tree()
	t.connect("network_peer_connected", self, "_network_peer_connected")
	t.connect("network_peer_disconnected", self, "_network_peer_disconnected")

	t.connect("connected_to_server", self, "_connected_to_server")
	t.connect("connection_failed", self, "_connection_failed")
	t.connect("server_disconnected", self, "_server_disconnected")

func _network_peer_connected(id):
	if get_tree().is_network_server():
		players[id] = null

func _network_peer_disconnected(id):
	if get_tree().is_network_server() && players.has(id):
		player_disconnected(id)
		players.erase(id)

func _connected_to_server():
	rpc("player_joined", get_tree().get_network_unique_id(), name)
	#mainmenu.hide()

func _connection_failed():
	print("Failed connecting to the server")
	#mainmenu.set_message("Failed connecting to the server.")
	#end_game()

func _server_disconnected():
	print("Disconnected from server")
	#mainmenu.set_message("Disconnected from server.")
	#end_game()

func host_game(port, max_clients):
	var net = NetworkedMultiplayerENet.new()

	if net.create_server(port, max_clients) != OK:
		print("Cannot create a server on port ", port, "!")
		return false

	if server_options["dedicated"]:
		print("Server hosted on port ", port, ".")
		print("Max clients: ", max_clients)

	#net.set_compression_mode(net.COMPRESS_ZLIB)
	get_tree().set_network_peer(net)
	create_world()

func join_game(ip, port):
	var net = NetworkedMultiplayerENet.new()

	if net.create_client(ip, port) != OK:
		print("Cannot create a client on ip ", ip, " & port ", port, "!")
		return false

	print("Connecting to ", ip, ":", port, "..")

	#net.set_compression_mode(net.COMPRESS_ZLIB)
	get_tree().set_network_peer(net)

func player_connected(id):
	if id != 1:
		rpc_id(id, "create_world")

func player_disconnected(id):
	rpc("despawn_player", id)

func get_player_by_id(id):
	var path = PLAYERS_PATH + str(id)
	if !world.has_node(path):
		return null

	return world.get_node(path)

func get_players():
	var ret = []
	for i in world.get_node(PLAYERS_PATH).get_children():
		if !players.has(i.get_name().to_int()):
			continue
		ret.append(i)
	return ret

func setup_spawn_points():
	spawn_points.clear()
	spawn_points.append(Vector2(0, 10))
	spawn_points.append(Vector2(10, 10))
	spawn_points.append(Vector2(20, 30))
	spawn_points.append(Vector2(40, 10))
	spawn_points.append(Vector2(40, 40))

func world_ready():
	if !get_tree().is_network_server():
		rpc("player_ready", get_tree().get_network_unique_id())
	else:
		setup_spawn_points()

		if !sv_dedicated:
			create_host_player()




master func player_joined(id, name):
	if !players.has(id) || players[id] != null || !get_tree().is_network_server():
		return

	players[id] = name
	player_connected(id)

master func player_ready(id):
	if !players.has(id) || players[id] == null || !get_tree().is_network_server():
		return

	if id != 1:
		rpc_id(id, "clean_players")

		for i in world.get_node(PLAYERS_PATH).get_children():
			var pid = i.get_name().to_int()
			if pid == id:
				continue

			var pos = i.get_global_transform().origin
			rpc_id(id, "spawn_player", pid, players[pid], pos)

	var spawn_pos = get_random_spawnpoint()
	rpc("spawn_player", id, players[id], spawn_pos)

	chatmgr.broadcast_msg(str(players[id], " connected."))

sync func spawn_player(id, name, pos = null):
	if player_by_id(id) != null:
		return

	var inst = Node2D()
	inst.set_name(str(id))
	inst.player_name = str(name)

#	if (pos != null):
#		inst.set_global_transform(Transform(Matrix3(), pos))

	if id == get_tree().get_network_unique_id():
		inst.set_network_mode(NETWORK_MODE_MASTER)
	else:
		inst.set_network_mode(NETWORK_MODE_SLAVE)

	world.get_node(PLAYERS_PATH).add_child(inst)

sync func despawn_player(id):
	var node = get_player_by_id(id)
	if node != null:
		node.queue_free()

remote func create_world():
	world = preload("res://example_1/world.tscn").instance()
	world.set_name("world")
	get_parent().call_deferred("add_child", world)
	print("creating world")


