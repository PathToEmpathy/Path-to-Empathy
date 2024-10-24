extends Node
signal request

#TODO make sure cards back up to 5 when exiting the dialogue scene

func _on_tree_entered() -> void:
	for i in clamp(5 - get_child_count(), 0, 1):
		request.emit()
		print("Requesting initial card")
