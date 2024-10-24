class_name player_list
extends Control

@onready var playerContainer = $PanelContainer/VBoxContainer
@onready var playertext = $PanelContainer/VBoxContainer/PlayerText
@onready var player = preload("res://NODE/player.tscn")

func _ready() -> void:
	MultiplayerManager.add_player.connect(add_player_to_list)
	MultiplayerManager.remove_player.connect(remove_player_to_list)

func add_player_to_list(playername: String):
	playertext.text += playername + "\n"

func remove_player_to_list():
	print("Removing Player to List!")

func refresh_list(players : Array):
	for p in players:
		add_player_to_list(p.player_name)
