extends CharacterBody3D


const SPEED = 7.0

var _velocity = Vector3.ZERO
var _weenieCounter = 1


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func find_lockon_points() -> void:
	var lock_on_points = get_tree().get_nodes_in_group("lock_on_points")
	
	var distance = abs(position - lock_on_points[0].position)
	var closest_point: LockOnPoint
	
	for lock_on_point: LockOnPoint in lock_on_points:
		var new_distance = abs(position - lock_on_point.position)
		if (new_distance < distance):
			distance = new_distance
			closest_point = lock_on_point
			
	closest_point.toggle_glow(true)

func grow_weiner():
	
	# get Node3D refs for the current middle weiner and the back weiner
	var curMiddleWeiner = get_node("WeinerMiddle")
	var backWeiner = get_node("WeinerBack")
	
	# reposition camera whenever weiner grows
	var weinerCam = get_node("CameraAnchor/SpringArm3D")
	weinerCam.position = Vector3(weinerCam.position.x, weinerCam.position.y+0.25, weinerCam.position.z+1.25)
	
	# instantiate middle weiner mesh, give it unique name so its easier to reference
	var middleWeinerMesh = load("res://Mr Weiner/WeinerMiddle.glb")
	add_child(middleWeinerMesh.instantiate(), true)
	
	_weenieCounter = _weenieCounter + 1;
	
	# add the weiner mesh to the current middle weiners position, increment weenie counter so name reference grobs newest instantiated weenie
	var newMiddleWeiner = get_node("WeinerMiddle" + str(_weenieCounter))
	newMiddleWeiner.position = curMiddleWeiner.position;
	print(_weenieCounter)
	
	# reposition the current and back weiner to make space for the new middle weiner
	curMiddleWeiner.position = Vector3(curMiddleWeiner.position.x, curMiddleWeiner.position.y, curMiddleWeiner.position.z+1);
	backWeiner.position = Vector3(backWeiner.position.x, backWeiner.position.y, backWeiner.position.z+1);

func _physics_process(delta):
	# add gravity
	if !is_on_floor():
		_velocity.y = _velocity.y - (gravity * delta)
	
	_tank_controls(delta);
	
	# set current velocity vector, this variable is the one used by MoveAndSlide()
	velocity = _velocity;
	move_and_slide();

func _tank_controls(delta):
	
	# do not want to set the Y velocity to 0 each frame so gravity still works, local copy in velocityY
	var velocityY = _velocity.y;
	
	# reset velocity vector variable
	_velocity = Vector3.ZERO;

	# Forward/Backward player movement
	if (Input.is_action_pressed("Forward")):
		_velocity += -transform.basis.z * SPEED;
	if (Input.is_action_pressed("Backward")):
		_velocity += transform.basis.z * SPEED;

	# Left/Right player rotation
	if (Input.is_action_pressed("Left")):
		rotate_y(2 * delta);
	if (Input.is_action_pressed("Right")):
		rotate_y(-2 * delta);

	# add the gravity back into the current velocity vector
	_velocity.y = velocityY;
