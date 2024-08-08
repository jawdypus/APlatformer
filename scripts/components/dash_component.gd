class_name DashComponent
extends Node

@export_subgroup("Nodes")
@export var dashTimer: Timer

@export_subgroup("Settings")
@export var dash_distance: float = 400.0

var dash_direction: Vector2 = Vector2(1, 0)
var can_dash: bool = true
var is_dashing: bool = false

func is_allowed_to_dash(want_to_dash: bool) -> bool:
	return want_to_dash and can_dash

func set_dash_direction(body: CharacterBody2D) -> void:
	dash_direction = body.velocity.normalized()
	print(dash_direction)

func handle_dash(body: CharacterBody2D, want_to_dash: bool) -> void:
	set_dash_direction(body)
	if is_allowed_to_dash(want_to_dash):
		dash(body)

func dash(body: CharacterBody2D):
	body.velocity.x += dash_distance * dash_direction.x