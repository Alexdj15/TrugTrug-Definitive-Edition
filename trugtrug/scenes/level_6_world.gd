extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_enemy_1_body_entered(_body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_win_area_body_entered(_body: Node2D) -> void:
	GlobalManager.level6_passed = true
	$win_timer.start()


func _on_win_timer_timeout() -> void:
	$CanvasLayer/AnimationPlayer.play("fade_to_black")
	await $CanvasLayer/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scenes/ending_cutscene.tscn")
