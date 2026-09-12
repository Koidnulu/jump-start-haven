extends Node
class_name StateMachine

var states : Dictionary = {}

# export means make it modifiable in editor, of type variable state as defined before
@export var initial_state : State
var current_state: State

func _ready() -> void:
	for child in get_children():
		if child is State:
			# adding the child (defined state) into the dictionary
			states[child.name.to_lower()] = child
			child.state_machine = self
	
	if initial_state:
		change_state(initial_state.name.to_lower())
	
	pass

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)
	pass

func _input(event:InputEvent) -> void:
	if current_state:
		# correlates to how this current states handles this input event
		current_state.handle_input(event)
	pass

func change_state(new_state_name: String) -> void:
	if current_state:
		# just means there is a current state and exit function is called
		current_state.exit()
		
	current_state = states.get(new_state_name.to_lower())
	
	# now current state changed
	if current_state:
		current_state.enter()
