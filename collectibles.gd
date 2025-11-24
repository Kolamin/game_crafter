extends Node2D

var coin_preload = preload("res://scn/collectibles/coin.tscn")

func _ready() -> void:
	Signals.connect("enemy_died", Callable(self, "_on_enemy_died"))

func _on_enemy_died(enemy_posintion):
	for i in randi_range(1, 5):
		coin_spawn(enemy_posintion)

func coin_spawn(pos):
	var coin = coin_preload.instantiate()
	coin.position = pos
	call_deferred("add_child", coin)
