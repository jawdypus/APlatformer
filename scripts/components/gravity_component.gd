class_name GravityComponent
extends Node

@export_subgroup("Settings")
@export var gravity: float = 900.0
@export var fallGravity: float = 1300.0


var is_falling: bool = false

func get_gravity(velocity: Vector2) -> float:
	if velocity.y < 0:
		return gravity
	else:
		return fallGravity

func handle_gravity(body: CharacterBody2D, delta: float):
	if not body.is_on_floor():
		body.velocity.y += get_gravity(body.velocity) * delta
		
	is_falling = body.velocity.y > 0 and not body.is_on_floor()
