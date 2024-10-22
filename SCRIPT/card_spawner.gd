extends Node

var card_base = preload("res://Node/TableScene/card_base.tscn")

# Spanws a random blue or red card, based on a random number
func spawn_random_card() -> void:
	var card = card_base.instantiate()
	var sprite = card.get_child(0)
	
	# Generate a random number and decide card color accordingly
	var num: int = randi() % 100
	# Percentage change of the new card being red
	var threshold: int = 20
	
	if num > threshold: 
		sprite.texture.region = Rect2(0, 0, 88, 124)
	else:
		sprite.texture.region = Rect2(88, 0, 88, 124)
	
	# Add the sprite to the card node and the card node to the scene
	get_node("/root/TableScene/PlayerHand").add_child(card)

func spawn_black_card() -> void:
	var card = card_base.instantiate()
	var sprite = card.get_child(0)
	
	sprite.texture.region = Rect2(176, 0, 88, 124)
	get_node("/root/TableScene/PlayerHand").add_child(card)

# These are signals that need to spawn a card
func _on_new_card_button_pressed() -> void:
	spawn_random_card()
func _on_new_black_card_button_pressed() -> void:
	spawn_black_card()
func _on_player_hand_request() -> void:
	add_child(card_base.instantiate())

#TODO add abilty to spawn in either the hand or the field