extends StaticBody2D

func _on_area_2d_body_entered(body: CharacterBody2D):
	print(body.velocity.x)
	if body.velocity.x > 100 or body.velocity.x < -100:
		queue_free()
