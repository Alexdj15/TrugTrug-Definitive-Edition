# Arrow.gd
extends Area2D

var speed = 400
var direction = Vector2.LEFT # Defaulting to left

func _process(delta):
	position += direction * speed * delta
	if get_parent().name == "level_6":
		if global_position.x <= 1325:
			queue_free()

# Optional: Delete arrow when it leaves the screen
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().reload_current_scene()
