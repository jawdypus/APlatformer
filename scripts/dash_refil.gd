extends StaticBody2D

@export var sprite: Sprite2D 

var active_frame: int = 4
var inactive_frame: int = 5

func _on_area_2d_body_entered(body: CharacterBody2D):
	sprite.frame = inactive_frame
