extends State
class_name main_jump
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var character: CharacterBody2D = $"."


func enter():
	sprite.play("jump")
	pass

func update(_delta):
	if Input.is_action_just_pressed("jump"):
		character.velocity.y = character.get_gravity().y * _delta
		character.move_and_slide()
		
	if character.is_on_floor():
		if character.velocity.x == 0:
			character.change_state("main_idle")
		else:
			character.change_state("main_run")
		
