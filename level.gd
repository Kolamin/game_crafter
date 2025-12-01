extends Node2D

@onready var light_animation = $Light/LightAnimation
@onready var day_text = $CanvasLayer/DayText
@onready var player = $Player/Player

var mushroom_preload = preload("res://Mobs/mushroom.tscn")

enum {
	MONING,
	DAY,
	EVENING,
	NIGHT
}

var state: int = MONING
var day_count: int

func  _ready() -> void:
	Global.gold = 0
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


func _on_spawner_timeout() -> void:
	mushroom_spawn()

func mushroom_spawn():
	var mushroom = mushroom_preload.instantiate()
	mushroom.position = Vector2(randi_range(-500, -200), 480)
	$Mobs.add_child(mushroom)
