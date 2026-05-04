extends Node2D

var can_respect = false
var can_win = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Crabzer.visible = false
	$win.visible = false
	can_respect = false
	can_win = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if can_respect and Input.is_action_just_pressed("respect"):
		can_respect = false
		$respect.play(30)
		$Crabzer.visible = false
		GlobalManager.level3_passed = true
		$win_timer.start()
	if can_win and Input.is_action_pressed("level_exit"):
		get_tree().change_scene_to_file("res://scenes/levels.tscn")
		

func _on_crabzer_area_body_entered(_body: Node2D) -> void:
	$Crabzer.visible = true
	can_respect = true


func _on_win_timer_timeout() -> void:
	$win.visible = true
	can_win = true
