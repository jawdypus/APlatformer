class_name RoomTransitionCamera
extends Camera2D

@export_subgroup("Settings")
@export var player: CharacterBody2D

@onready var size: Vector2 = get_viewport_rect().size

@onready var m_CameraHorizontalMovement : int = size.x
@onready var m_CameraVerticalMovement : int = size.y

var m_CurrentRoom : Vector2 = Vector2.ZERO

var m_OriginOffset : Vector2 = Vector2.ZERO


func calculate_cell():
	var cellX = int(player.global_position.x / size.x)
	var cellY = int(player.global_position.y / size.y)
	
	while player.global_position.y < cellY * size.y:
		cellY -= 1
	
	var cellTopLeftX = cellX * size.x
	var cellTopLeftY = cellY * size.y
	
	var cameraX = cellTopLeftX + (size.x / 2) - (size.x / 2)
	var cameraY = cellTopLeftY + (size.y / 2) - (size.y / 2)
	
	print(cameraX)
	print(cameraY)
	
	m_OriginOffset.x = cameraX
	m_OriginOffset.y = cameraY
	

func _ready() -> void:
	calculate_cell()
	
	print("Player's position is " + str(player.global_position) + " Camera's positon is " + str(global_position))
	
	print(m_OriginOffset)
	
	set_position(m_OriginOffset)


func _UpdateCameraPosition(direction: Vector2) -> void:
	m_CurrentRoom += direction
	set_position(m_OriginOffset + m_CurrentRoom * Vector2(m_CameraHorizontalMovement, m_CameraVerticalMovement))
	print("Player's position is " + str(player.global_position) + " Camera's positon is " + str(global_position))


func _on_top_body_entered(body: CharacterBody2D):
	body.velocity.y += 10


func _on_top_body_exited(body: CharacterBody2D):
	_UpdateCameraPosition(Vector2.UP)


func _on_bottom_body_entered(body: CharacterBody2D):
	body.velocity.y -= 10


func _on_bottom_body_exited(body: CharacterBody2D):
	_UpdateCameraPosition(Vector2.DOWN)


func _on_left_body_entered(body: CharacterBody2D):
	body.velocity.x -= 10


func _on_left_body_exited(body: CharacterBody2D):
	_UpdateCameraPosition(Vector2.LEFT)


func _on_right_body_entered(body: CharacterBody2D):
	body.velocity.x += 10

func _on_right_body_exited(body: CharacterBody2D):
	_UpdateCameraPosition(Vector2.RIGHT)
