using Godot;
using System;

public partial class test_player : CharacterBody3D
{
	private const float Speed = 10.0f;
	private const float RotationSpeed = 1f;

	// current amount of middle weenies
	private int _weenieCounter = 1;

	// Get the gravity from the project settings to be synced with RigidBody nodes.
	private float _gravity = ProjectSettings.GetSetting("physics/3d/default_gravity").AsSingle();
	
	private Vector3 _velocity = Vector3.Zero;

	private void GrowWeiner()
	{
		// get Node3D refs for the current middle weiner and the back weiner
		Node3D curMiddleWeiner = GetNode<Node3D>("WeinerMiddle");
		Node3D backWeiner = GetNode<Node3D>("WeinerBack");
		
		// reposition camera whenever weiner grows
		SpringArm3D weinerCam = GetNode<SpringArm3D>("CameraAnchor/SpringArm3D");
		weinerCam.Position = new Vector3(weinerCam.Position.X, weinerCam.Position.Y+0.25f, weinerCam.Position.Z+1.25f);
		
		// instantiate middle weiner mesh, give it unique name so its easier to reference
		PackedScene middleWeinerMesh = GD.Load<PackedScene>("res://Models/WeinerMiddle.glb");
		AddChild(middleWeinerMesh.Instantiate(), true);
		
		// add the weiner mesh to the current middle weiners position, increment weenie counter so name reference grobs newest instantiated weenie
		Node3D newMiddleWeiner = GetNode<Node3D>("WeinerMiddle" + _weenieCounter++);
		newMiddleWeiner.Position = curMiddleWeiner.Position;
		
		// reposition the current and back weiner to make space for the new middle weiner
		curMiddleWeiner.Position = new Vector3(curMiddleWeiner.Position.X, curMiddleWeiner.Position.Y, curMiddleWeiner.Position.Z+1f);
		backWeiner.Position = new Vector3(backWeiner.Position.X, backWeiner.Position.Y, backWeiner.Position.Z+1f);
	}

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
