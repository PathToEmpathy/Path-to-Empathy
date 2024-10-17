extends Node

func new_base() -> Sprite2D:
	var sprite: Sprite2D = Sprite2D.new()
	sprite.texture = AtlasTexture.new()
	sprite.texture.atlas = load("res://Assets/PtE_Placeholders.png")
	sprite.texture_filter = 1
	sprite.scale = Vector2(1.5,1.5)
	return sprite

func _on_new_card_button_pressed() -> void:
	var card: Node2D = Node2D.new()
	var sprite: Sprite2D = new_base()
	
	var num: int = randi() % 100
	if num > 20:
		sprite.texture.region = Rect2(0, 0, 88, 124)
	else:
		sprite.texture.region = Rect2(88, 0, 88, 124)
	
	card.add_child(sprite)
	add_child.call_deferred(card)


func _on_new_black_card_button_pressed() -> void:
	var card: Node2D = Node2D.new()
	var sprite: Sprite2D = new_base()
	
	sprite.texture.region = Rect2(176, 0, 88, 124)
	card.add_child(sprite)
	add_child.call_deferred(card)
