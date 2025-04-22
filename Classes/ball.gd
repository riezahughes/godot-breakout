extends CharacterBody2D

signal out_of_bounds

var screen_size

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
	

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if position.y == screen_size.y:
		out_of_bounds.emit()
	
