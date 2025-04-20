extends Node

var game_has_been_reset = true
var ball_velocity = Vector2.ZERO
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	print("READY")
	screen_size = Vector2(1200, 800)
	_reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Ball Setup
	if game_has_been_reset == false:
		$MainBall.position += ball_velocity * $MainBall.ball_speed * delta
		$MainBall.position = $MainBall.position.clamp(Vector2.ZERO, screen_size)
	
	# Timer display on HUD
	$HUD/TimerCounter.text = str("%0.2f" % $StartTimer.time_left," s")

	# Start the game is the game has been reset. Should only run oncee
	if $StartTimer.is_stopped() && game_has_been_reset == true:
		print("Running start game in process")
		game_has_been_reset = false
		start_game()
	
	
func _reset():
	print("Resetting_Game");	
	print($BallStartPosition.position);
	$MainPlayer.position = $BatStartPosition.global_position 
	$MainBall.position = $BallStartPosition.position
	print($BallStartPosition.position)
	$HUD/TimerCounter.text = "3"
	$StartTimer.start(1)
	$MainBall.hide()
	$MainPlayer.hide()
	$HUD/TimerCounter.show()
	$HUD/MainMessageBox.show()
	stop_ball();
	game_has_been_reset = true
	
func start_game():
	print("Starting_Game");
	$MainBall.show()
	
	ball_velocity = ball_velocity.rotated(randf_range(0, 90))
	
	$MainPlayer.show()
	$HUD/TimerCounter.hide()
	$HUD/MainMessageBox.hide()
	
func stop_ball():
	ball_velocity.x = 50
	ball_velocity.y = 20

func _on_main_ball_out_of_bounds():
	print("OUT OF BOUNDS")
	print($MainBall.position)
	_reset()
	


func _on_level_boundary_area_entered(area: Area2D) -> void:
	if $MainBall.position.x >= screen_size.x:
		print("Hit the right")
		print(ball_velocity)
		ball_velocity = ball_velocity.rotated(90)
	elif $MainBall.position.x <= 0:
		print("Hit the left")
		print(ball_velocity)
		ball_velocity = ball_velocity.rotated(-90)
	elif $MainBall.position.y <= 0:
		print("Hit the top")
		print(ball_velocity)
		ball_velocity = ball_velocity.rotated(90)
	else:
		print("NOPE")
		print($MainBall.position.y)
