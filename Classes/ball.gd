extends Node2D

signal out_of_bounds

@export var ball_speed = 5

var velocity = Vector2.ZERO
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):

	if position.y == screen_size.y:
		out_of_bounds.emit()
	
