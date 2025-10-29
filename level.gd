extends Node2D

@onready var light_animation = $Light/LightAnimation
@onready var day_text = $CanvasLayer/DayText

@onready var player = $Player/Player
enum {
	MONING,
	DAY,
	EVENING,
	NIGHT
}

var state: int = MONING
var day_count: int

func  _ready() -> void:
	day_count = 0
	
	moning_state()

	

func moning_state():
	day_count += 1
	day_text.text = "DAY " + str(day_count)
	light_animation.play("sunrise")
	
func evening_state():
	light_animation.play("sunset")
	

func _on_day_night_timeout() -> void:
	if state < 3:
		state += 1
	else:
		state = 0 
	match state:
		MONING:
			moning_state()
		EVENING:
			evening_state()
	
	

func set_day_text():
	day_text.text = "DAY " + str(day_count)
