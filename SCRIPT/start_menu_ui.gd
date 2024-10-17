extends Control

func _on_host_server_button_pressed():
	hide_ui()
	MultiplayerManager.host_game()


func _on_join_server_button_pressed():
	hide_ui()
	MultiplayerManager.join_game()


func _on_play_solo_button_pressed():
	get_tree().change_scene_to_file("res://Node/table_scene.tscn")
	print("Switched to table scene")


func _on_exit_button_pressed():
	get_tree().quit()

func hide_ui():
	self.hide()
