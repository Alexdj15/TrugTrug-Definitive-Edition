extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalManager.level7_unlocked == 2:
		$".".visible = true
	else:
		$".".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalManager.level7_unlocked == 2:
		$".".visible = true


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_7.tscn")
