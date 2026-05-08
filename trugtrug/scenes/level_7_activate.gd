extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../level_7_label1".visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if GlobalManager.level7_mainmenu == false:
		GlobalManager.level7_unlocked += 1
		GlobalManager.level7_mainmenu = true
		get_tree().create_timer(2.0).timeout.connect(_on_timer_timeout)
		$"../level_7_label1".text = str(GlobalManager.level7_unlocked) + "/2"
		$"../level_7_label1".visible = true

func _on_timer_timeout():
	$"../level_7_label1".visible = false
