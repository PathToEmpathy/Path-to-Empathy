extends Node

var initial_state: State
var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	initial_state = get_child(0)
	
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func on_child_transition(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("It went wrong here")
		return
		
	if current_state:
		current_state.exit()
		
	new_state.enter()
	current_state = new_state
