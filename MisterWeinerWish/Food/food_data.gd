extends Resource
class_name FoodData

# Meshes cannot be stored in a custom resource so the path to the mesh must be stored instead
@export var path_to_mesh : String = "res://Food/Foods/Food Meshes/apple.tres"
# How much the dog will grow on consumption
@export_range(-10, 10) var growthAmount : int = 0
# If enabled, eating this food will increase time by growthAmount instead of making the dog longer
@export var increases_time : bool = false
