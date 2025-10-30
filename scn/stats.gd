extends CanvasLayer

@onready var health_bar = $HealthBar
@onready var stamina_bar = $Stamina

var stamina_cost
var attack_cost = 10
var block_cost = 1
var run_cost = 1
var slide_cost = 20

var health:
	set(value):
		health = value
		health_bar.value = health

var stamina = 50		
var max_health = 100


func _ready() -> void:
	health = max_health
	health_bar.max_value = health
	health_bar.value = health

func _process(delta):
	stamina_bar.value = stamina
	if stamina < 100:
		stamina += 10 * delta

func stamina_consumption():
	stamina -= stamina_cost
