extends Node

const pickup = preload("res://Food/food_pickup.tscn")

@export var foods: Array[FoodData]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	start_spawning_food()


func start_spawning_food() -> void:
	var spawn_points = get_tree().get_nodes_in_group("food_spawn_point")
	var random = RandomNumberGenerator.new()
	for spawn_point: Marker3D in spawn_points:
		var food = foods[random.randi_range(0, foods.size() - 1)]
		var food_pickup = pickup.instantiate()
		food_pickup.food_data = food
		food_pickup.position = spawn_point.position
		add_child(food_pickup)
