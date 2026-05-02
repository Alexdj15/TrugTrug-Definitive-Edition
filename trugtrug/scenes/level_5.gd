extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalManager.level5_passed == true:
		$".".text = 'Level 5 
		Completed!'


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_5.tscn")
