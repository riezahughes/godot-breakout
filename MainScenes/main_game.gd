extends Node

var game_has_been_reset = true
var ball_speed = 10
var lives = 2
var level = 1
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = Vector2(1200, 800)
	_reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Ball Setup
	#if game_has_been_reset == false:
		#$MainBall.position += $MainBall.velocity * 5 * delta
		#$MainBall.position = $MainBall.position.clamp(Vector2.ZERO, screen_size)
	
	# Timer display on HUD
	$HUD/TimerCounter.text = str("%0.2f" % $StartTimer.time_left," s")
	$HUD/LivesLabel.text = str("Lives: ", lives)
	$HUD/LevelLabel.text = str("Level: ", level)

	# Start the game is the game has been reset. Should only run oncee
	if $StartTimer.is_stopped() && game_has_been_reset == true:
		game_has_been_reset = false
		start_game()
		
	if $MainBall.position.y >= screen_size.y:
		if lives > 0:
			print("OUT OF BOUNDS")
			lives -= 1
			_reset()

	
func _reset():
	if lives > 0:
		print("Resetting the Game...");	
		print($BallStartPosition.position);
		$MainPlayer.position = $BatStartPosition.global_position 
		$MainBall.position = $BallStartPosition.position
		print($BallStartPosition.position)
		$HUD/TimerCounter.text = "3"
		$StartTimer.start(1)
		$CurrentBlocks.hide()
		$MainBall.hide()
		$MainPlayer.hide()
		$HUD/TimerCounter.show()
		$HUD/MainMessageBox.show()
		stop_ball()
		game_has_been_reset = true
	else: 
		game_over()
	
func game_over():
	$MainPlayer.position = $BatStartPosition.global_position 
	$MainBall.position = $BallStartPosition.position
	$CurrentBlocks.hide()
	$MainBall.hide()
	$MainPlayer.hide()
	$HUD/MainMessageBox.text = "Game Over!"
	$HUD/MainMessageBox.show()
	
func start_game():
	print("Starting the game...");
	$MainBall.show()
	$MainBall.velocity.x = 50 * ball_speed
	$MainBall.velocity.y = 50 * ball_speed
	$MainBall.velocity = $MainBall.velocity.rotated(randf_range(0, 90))
	$CurrentBlocks.show()
	$MainPlayer.show()
	$HUD/TimerCounter.hide()
	$HUD/MainMessageBox.hide()
	
func stop_ball():
	$MainBall.velocity.x = 0
	$MainBall.velocity.y = 0


#func _on_level_boundary_area_entered(area: Area2D) -> void:
	#if(area.name == "MainPlayer"):
		#return
	#var posNormalise = $MainBall.position.normalized()
	#if $MainBall.position.x >= screen_size.x:
		#$MainBall.velocity = $MainBall.velocity.bounce(posNormalise)
	#else:
		#$MainBall.velocity = $MainBall.velocity.reflect(posNormalise)
		#
#
#
#
#func _on_main_player_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#if area.name == "LevelBoundary":
		#return
	#var posNormalise = $MainPlayer.position.normalized()
	#$MainBall.velocity = $MainBall.velocity.bounce(-posNormalise)
#
#
#func _on_target_block_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#if area.name == "LevelBoundary":
		#return
	#var posNormalise = $MainPlayer.position.normalized()
	#$MainBall.velocity = $MainBall.velocity.reflect(posNormalise)
