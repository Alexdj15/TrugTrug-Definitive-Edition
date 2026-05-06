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
		var arrow1 = arrow_scene.instantiate()
		arrow1.global_position = $"../Marker2D1".global_position
		arrow1.direction = Vector2.LEFT
		get_tree().current_scene.add_child(arrow1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
