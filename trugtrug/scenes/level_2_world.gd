extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$winlabel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_win_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/levels.tscn")


func _on_area_2d_body_entered(_body: Node2D) -> void:
	$win_timer.start()
	$winlabel.visible = true
	GlobalManager.level2_passed = true
