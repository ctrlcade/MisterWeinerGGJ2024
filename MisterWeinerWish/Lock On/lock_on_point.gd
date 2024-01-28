extends Node3D
class_name LockOnPoint

signal point_reached()

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D

func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	emit_signal("point_reached")


func toggle_glow(isOn: bool) -> void:
	mesh_instance_3d.show()
