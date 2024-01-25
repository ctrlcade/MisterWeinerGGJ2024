using Godot;
using System;
using System.Dynamic;

// This script has been made an autoloaded script, and can be accessed in other scripts using 'GameManager'.
public partial class game_manager : Node
{
	// This signal should be used to let other scripts know if the game is paused or not, so they don't need to check constantly in _Process.
	[Signal]
	public delegate void ToggleGamePausedEventHandler(bool isPaused);

	// Stores the timer node.
	[Export]
	Timer timer = new();
	bool gameStarted = false;
	private bool _isPaused = false;

	// Getter and Setter for _isPaused. Setting GamePaused to anything will automatically emit the signal.
	[Export]
	bool GamePaused
	{
		get {return _isPaused;}
		set 
		{
			_isPaused = value; 
			EmitSignal(SignalName.ToggleGamePaused, _isPaused); 
			GetTree().Paused = GamePaused; 
		}
	}

	
	// Because this script has been made autoloaded, this runs right at the start of the game.
	public override void _Ready()
	{
		// Start the timer and connect signal for when the timer runs out.
		//timer = GetNode<Timer>("Timer");
		timer.Timeout += OnTimerTimeout;
		timer.Start();

		GamePaused = false;
		gameStarted = false;
	}

	public override void _Process(double delta)
	{
		if (gameStarted)
		{
			CustomUpdate(delta);
		}

		timer.Paused = GetTree().Paused;
	}

	public void StartGame()
	{
		gameStarted = true;
		CustomReady();
	}

	public void EndGame()
	{
		gameStarted = false;
	}

	// Runs when the game has started
	private void CustomReady()
	{
		
	}

	private void CustomUpdate(double delta)
	{
		
	}

	public override void _Input(InputEvent @event)
	{
		if (@event.IsActionPressed("pause") && gameStarted)
		{
			GamePaused = !_isPaused;
		}
	}

	private void OnTimerTimeout()
	{
		
	}

	private void IncreaseTime(float value)
	{
		timer.Start(timer.TimeLeft + value);
	}
}
