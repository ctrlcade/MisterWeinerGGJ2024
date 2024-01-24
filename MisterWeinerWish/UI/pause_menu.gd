extends Control

func _ready() -> void:
	hide()

func _on_toggle_game_pause(is_paused: bool):
	if(is_paused):
		show()
	else:
		hide()

func _on_resume_button_pressed() -> void:
	pass # Replace with function body.


func _on_restart_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
