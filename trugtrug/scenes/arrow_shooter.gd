extends StaticBody2D

@export var arrow_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().create_timer(2.0).timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	shoot()
	# Loop the timer
	get_tree().create_timer(2.0).timeout.connect(_on_timer_timeout)

func shoot():
	if arrow_scene:
		var arrow = arrow_scene.instantiate()
		# 1. Set the position to the Marker2D's global position
		arrow.global_position = $"../Marker2D".global_position
		# 2. Set direction to left
		arrow.direction = Vector2.LEFT
		# 3. Add it to the main scene (not as a child of the shooter)
		# This prevents the arrow from moving IF the shooter ever moved
		get_tree().current_scene.add_child(arrow)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
