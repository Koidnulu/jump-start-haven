extends Area2D

func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	await get_tree().create_timer(0.5).timeout
	Engine.time_scale = 1
	get_tree().reload_current_scene()
