using Godot;
using System;
using System.Dynamic;

// This script has been made an autoloaded script, and can be accessed in other scripts using 'GameManager'.
public partial class game_manager : Node
{
	// Global Settings
	global_settings g_settings;
	// Stores the timer node.
	Timer timer;
	
	// Because this script has been made autoloaded, this runs right at the start of the game.
	public override void _Ready()
	{
		// Store the global settings here in ready for later use.
		g_settings = GetNode<global_settings>("/root/GlobalSettings");
		g_settings.IncreaseTime += IncreaseTimeLimit;

		// Start the timer and connect signal for when the timer runs out.
		timer = GetNode<Timer>("Timer");
		timer.Timeout += OnTimerTimeout;
		timer.Start();
	}

	public override void _Process(double delta)
	{
		timer.Paused = g_settings.GetPauseGame();
	}

	public void OnTogglePaused()
	{

	}

	public override void _Input(InputEvent @event)
	{
		if (@event.IsActionPressed("pause"))
		{
			g_settings.SetPauseGame(!g_settings.GetPauseGame());
		}
	}

	private void OnTimerTimeout()
	{
		GD.Print("Time ran out!");
	}

	public void IncreaseTimeLimit(float value)
	{
		GD.Print("Time Increased!");
		timer.Start(timer.TimeLeft + value);
	}
}
