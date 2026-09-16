extends Node2D
@onready var raycast: RayCast2D = $RayCast2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var mushroom: Node2D = $"."
var direction = -1
const speed = 50

func _physics_process(delta: float) -> void:
	
	if not raycast.is_colliding():
		direction *= -1
		mushroom.scale.x = -mushroom.scale.x
		
	position.x += direction * delta * speed
	
