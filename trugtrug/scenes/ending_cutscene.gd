extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$the_end.visible = false
	$rapzer.visible = false
	$rapzerbg.visible = false
	$rapzer_label.visible = false
	$dead_trug1.visible = false
	$CanvasLayer/AnimationPlayer.play("fade_from_black")
	$dead_trug1.visible = true
	$trug_death_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_trug_death_timer_timeout() -> void:
	$rapzer.visible = true
	$rapzerbg.visible = true
	$rapzer_label.visible = true
	$CanvasLayer/AnimationPlayer.play("fade_to_rapzer")
	$rapzer_timer.start()

func _on_rapzer_timer_timeout() -> void:
	$the_end.visible = true
	$rapzer.visible = false
	$rapzerbg.visible = false
	$rapzer_label.visible = false
	$dead_trug1.visible = false
	$end_timer.start()

func _on_end_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
