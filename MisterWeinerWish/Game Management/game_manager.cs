using Godot;
using System;
using System.Dynamic;

public partial class game_manager : Node
{
	[Signal]
	public delegate void ToggleGamePausedEventHandler(bool isPaused);

	bool _isPaused = false;

	[Export]
	bool GamePaused
	{
		get {return _isPaused;}
		set {_isPaused = value; GetTree().Paused = _isPaused; EmitSignal(SignalName.ToggleGamePaused, _isPaused);}
	}

	public override void _Input(InputEvent @event)
	{
		if (@event.IsActionPressed("pause"))
		{
			GamePaused = !GamePaused;
		}
	}
}
