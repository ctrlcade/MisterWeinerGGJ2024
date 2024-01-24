extends Control

var game_scene: String = "res://test_world.tscn"

func _on_start_button_pressed():
	get_tree().change_scene_to_file(game_scene)

func _on_exit_button_pressed():
	get_tree().quit()

func _on_credits_button_pressed():
	pass # Replace with function body.

func _on_controls_button_pressed():
	pass # Replace with function body.
