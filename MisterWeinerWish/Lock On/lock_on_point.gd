extends Node3D

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D
@export var player: CharacterBody3D
var dog

# Does the hiding of the glow here so that you can see where they are placed in the editor easily.
func _ready() -> void:
	mesh_instance_3d.hide()
	dog = get_tree().get_first_node_in_group("weenie")

# Hides checks to see if the dog is nearby based on its length to see if it should glow.
func _process(delta: float) -> void:
	if global_position.distance_to(dog.global_position) < (dog.blorb() * 2):
		mesh_instance_3d.visible = true
	else:
		mesh_instance_3d.visible = false

# As far as I'm aware, have to use player instead of dog to do this movement properly.
# Player can only move to a glowing lock-on-point.
func _physics_process(delta: float) -> void:
	var speed = 20
	if Input.is_action_pressed("stretch") && mesh_instance_3d.visible:
		player.global_position = player.global_position.move_toward(global_position, delta * speed)
