extends TileMap

func _on_area_2d_body_entered(body: CharacterBody2D):
	modulate.a = 0.5


func _on_area_2d_body_exited(body: CharacterBody2D):
	modulate.a = 1
