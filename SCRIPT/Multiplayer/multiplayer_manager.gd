extends Node

const SERVER_PORT = 8080
const SERVER_IP = "127.0.0.1"

var player_node = preload("res://NODE/player.tscn")
var players_nodes

signal add_player(id)
signal remove_player(id)

func host_game():
	print("Starting host!")
	
	players_nodes = get_tree().get_current_scene().get_node("Players")
	
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(SERVER_PORT)
	
	_add_player_to_game(1234)
	
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player_to_game)
	multiplayer.peer_disconnected.connect(_del_player)

func join_game():
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP, SERVER_PORT)
	
	multiplayer.multiplayer_peer = client_peer

func _add_player_to_game(id: int):
	print("Player %s joined the game!" %id)
	
	var player_to_add = player_node.instantiate()
	player_to_add.player_id = id
	player_to_add.name = player_to_add.name + str(id)
	
	players_nodes.add_child(player_to_add)
	
	player_to_add.position = Vector2(randf_range(50, 500), randf_range(50, 500))
	
	emit_signal("add_player", ("Player %s" %id))

func _del_player(id: int):
	emit_signal("remove_player", ("Player %s" %id))
	print("Player %s left the game!" %id)
