using Godot;
using System;
using System.Dynamic;

// This script has been made an autoloaded script, and can be accessed in other scripts using 'GameManager'.
public partial class game_manager : Node
{
	// This signal should be used to let other scripts know if the game is paused or not, so they don't need to check constantly in _Process.
	[Signal]
	public delegate void ToggleGamePausedEventHandler(bool isPaused);

	private bool _isPaused = false;

	// Getter and Setter for _isPaused. Setting GamePaused to anything will automatically emit the signal.
	[Export]
	bool GamePaused
	{
		get {return _isPaused;}
		set {_isPaused = value; EmitSignal(SignalName.ToggleGamePaused, _isPaused); GetTree().Paused = GamePaused;}
	}

	public override void _Input(InputEvent @event)
	{
		if (@event.IsActionPressed("pause"))
		{
			GamePaused = !_isPaused;
		}
	}
}
