extends Node

const SERVER_PORT = 8080
const SERVER_IP = "127.0.0.1"

signal add_player(id)
signal remove_player(id)

func host_game():
	print("Starting host!")
	
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(SERVER_PORT)
	
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player_to_game)
	multiplayer.peer_disconnected.connect(_del_player)

func join_game():
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP, SERVER_PORT)
	
	multiplayer.multiplayer_peer = client_peer

func _add_player_to_game(id: int):
	emit_signal("add_player", ("Player %s" %id))
	print("Player %s joined the game!" %id)

func _del_player(id: int):
	emit_signal("remove_player", ("Player %s" %id))
	print("Player %s left the game!" %id)
