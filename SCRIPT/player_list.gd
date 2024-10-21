class_name player_list
extends Control

@onready var playerContainer = $PanelContainer/VBoxContainer

func _ready() -> void:
	MultiplayerManager.add_player.connect(add_player_to_list)
	MultiplayerManager.remove_player.connect(remove_player_to_list)

func add_player_to_list(playername: String):
	var playerlabel = Label.new()
	playerlabel.text = playername
	playerContainer.add_child(playerlabel)

func remove_player_to_list():
	print("Removing Player to List!")
