extends Node
class_name State

var state_machine: StateMachine

func enter():
	pass

func exit():
	pass

func update(delta:float):
	pass

# this is a separate function from godot's default function
func physics_process(delta: float) -> void:
	pass
