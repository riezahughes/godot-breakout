extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$MainPlayer.position = $BatStartPosition.global_position 
	$MainBall.position = $BallStartPosition.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _reset_ball():
	$MainBall.position = $BallStartPosition.global_position


func _on_main_ball_out_of_bounds():
	_reset_ball()
