extends Node3D

@export var food_data : FoodData
@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D

func _ready() -> void:
	mesh_instance_3d.mesh = load(food_data.path_to_mesh)

func _physics_process(delta: float) -> void:
	mesh_instance_3d.rotate_y(delta)


func _on_area_3d_body_entered(body: Node3D) -> void:
	print("body entered")
	if (food_data.increases_time):
		GlobalSettings.TimeChange(food_data.growthAmount)
	else:
		var dog = get_tree().get_first_node_in_group("weenie")
		dog.grow_weiner() # Tell the dog to get larger!
		
	# Removes this food pickup from the scene
	queue_free()
