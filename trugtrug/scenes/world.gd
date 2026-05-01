extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$winlabel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_winzone_area_entered(_area:Area2D) -> void:
	$winlabel.visible = true
	GlobalManager.level1_passed = true
	$WinTimer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/levels.tscn")
