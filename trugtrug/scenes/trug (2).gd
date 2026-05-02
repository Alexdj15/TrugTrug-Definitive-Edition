extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var able_to_jump = true
var was_on_floor = false

func _ready() -> void:
	$Stick1.visible = true
	#if get_tree().current_scene.name == "Level2":
		#$Stick2.visible = false
		#$Stick1.visible = true
	#else:
		#$Stick2.visible = true
		#$Stick1.visible = false
	if GlobalManager.level2_passed == true:
		$Stick2.visible = true
		$Stick1.visible = false
	$Trug.visible = false

func _physics_process(delta: float) -> void:
	# Trug
	if Input.is_action_just_pressed("trug"):
		$Trug.visible = true
		$Trug_Timer.start()
		$Trugsfx.play()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if not was_on_floor:
			$coyote.start()
			was_on_floor = true
	
	if is_on_floor():
		able_to_jump = true
		was_on_floor = false
	# Handle jump.
	if Input.is_action_just_pressed("up") and able_to_jump:
		velocity.y = JUMP_VELOCITY
		able_to_jump = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x < 0:
		$Stick1.flip_h = true
		$Stick2.flip_h = true
	elif velocity.x > 0:
		$Stick1.flip_h = false
		$Stick2.flip_h = false

	move_and_slide()
	
	if self.global_position.y > 1000:
		get_tree().reload_current_scene()


func _on_timer_timeout() -> void:
	$Trug.visible = false


func _on_coyote_timeout() -> void:
	able_to_jump = false
