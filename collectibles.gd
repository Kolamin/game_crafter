extends Node2D

func _ready() -> void:
	Signals.connect("enemy_died", Callable(self, "_on_enemy_died"))

func _on_enemy_died(enemy_posintion):
	pass
