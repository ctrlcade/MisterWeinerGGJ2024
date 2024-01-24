extends Control

@onready var back_button: Button = $MarginContainer/VBoxContainer/BackButton

func _ready() -> void:
	back_button.grab_focus()

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
