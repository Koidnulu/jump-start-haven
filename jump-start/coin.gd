extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	sprite.play("default")

func _on_body_entered(body: Node2D) -> void:
	animation_player.play("pickup")
