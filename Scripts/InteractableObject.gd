class_name IntractableObject
extends Node3D

@export var interact_prompt: String
@export var can_interact: bool = true

func _interact() -> void:
	if can_interact:
		print("Interacting with object")
