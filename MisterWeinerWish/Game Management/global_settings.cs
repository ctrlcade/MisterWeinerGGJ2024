using Godot;
using System;

public partial class global_settings : Node
{
	[Signal]
	public delegate void ToggleGamePausedEventHandler(bool isPaused);

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
}
