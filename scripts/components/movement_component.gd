class_name MovementComponent
extends Node

@export_subgroup("Nodes")
@export var wall_slide_timer: Timer
@export var coyote_timer: Timer

@export_subgroup("Settings")
@export var speed: float = 100
@export var ground_accel_speed: float = 6.0
@export var ground_deccel_speed: float = 8.0
@export var air_accel_speed: float = 10.0
@export var air_deccel_speed: float = 3.0
@export var wall_slide_speed: float = 10.0
@export var wall_slide_falling_speed: float = 300.0

func handle_horizontal_movement(body: CharacterBody2D, direction: float) -> void:
	var velocity_change_speed: float = 0.0

	if body.is_on_floor():
		velocity_change_speed = ground_accel_speed if direction != 0 else ground_deccel_speed
	else:
		velocity_change_speed = air_accel_speed if direction != 0 else air_deccel_speed

	body.velocity.x = move_toward(body.velocity.x, direction * speed, velocity_change_speed)

##########################################################################
# 							WALL SLIDING								 #
##########################################################################

var last_frame_on_floor: bool = false

func is_allowed_to_hold_on_wall(body: CharacterBody2D, direction: float) -> bool:
	return body.is_on_wall_only() and coyote_timer.is_stopped() and direction != 0

func handle_coyote_time(body: CharacterBody2D):
	if last_frame_on_floor:
		coyote_timer.start()

func handle_wall_slide(body: CharacterBody2D, direction: float) -> void:
	if is_allowed_to_hold_on_wall(body, direction):
		body.velocity.y = wall_slide_speed

	handle_coyote_time(body)
	last_frame_on_floor = body.is_on_floor()
