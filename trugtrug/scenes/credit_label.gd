extends Label

@export var colors: Array[Color] = [Color.RED, Color.BLUE, Color.GREEN]
@export var duration: float = 1.0
var current_index: int = 0

func _ready():
	# 1. IMPORTANT: Set an initial color so it isn't 'Nil'
	add_theme_color_override("font_color", colors[0])
	
	start_transition()

func start_transition():
	# 2. Move to the next color index
	current_index = (current_index + 1) % colors.size()
	var target_color = colors[current_index]
	
	var tween = create_tween()
	
	# 3. Use the full path to the theme override
	tween.tween_property(self, "theme_override_colors/font_color", target_color, duration)
	
	# 4. Loop it
	tween.finished.connect(start_transition)
