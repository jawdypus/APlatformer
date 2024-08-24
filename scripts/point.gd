extends StaticBody2D

@export_subgroup("Node")
@export var sprite: Sprite2D
@export var sound: AudioStreamPlayer2D
@export var collider: CollisionShape2D

var inactive_frame = 5

func _on_area_2d_body_entered(body: CharacterBody2D):
	if !collider.disabled:
		sprite.frame = inactive_frame
		sound.play()
		collider.disabled = true
