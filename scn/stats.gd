extends CanvasLayer

@onready var health_bar = $HealthBar

var health:
	set(value):
		health = value
		health_bar.value = health
var max_health = 100


func _ready() -> void:
	health = max_health
	health_bar.max_value = health
	health_bar.value = health
