class_name PlayerController
extends CharacterBody3D

@export_group('Movement')
@export var max_speed: float = 4.0
@export var acceleration: float = 20.0
@export var braking: float = 20.0
@export var air_acceleration: float = 4.0
@export var jump_force: float = 5.0
@export var gravity_modifier: float = 1.5
@export var max_run_speed: float = 6.0
var is_running: bool = false

@export_group('Camera')
@export var look_sensitivity: float = 0.005
var camera_look_input: Vector2

@onready var camera: Camera3D = $Camera3D
@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity") * gravity_modifier

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _unhandled_input(event):
	pass