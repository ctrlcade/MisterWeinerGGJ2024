extends Node3D

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D
@export var player: CharacterBody3D

func _process(delta: float) -> void:
	if global_position.distance_to(player.global_position) < 10:
		toggle_glow(true)
	else:
		toggle_glow(false)
		
	if Input.is_action_pressed("stretch") && mesh_instance_3d.visible:
		player.global_position = global_position

func _on_area_3d_body_entered(body: Node3D) -> void:
	pass

func toggle_glow(isOn: bool) -> void:
	mesh_instance_3d.visible = isOn
