extends Control

@export var game_scene: PackedScene = preload("res://test_world.tscn")
@onready var start_button: Button = $MarginContainer/VBoxContainer/StartButton

func _ready() -> void:
	start_button.grab_focus()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
	GameManager.StartGame()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/credits_menu.tscn")

func _on_controls_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/controls_menu.tscn")
