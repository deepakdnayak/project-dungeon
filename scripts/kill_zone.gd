extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		print("You Died")
		Engine.time_scale = 0.5
		# Safely get CollisionShape2D node only if it exists
		var collision_shape = body.get_node_or_null("CollisionShape2D")
		if collision_shape:
			collision_shape.queue_free()
		timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
