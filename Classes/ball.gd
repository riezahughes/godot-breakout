extends Node2D

signal out_of_bounds
signal wall_hit

@export var ball_speed = 5

var velocity = Vector2.ZERO
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	var rng = RandomNumberGenerator.new()
	rotate(randf_range(-180, 180))
	#velocity.x = 50
	#velocity.y = 20

#func bounce(x_pos, y_pos):
	#print(velocity)
	#if position.y == 0:
		#rotate(180)
		#velocity.x = x_pos - randf_range(-100, 100)
		#velocity.y  = y_pos - randf_range(0, 100)
		
	#if position.x == 0:
		#rotate(180)
		#velocity.x = x_pos - randf_range(0, 100)
		#velocity.y  = y_pos - randf_range(0, 100)
	
	#if position.x >= screen_size.x:
		#rotate(180)
		#velocity.x = x_pos - randf_range(0, 100)
		#velocity.y  = y_pos - randf_range(-100, 100)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position += velocity * ball_speed * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
	
	if position.y == screen_size.y:
		out_of_bounds.emit()
#func bounce():
	#veloci

func _on_area_entered(area: Area2D) -> void:
	#bounce(velocity.x, velocity.y)
	wall_hit.emit()
	
