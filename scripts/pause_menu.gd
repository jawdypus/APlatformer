extends Control

signal resume_game

func _on_resume_pressed():
	self.hide()
	Engine.time_scale = 1
	resume_game.emit()


func _on_quit_pressed():
	get_tree().quit()
