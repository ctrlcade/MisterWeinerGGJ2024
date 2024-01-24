extends Control

@onready var resume_button: Button = $Panel/MarginContainer/VBoxContainer/VBoxContainer2/ResumeButton

func _ready() -> void:
	GameManager.connect("ToggleGamePaused", _on_toggle_pause)

func _on_toggle_pause(is_paused: bool) -> void:
	if(is_paused):
		show()
		resume_button.grab_focus()
	else:
		hide()

func _on_resume_button_pressed() -> void:
	GameManager.GamePaused = false


func _on_restart_button_pressed() -> void:
	GameManager.GamePaused = false


func _on_quit_button_pressed() -> void:
	GameManager.GamePaused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
