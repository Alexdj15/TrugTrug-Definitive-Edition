extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$croczer_win.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_win_area_body_entered(body: Node2D) -> void:
	$croczer_win.visible = true
	$respect.play(30)
	GlobalManager.level4_passed = true
	$win_timer.start()


func _on_win_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/levels.tscn")
