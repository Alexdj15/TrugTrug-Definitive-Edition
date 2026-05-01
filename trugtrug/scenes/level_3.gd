extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalManager.level3_passed == true:
		$".".text = 'Level 3 
		Completed!'


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")
