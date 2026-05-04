extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$rapzer.visible = false
	$rapzerbg.visible = false
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
	$CanvasLayer/AnimationPlayer.play("fade_to_rapzer")
