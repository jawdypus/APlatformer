extends TileMap

func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		modulate.a = 0.5


func _on_area_2d_body_exited(body):
	if body.get_name() == "Player":
		modulate.a = 1
