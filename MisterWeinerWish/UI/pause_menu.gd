extends Control

func _ready() -> void:
	hide()
	GameManager.connect("ToggleGamePaused", _on_toggle_pause)

func _on_toggle_pause(is_paused: bool) -> void:
	if(is_paused):
		show()
	else:
		hide()

func _on_resume_button_pressed() -> void:
	GameManager.GamePaused = false


func _on_restart_button_pressed() -> void:
	GameManager.GamePaused = false


func _on_quit_button_pressed() -> void:
	GameManager.GamePaused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
