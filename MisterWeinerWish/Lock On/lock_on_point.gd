extends Node3D

signal point_reached()

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	emit_signal("point_reached")
