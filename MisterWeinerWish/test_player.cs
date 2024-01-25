using Godot;
using System;

public partial class test_player : CharacterBody3D
{
	private const float Speed = 10.0f;
	private const float RotationSpeed = 1f;

	// Get the gravity from the project settings to be synced with RigidBody nodes.
	private float _gravity = ProjectSettings.GetSetting("physics/3d/default_gravity").AsSingle();
	
	private Vector3 _velocity = Vector3.Zero;

	public override void _PhysicsProcess(double delta)
	{
		// add gravity
		if (!IsOnFloor())
			_velocity.Y -= _gravity * (float)delta;
		
		_TankControls(delta);
		
		// set current velocity vector, this variable is the one used by MoveAndSlide()
		Velocity = _velocity;
		MoveAndSlide();
	}

	private void _TankControls(double delta)
	{
		// do not want to set the Y velocity to 0 each frame so gravity still works, local copy in velocityY
		float velocityY = _velocity.Y;
		
		// reset velocity vector variable
		_velocity = Vector3.Zero;

		// Forward/Backward player movement
		if (Input.IsActionPressed("Forward"))
		{
			_velocity += -Transform.Basis.Z * Speed;
		}
		if (Input.IsActionPressed("Backward"))
		{
			_velocity += Transform.Basis.Z * Speed;
		}

		// Left/Right player rotation
		if (Input.IsActionPressed("Left"))
		{
			RotateY(RotationSpeed * (float) delta);
		}
		if (Input.IsActionPressed("Right"))
		{
			RotateY(-RotationSpeed * (float) delta);
		}

		// add the gravity back into the current velocity vector
		_velocity.Y = velocityY;
	}
}
