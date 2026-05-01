extends PathFollow2D

@export var speed: float = 0.2  # Speed as a ratio (0.0 to 1.0)
var direction: int = 1         # 1 for forward, -1 for backward

func _process(delta: float):
	# Update the ratio based on speed and direction
	progress_ratio += speed * delta * direction
	
	# Check if we hit the end (1.0)
	if progress_ratio >= 1.0:
		progress_ratio = 1.0    # Cap it to avoid overshooting
		direction = -1          # Start moving backward
		$enemy/Sprite2D.flip_h = true
		
	# Check if we hit the start (0.0)
	elif progress_ratio <= 0.0:
		progress_ratio = 0.0    # Cap it to avoid overshooting
		direction = 1           # Start moving forward
		$enemy/Sprite2D.flip_h = false


func _on_enemy_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
