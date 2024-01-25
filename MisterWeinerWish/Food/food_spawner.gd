extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


func start_spawning_food() -> void:
	var spawn_points = get_tree().get_nodes_in_group("food_spawn_point")
	
	for spawn_point in spawn_points:
		pass
		
		
