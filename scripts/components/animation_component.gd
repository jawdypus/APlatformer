class_name AnimationComponent
extends Node

@export_subgroup("Settings")
@export var sprite: Sprite2D
@export var animPlayer: AnimationPlayer

func handle_horizontal_flip(move_direction: float) -> void:
	if move_direction == 0:
		return
	
	sprite.flip_h = false if move_direction > 0 else true

func handle_move_animation(body: CharacterBody2D, move_direction: float) -> void:
	handle_horizontal_flip(move_direction)
	
	if body.velocity.x != 0:
		animPlayer.play("run")
	if body.velocity.y != 0:
		animPlayer.play("jump")
	else:
		animPlayer.play("idle")
