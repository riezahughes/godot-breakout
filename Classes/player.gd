extends StaticBody2D
signal bat_hit

@export var speed = 400
@export var bat_size = 163
@export var padding = 50

var screen_size
var max_width



# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

#
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # the players movement vector
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 10 
	if Input.is_action_pressed("move_left"):
		velocity.x -= 10
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	
	position = position.clamp(Vector2.ZERO, Vector2(screen_size.x - bat_size, screen_size.y))
	
	$ColorRect.size.x = bat_size
	$CollisionShape2D.position.x = bat_size / 2
