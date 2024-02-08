extends Node3D

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D
@export var player: CharacterBody3D

func _process(delta: float) -> void:
	if global_position.distance_to(player.global_position) < 10:
		mesh_instance_3d.visible = true
	else:
		mesh_instance_3d.visible = false
		
	if Input.is_action_pressed("stretch") && mesh_instance_3d.visible:
		player.global_position = global_position
