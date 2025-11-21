extends Node

var game_pause: bool = false
@onready var pause_menu = $"../CanvasLayer/PauseMenu"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		game_pause = !game_pause
		
	if game_pause == true:
		get_tree().paused = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide()


func _on_resume_pressed() -> void:
	game_pause = !game_pause


func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_menu_button_pressed() -> void:
	game_pause = !game_pause
