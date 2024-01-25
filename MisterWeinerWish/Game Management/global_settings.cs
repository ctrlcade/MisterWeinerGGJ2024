using Godot;
using System;

public partial class global_settings : Node
{
	[Signal]
	public delegate void ToggleGamePausedEventHandler(bool isPaused);

	[Signal]
	public delegate void IncreaseTimeEventHandler(float amount);

	private bool _isPaused = false;

	public void SetPauseGame(bool isPaused)
	{
		_isPaused = isPaused;
		EmitSignal(SignalName.ToggleGamePaused, _isPaused); 
		GetTree().Paused = _isPaused; 
	}

	public bool GetPauseGame()
	{
		return _isPaused;
	}

	public void TimeChange(float value)
	{
		EmitSignal(SignalName.IncreaseTime, value);
	}
}
