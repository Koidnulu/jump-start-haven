extends State
class_name main_run

const speed : = 300
@export var character: CharacterBody2D

func enter():
	character.play("running")
	pass

func update(_delta):
	var direction = Input.get_axis("left", "right")
	
	if direction > 0:
		character.flipping.scale.x = 1
	elif direction < 0:
		character.flipping.scale.x = -1
	if direction == 0:
		state_machine.change_state("main_idle")
	
	if direction:
		character.velocity.x = direction * speed
	
		
	
