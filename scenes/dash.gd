extends Node2D

@onready var dashTimer = $DashTimer

func startDash(duration):
	dashTimer.wait_time = duration
	dashTimer.start()
	
func is_dashing():
	return !dashTimer.is_stopped()
