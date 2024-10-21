class_name player_list
extends Control

@onready var playerContainer = $PanelContainer/VBoxContainer

func add_player_to_list():
	#var playerlabel = Label.new()
	#playerlabel.text = "Player2"
	#playerContainer.add_child(playerlabel)
	MultiplayerManager.connect("add_player", add_player_to_list())
	print("Adding Player to List!")

func remove_player_to_list():
	MultiplayerManager.connect("remove_player", remove_player_to_list())
	print("Removing Player to List!")
