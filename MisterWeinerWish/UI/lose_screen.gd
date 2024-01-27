extends Control

@onready var back_button: Button = $Panel/MarginContainer/VBoxContainer/VBoxContainer2/BackButton
@export var timer: Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(timer.time_left <= 0.0):
		show()
		back_button.grab_focus()


func _on_back_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
