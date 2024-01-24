using Godot;
using System;
using System.Dynamic;

public partial class game_manager : Node
{
	[Signal]
	public delegate void ToggleGamePausedEventHandler(bool isPaused);

	private bool _isPaused = false;

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
