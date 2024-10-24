class_name player_data

extends Node2D

signal add_player(name)
signal remove_player(name)

@export var player_name : String

@export var player_id := 1:
	set(id):
		player_id = id

func _ready():
	emit_signal("add_player", player_name)


func _on_tree_exited():
	emit_signal("remove_player", player_name)
