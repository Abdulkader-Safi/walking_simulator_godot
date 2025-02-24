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
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(_delta: float) -> void:
	# Movement
	var move_input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	# velocity = Vector3(move_input.x, 0, move_input.y).normalized() * max_speed
	var move_dir = (transform.basis * Vector3(move_input.x, 0, move_input.y)).normalized()
	velocity = move_dir * max_speed

	move_and_slide()

	# Camera Look
	rotate_y(- camera_look_input.x * look_sensitivity)

	camera.rotate_x(- camera_look_input.y * look_sensitivity)
	camera.rotation.x = clamp(camera.rotation.x, -1.5, 1.5)
	camera_look_input = Vector2.ZERO

func _unhandled_input(event) -> void:
	if event is InputEventMouseMotion:
		camera_look_input = event.relative