extends Node2D
signal out_of_bounds
@export var ball_speed = 5
# Called when the node enters the scene tree for the first time.
var velocity = Vector2.ZERO
var screen_size


func _ready():
	screen_size = get_viewport_rect().size
	var rng = RandomNumberGenerator.new()
	velocity.x = 50
	velocity.y = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta * ball_speed
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if position.y == screen_size.y:
		out_of_bounds.emit()
