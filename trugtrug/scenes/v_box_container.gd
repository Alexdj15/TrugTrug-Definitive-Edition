extends VBoxContainer

func _ready():
	# Wait 1 frame for Godot to calculate the true size of the text
	await get_tree().process_frame
	# Set the pivot to the exact center
	pivot_offset = size / 2.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("up") or Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://scenes/intro.tscn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/intro.tscn")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/intro.tscn")
