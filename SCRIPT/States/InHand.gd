extends State
class_name InHand

@export var card: Node2D
@export var buttons: Sprite2D
@export var cardArea: Area2D

func enter():
	cardArea.visible = true
	

func exit():
	buttons.visible = false
	cardArea.visible = false
	

func _on_card_area_on_click() -> void:
	if buttons.visible == false:
		buttons.visible = true
	else:
		buttons.visible = false

func _on_confirm_area_on_click() -> void:
	print("Confirmed")
	
	Transitioned.emit(self, "OnTable")


func _on_cancel_area_on_click() -> void:
	buttons.visible = false
