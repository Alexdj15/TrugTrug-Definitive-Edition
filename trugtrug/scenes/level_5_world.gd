extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$win.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_win_area_body_entered(body: Node2D) -> void:
	$win_timer.start()
	$win.visible = true
	GlobalManager.level5_passed = true


func _on_win_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/levels.tscn")
