GDPC                                                                                 <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stexPK      n      8M�F�_ќR��A��j@   res://.import/white.png-e043fe6706f61c9881899d0215f0f707.stex   �>      e       � Cb��I֎p���d�(   res://com.brandonlamb.server/game.tscn  �      U       =a~*5�]���L���(   res://com.brandonlamb.server/lobby.gd          �      �C���ɯ�Z�|�$   res://com.brandonlamb.server/ui.gd  �)      M      ��?#W�h6K
$L�$   res://com.brandonlamb.server/ui.tscn0,      �      w�93�*@�#����0   res://com.brandonlamb.server/white.png.import   `?      �      ��{���SI���,ϰԶ(   res://com.brandonlamb.server/world.gd   A      K       �B~��fc�F���S   res://default_env.tres  `A      �	      �ǹI-̸de��A��   res://icon.png.import   �X      �      .�ma���P�n�a�K   res://project.binarypZ      �      [&�,@i�xFX��            [gd_scene load_steps=5 format=2]

[ext_resource path="res://com.brandonlamb.server/lobby.gd" type="Script" id=1]
[ext_resource path="res://com.brandonlamb.server/ui.gd" type="Script" id=2]
[ext_resource path="res://com.brandonlamb.server/white.png" type="Texture" id=3]
[ext_resource path="res://com.brandonlamb.server/world.gd" type="Script" id=4]

[node name="game" type="Node"]

[node name="gamestate" type="Node" parent="."]

[node name="lobby" type="Node" parent="."]

script = ExtResource( 1 )

[node name="ui" type="Control" parent="lobby"]

margin_right = 640.0
margin_bottom = 480.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 0
size_flags_vertical = 0
script = ExtResource( 2 )
_sections_unfolded = [ "Anchor", "Grow Direction", "Rect", "Size Flags", "Visibility" ]

[node name="background" type="TextureRect" parent="lobby/ui"]

modulate = Color( 0.258824, 0.258824, 0.258824, 1 )
margin_right = 640.0
margin_bottom = 480.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
size_flags_horizontal = 1
size_flags_vertical = 1
texture = ExtResource( 3 )
expand = true
stretch_mode = 0
_sections_unfolded = [ "Anchor", "Focus", "Grow Direction", "Hint", "Mouse", "Rect", "Size Flags", "Theme", "Visibility" ]

[node name="ip_address" type="LineEdit" parent="lobby/ui"]

margin_left = 20.0
margin_top = 40.0
margin_right = 210.0
margin_bottom = 70.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
text = "127.0.0.1"
expand_to_len = false
focus_mode = 2
placeholder_text = "IPv4 Address"
placeholder_alpha = 0.6
caret_blink = false
caret_blink_speed = 0.65
_sections_unfolded = [ "Anchor", "Placeholder", "Rect", "Size Flags" ]

[node name="label" type="Label" parent="lobby/ui/ip_address"]

margin_top = -17.0
margin_right = 190.0
margin_bottom = -3.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
size_flags_horizontal = 1
size_flags_vertical = 4
text = "IP Address"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1
_sections_unfolded = [ "Anchor" ]

[node name="port" type="LineEdit" parent="lobby/ui"]

margin_left = 20.0
margin_top = 100.0
margin_right = 78.0
margin_bottom = 130.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
text = "6969"
expand_to_len = false
focus_mode = 2
placeholder_text = "Port"
placeholder_alpha = 0.6
caret_blink = false
caret_blink_speed = 0.65
_sections_unfolded = [ "Anchor", "Placeholder", "Rect", "Size Flags" ]

[node name="label" type="Label" parent="lobby/ui/port"]

margin_top = -17.0
margin_right = 190.0
margin_bottom = -3.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Port"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1
_sections_unfolded = [ "Anchor" ]

[node name="max_players" type="SpinBox" parent="lobby/ui"]

margin_left = 130.0
margin_top = 100.0
margin_right = 210.0
margin_bottom = 130.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
min_value = 1.0
max_value = 32.0
step = 1.0
page = 0.0
value = 16.0
exp_edit = false
rounded = false
editable = true
prefix = ""
suffix = ""
_sections_unfolded = [ "Anchor", "Placeholder", "Rect", "Size Flags" ]

[node name="label" type="Label" parent="lobby/ui/max_players"]

margin_top = -17.0
margin_right = 80.0
margin_bottom = -3.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Max Players"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="start_server" type="Button" parent="lobby/ui"]

margin_left = 20.0
margin_top = 140.0
margin_right = 110.0
margin_bottom = 160.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
toggle_mode = false
enabled_focus_mode = 2
shortcut = null
group = null
text = "Start Server"
flat = false
_sections_unfolded = [ "Anchor", "Rect", "Size Flags" ]

[node name="stop_server" type="Button" parent="lobby/ui"]

margin_left = 120.0
margin_top = 140.0
margin_right = 210.0
margin_bottom = 160.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
disabled = true
toggle_mode = false
enabled_focus_mode = 2
shortcut = null
group = null
text = "Stop Server"
flat = false
_sections_unfolded = [ "Rect", "Size Flags" ]

[node name="messages" type="RichTextLabel" parent="lobby/ui"]

margin_left = 220.0
margin_top = 40.0
margin_right = 620.0
margin_bottom = 460.0
rect_pivot_offset = Vector2( 0, 0 )
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
bbcode_enabled = true
bbcode_text = ""
visible_characters = -1
percent_visible = 1.0
_sections_unfolded = [ "BBCode" ]

[node name="world" type="Node" parent="."]

script = ExtResource( 4 )

[node name="players" type="Node" parent="world"]

[node name="zones" type="Node" parent="world"]

[connection signal="pressed" from="lobby/ui/start_server" to="lobby/ui" method="_on_start_server_pressed"]

[connection signal="pressed" from="lobby/ui/stop_server" to="lobby/ui" method="_on_stop_server_pressed"]


           extends Node

const NETWORK_MODE_MASTER = 1
const NETWORK_MODE_SLAVE = 2
const PLAYERS_PATH = "players/"

onready var ui = get_node("ui")
onready var world = get_parent().get_node("world")

slave var name = "Player"

var players = {}

func _ready():
	ui.connect("server_started", self, "_on_server_started")
	ui.connect("server_stopped", self, "_on_server_stopped")

	var t = get_tree()
	t.connect("network_peer_connected", self, "_network_peer_connected")
	t.connect("network_peer_disconnected", self, "_network_peer_disconnected")

	t.connect("connected_to_server", self, "_connected_to_server")
	t.connect("connection_failed", self, "_connection_failed")
	t.connect("server_disconnected", self, "_server_disconnected")

func _on_server_started(ctx):
	print("Starting server")
	ui.add_message("Starting server")

	if !host_game(ctx["ip_address"], ctx["port"], ctx["max_clients"]):
		ui.add_message(str("Unable to start server on ip:port ", ctx["ip_address"], ":", ctx["port"]))

func _on_server_stopped():
	print("Stopping server")
	ui.add_message("Stopping server")
	get_tree().call_deferred("set_network_peer", null)

func _network_peer_connected(id):
	ui.add_message(str("_network_peer_connected ", id))
	if get_tree().is_network_server():
		players[id] = null

func _network_peer_disconnected(id):
	ui.add_message(str("_network_peer_disconnected ", id))
	if get_tree().is_network_server() && players.has(id):
		player_disconnected(id)
		players.erase(id)

func _connected_to_server():
	ui.add_message("_connected_to_server")
	rpc("player_joined", get_tree().get_network_unique_id(), name)
	#mainmenu.hide()

func _connection_failed():
	print("Failed connecting to the server")
	ui.add_message("_connection_failed")
	#mainmenu.set_message("Failed connecting to the server.")
	#end_game()

func _server_disconnected():
	print("Disconnected from server")
	ui.add_message("_server_disconnected")
	#mainmenu.set_message("Disconnected from server.")
	#end_game()

func host_game(ip, port, max_clients):
	var net = NetworkedMultiplayerENet.new()
	net.set_bind_ip(ip)
	net.set_compression_mode(net.COMPRESS_ZLIB)

	if net.create_server(port, max_clients) != OK:
		print("Cannot create a server on ip:port ", ip, ":", port, "!")
		ui.add_message(str("Cannot create a server on ip:port ", ip, ":", port, "!"))
		return false

	print("Server hosted on ip:port ", ip, ":", port, ".")
	ui.add_message(str("Server hosted on ip:port ", ip, ":", port, "."))
	print("Max clients: ", max_clients)
	ui.add_message(str("Max clients: ", max_clients))

	get_tree().set_network_peer(net)
	#create_world()
	return true

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

func world_ready():
	if !get_tree().is_network_server():
		rpc("player_ready", get_tree().get_network_unique_id())



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

	#chatmgr.broadcast_msg(str(players[id], " connected."))

sync func spawn_player(id, name, pos = null):
	if player_by_id(id) != null:
		return

	var inst = Node2D()
	inst.set_name(str(id))
	inst.player_name = str(name)

	if id == get_tree().get_network_unique_id():
		inst.set_network_mode(NETWORK_MODE_MASTER)
	else:
		inst.set_network_mode(NETWORK_MODE_SLAVE)

	world.get_node(PLAYERS_PATH).add_child(inst)

sync func despawn_player(id):
	var node = get_player_by_id(id)
	if node != null:
		node.queue_free()
        extends Control

signal server_started(ctx)
signal server_stopped()

func _on_start_server_pressed():
	var ctx = {
		"ip_address": get_node("ip_address").text,
		"port": get_node("port").text.to_int(),
		"max_clients": get_node("max_players").value
	}

	get_node("start_server").disabled = true
	get_node("stop_server").disabled = false

	emit_signal("server_started", ctx)

func _on_stop_server_pressed():
	get_node("start_server").disabled = false
	get_node("stop_server").disabled = true

	emit_signal("server_stopped")

func add_message(msg):
	get_node("messages").add_text(msg + "\n")   [gd_scene load_steps=2 format=2]

[ext_resource path="res://example/white.png" type="Texture" id=1]

[node name="ui" type="CanvasLayer"]

layer = 1
offset = Vector2( 0, 0 )
rotation = 0.0
scale = Vector2( 1, 1 )

[node name="ui" type="Control" parent="."]

anchor_left = 2
anchor_top = 2
anchor_right = 2
anchor_bottom = 2
margin_left = 960.0
margin_top = 540.0
margin_right = -64.0
margin_bottom = -60.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 0
size_flags_vertical = 0
_sections_unfolded = [ "Anchor", "Grow Direction", "Rect", "Size Flags", "Visibility" ]

[node name="background" type="TextureRect" parent="ui"]

modulate = Color( 0.258824, 0.258824, 0.258824, 1 )
margin_right = 1024.0
margin_bottom = 600.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
size_flags_horizontal = 1
size_flags_vertical = 1
texture = ExtResource( 1 )
expand = true
stretch_mode = 0
_sections_unfolded = [ "Anchor", "Focus", "Grow Direction", "Hint", "Mouse", "Rect", "Size Flags", "Theme", "Visibility" ]

[node name="ip_address" type="LineEdit" parent="ui"]

anchor_left = 2
anchor_top = 2
anchor_right = 2
anchor_bottom = 2
margin_left = 212.0
margin_top = 113.0
margin_right = 22.0
margin_bottom = 83.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
text = "127.0.0.1"
expand_to_len = false
focus_mode = 2
placeholder_text = "IPv4 Address"
placeholder_alpha = 0.6
caret_blink = false
caret_blink_speed = 0.65
_sections_unfolded = [ "Anchor", "Placeholder", "Rect", "Size Flags" ]

[node name="port" type="LineEdit" parent="ui"]

anchor_left = 2
anchor_top = 2
anchor_right = 2
anchor_bottom = 2
margin_left = 2.0
margin_top = 113.0
margin_right = -188.0
margin_bottom = 83.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
text = "6969"
expand_to_len = false
focus_mode = 2
placeholder_text = "Port"
placeholder_alpha = 0.6
caret_blink = false
caret_blink_speed = 0.65
_sections_unfolded = [ "Anchor", "Placeholder", "Rect", "Size Flags" ]

[node name="max_players" type="LineEdit" parent="ui"]

anchor_left = 2
anchor_top = 2
anchor_right = 2
anchor_bottom = 2
margin_left = 212.0
margin_top = 63.0
margin_right = 22.0
margin_bottom = 33.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
text = "32"
expand_to_len = false
focus_mode = 2
placeholder_text = "Max Players"
placeholder_alpha = 0.6
caret_blink = false
caret_blink_speed = 0.65
_sections_unfolded = [ "Anchor", "Placeholder", "Rect", "Size Flags" ]

[node name="player_name" type="LineEdit" parent="ui"]

anchor_left = 2
anchor_top = 2
anchor_right = 2
anchor_bottom = 2
margin_left = 2.0
margin_top = 63.0
margin_right = -188.0
margin_bottom = 33.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
text = "Player"
expand_to_len = false
focus_mode = 2
placeholder_text = "Player Name"
placeholder_alpha = 0.6
caret_blink = false
caret_blink_speed = 0.65
_sections_unfolded = [ "Anchor", "Placeholder", "Rect", "Size Flags" ]

[node name="dedicated" type="CheckBox" parent="ui"]

margin_left = 300.0
margin_top = 280.0
margin_right = 326.0
margin_bottom = 303.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
toggle_mode = true
enabled_focus_mode = 2
shortcut = null
group = null
flat = false
align = 0

[node name="message" type="Label" parent="ui"]

margin_left = 300.0
margin_top = 307.0
margin_right = 700.0
margin_bottom = 327.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
size_flags_horizontal = 1
size_flags_vertical = 4
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="host" type="Button" parent="ui"]

margin_left = 300.0
margin_top = 340.0
margin_right = 490.0
margin_bottom = 390.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
toggle_mode = false
enabled_focus_mode = 2
shortcut = null
group = null
text = "Host"
flat = false
_sections_unfolded = [ "Rect", "Size Flags" ]

[node name="connect" type="Button" parent="ui"]

margin_left = 510.0
margin_top = 340.0
margin_right = 700.0
margin_bottom = 390.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
size_flags_horizontal = 1
size_flags_vertical = 1
toggle_mode = false
enabled_focus_mode = 2
shortcut = null
group = null
text = "Connect"
flat = false
_sections_unfolded = [ "Rect", "Size Flags" ]


         GDST              I   PNG �PNG

   IHDR         �wS�   IDAT�c���? ��X�k    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/white.png-e043fe6706f61c9881899d0215f0f707.stex"

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=true
   extends Node

func _ready():
	get_parent().get_node("lobby").world_ready()
     [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

radiance_size = 4
sky_top_color = Color( 0.0470588, 0.454902, 0.976471, 1 )
sky_horizon_color = Color( 0.556863, 0.823529, 0.909804, 1 )
sky_curve = 0.25
sky_energy = 1.0
ground_bottom_color = Color( 0.101961, 0.145098, 0.188235, 1 )
ground_horizon_color = Color( 0.482353, 0.788235, 0.952941, 1 )
ground_curve = 0.01
ground_energy = 1.0
sun_color = Color( 1, 1, 1, 1 )
sun_latitude = 35.0
sun_longitude = 0.0
sun_angle_min = 1.0
sun_angle_max = 100.0
sun_curve = 0.05
sun_energy = 16.0
texture_size = 2

[resource]

background_mode = 2
background_sky = SubResource( 1 )
background_sky_scale = 1.0
background_color = Color( 0, 0, 0, 1 )
background_energy = 1.0
background_canvas_max_layer = 0
ambient_light_color = Color( 0, 0, 0, 1 )
ambient_light_energy = 1.0
ambient_light_sky_contribution = 0.0
fog_enabled = false
fog_color = Color( 0.5, 0.6, 0.7, 1 )
fog_sun_color = Color( 1, 0.9, 0.7, 1 )
fog_sun_amount = 0.0
fog_depth_enabled = true
fog_depth_begin = 10.0
fog_depth_curve = 1.0
fog_transmit_enabled = false
fog_transmit_curve = 1.0
fog_height_enabled = false
fog_height_min = 0.0
fog_height_max = 100.0
fog_height_curve = 1.0
tonemap_mode = 0
tonemap_exposure = 1.0
tonemap_white = 1.0
auto_exposure_enabled = false
auto_exposure_scale = 0.4
auto_exposure_min_luma = 0.05
auto_exposure_max_luma = 8.0
auto_exposure_speed = 0.5
ss_reflections_enabled = false
ss_reflections_max_steps = 64
ss_reflections_fade_in = 0.15
ss_reflections_fade_out = 2.0
ss_reflections_depth_tolerance = 0.2
ss_reflections_roughness = true
ssao_enabled = false
ssao_radius = 1.0
ssao_intensity = 1.0
ssao_radius2 = 0.0
ssao_intensity2 = 1.0
ssao_bias = 0.01
ssao_light_affect = 0.0
ssao_color = Color( 0, 0, 0, 1 )
ssao_blur = true
dof_blur_far_enabled = false
dof_blur_far_distance = 10.0
dof_blur_far_transition = 5.0
dof_blur_far_amount = 0.1
dof_blur_far_quality = 1
dof_blur_near_enabled = false
dof_blur_near_distance = 2.0
dof_blur_near_transition = 1.0
dof_blur_near_amount = 0.1
dof_blur_near_quality = 1
glow_enabled = false
glow_levels/1 = false
glow_levels/2 = false
glow_levels/3 = true
glow_levels/4 = false
glow_levels/5 = true
glow_levels/6 = false
glow_levels/7 = false
glow_intensity = 0.8
glow_strength = 1.0
glow_bloom = 0.0
glow_blend_mode = 2
glow_hdr_threshold = 1.0
glow_hdr_scale = 2.0
glow_bicubic_upscale = false
adjustment_enabled = false
adjustment_brightness = 1.0
adjustment_contrast = 1.0
adjustment_saturation = 1.0

         GDST@   @           R  PNG �PNG

   IHDR   @   @   �iq�  IDATx�ݛyp��}�?�{�]iu��[`@ۀm�m I7v=5i��i��Ɠ6�;��I/��z�qk �t�z��0�D&��I����qHH�k������I�T��+i����ٙw�������=�#��2��3�[�z\
�I	�@(Y�|�HIH�KDȷ��<�>`e����5��,���*O$�3�R-i!�D"o��B B�(
���N�3�P��By���}M��a���Zǵ�z)�'���7�LL������r����3�w�N��|�r�Fk���i.2��W�ۻ�G�������-�T�b�	� ��Y��4W�;^�\�P0m���Ht�aF{GT�Q\I������Hk�Zb2�th�^��k�o\{�[����U��6��Cy׼V��a	3�,�A􏙽�re˫#�Q��O�M������=����&�ۙ�~���o���GNة�)�E����wWN�x��M�3m�`L���f��SY�xkf��B�UV�����%�	�?L���D[ΎIO�$�x=.�F`�2�n�}Rʊd*9&���b-��g4~ %K�ɧd�o��	�P0m>�V���i$�I�4��lh\���DܓG�J�s�x�f⩚i�_=OՌȊ�J�LH$i���<d�Rj�"�!G� ��&���<~w V��T$D�]�������TJu:�
MJ��̋�Q��#���1��_���d�F&+�e�\A����K]y�)R��eɾJ�+��Ǽ�
w��cĲ���yH	Be\66���Y\5�Fgq5��^Z�LO�L�x�؍+�45uT���@ɸ(4㩚AK��D.���s�T�8=D����Q�K&}3>�:K��}�y�D�oo�JD��BQ(��1*�}T�7?�� ��!аEw�r��M�C/R����?�{�g,"|� fd�2��tgv��P���h^?B\e�)�s�2�];���P���	�݃w�!����f>,�⅟���pWLA��4|S��s��aS���F�Y�(�C7GU���>��)��n\AQT�I�Ը�"�يe��J�3�G����G��4o�x�EK������ׯn7��I���+�R�t���!pWN#�����6Ap�*<�C��i(����}�q�oK�P��Q�tZ�Z�98
�?�&z��������O��|�iA���3�����R���:V���+��e�w����m���'\��B�/~D��mHڰ���{���7aJMz���Юa���֟}+����
+�����y7Cf��LFQ��L�i��]�n�f^M!>�F��`�N��Jo,���G�K�K��̔ E^�X�C���������W���b�3Q���ay]__U�C�و��.�&�ydA��(Ǯ�o�S�o��߭���|<<���w������{L�?��o|�U���ٳ��{?B��K���ȷ�˳��Gkw4��*r��s�:5���Ϟ>�����Z��wߍCSx��t	�\}PfL���NGURJ^�Ǘع���M���/=�s�}���N�m�3�p�*+�T %4�F<if�[{�T�N�o����N:}�ۛY�r/�����O�κ7>�-�^��{���o��m�O�?��[��k�nO+�E㹕�X���~pϭ�*w�*�L+潟�7�����.�����>&G������烈;m������������4eNtU��)��Ay�ဤys�Dl��o�M�2���Q�b*�~Y��[N6Y�0j�m�M/%f7��͞3��H��#;0Ʉ�P��h��������H)9w=<j�v@W$��: xꩵ�a4����Y�$;��b�q�jIɎ#����JJ�]Y��Z ~}�]���1c��o�u��H�`0Ȇ��Y�d	���p8X�|�7�F{����X���{��+lظ�e����p�iK�.e����e$ذkl��c��C1�����o50�������CJ����|���1�����l}7�4y������y�/�u����v�c�jc^	^�����Xd��B|N�N#����l�,���U�~��$x��s�P4�_�}��I~M	�:	Ǔ������y�k�����w��}Gkc���?}�$K�. �l�ȹ�A^��a>��¶\��2����G�м�h� �7��	��
Qt�D�j+'�ƌ��2~ݤ�=���P�mY[�;Z�w�d�8ܔ�w)�}�ص�=Gɵ�?rf9Z�:���� S	R�P�wC��]�"=��!�X+%tbONHiq�'�k97"�ܕS�^���� zN�I��|h>?�'��+B���}�hn?Bչ����<lஜ��-�n4�Ҧ�m#-���jøp8'� ����n�QT��n���/���ٶt)�>N`� i�/b T��_	��� �]}�XWY-���J{e�zb��$���v@��t��L�O��0cat�mA��0��7 ��P���
��4+����X{3�v��է#�5�lHe��k�DG+��ZۂB�d�˛_Au�P]���%��%����(�ћ���X�E��.`�̘�30c��3�J��u�~A#�i?��: �|�=��� H������H��}��B'���
�9���ţ���2zOD��'�<�	���5/k������kƌ����o3j��<xj�s䭩G�b�"���V���8=�.�͖��KwUL����w�����Aϰ"�Q8�����~�h����UƼB�DZ"�����O��O�1Y��ol�������Ȧ	I������c�P�[��aZv|�6_���G��J�[!�Lri�+t�5�*�m)�<���[^E���P��]-Vδ���4�,^�k���r��r/p$Ht�qu�w�:�^��r9�)M����VDTE}<�����%���:�����ȹ �(Ļڸ�ii�^zѕ����Wsg5��ČY�y&'��3��@�b
�/@q�sGX�(�3������QuO]��|g���?K�T�g=.��P29�cRJ��c����#X��r��x����c��m;��|�h����V��J&!�=��?���?�n�F�4�b�qy6�y��R�@1�@)z���Buy���9P\}GYV,��J �d߲7#�s�D�u�=$C������AMQ�8|�����~�NZ֢�r��!^��P�úS�V��[&z8y��E�an���D��ᬷ�尬�����5��g�By����'����s�<��kRZ�Ʉ'�J���d=���C�S��G�P[�*�>|�����lw�����a��U@�'��<�.`�������2����]FDD��U    IEND�B`�  [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=true
    ECFG	      config_version          application/config/name          godot-multiplayer-server   application/run/main_scene0      &   res://com.brandonlamb.server/game.tscn4    application/config/icon         res://icon.png/    display/window/size/width     �         display/window/size/height     �         display/window/dpi/allow_hidpi            display/window/size/resizable          )   rendering/environment/default_environment          res://default_env.tres                 GDPC