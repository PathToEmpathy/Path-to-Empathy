extends Control

func _on_host_server_button_pressed():
	print("HOST GAME")


func _on_join_server_button_pressed():
	print("JOINING GAME")


func _on_play_solo_button_pressed():
	print("PLACEHOLDER - START SOLO GAME")


func _on_exit_button_pressed():
	get_tree().quit()
