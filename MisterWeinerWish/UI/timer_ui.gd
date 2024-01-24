extends Control

@onready var timer_display_label: Label = $MarginContainer/HBoxContainer/TimerDisplayLabel
@export var timer: Timer

func _process(delta: float) -> void:
	timer_display_label.text = str(timer.time_left).pad_decimals(1)
	
	if(timer.time_left <= 0):
		hide()
