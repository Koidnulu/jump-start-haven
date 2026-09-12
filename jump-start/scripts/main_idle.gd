extends State
class_name main_idle
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func enter():
	sprite.play("idle")
	pass

func update(_delta: float):
	if (Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")) != Vector2.ZERO:
		state_machine.change_state("running")
		
func exit():
	pass
